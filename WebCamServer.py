import socket, threading
import sqlite3
import json
import base64
import requests
from datetime import datetime

BUFFER_SIZE = 5000000000


server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind(('', 9999))
server_socket.listen()

# 모델 uri 가져오면 끝에 uri를 image로 바꾸기
API_URL = "https://japaneast.api.cognitive.microsoft.com/customvision/v3.0/Prediction/621e6c5c-9935-4a2b-8cc7-1dc3faa93d41/classify/iterations/Iteration1/image"
API_KEY = "344d5c1e08bc42b08e03e08b160e52dd"
HEADERS = {"Prediction-key": API_KEY, "Content-Type": "application/octet-stream"}


def make_prediction(file_path):
    with open(file_path, "rb") as file:
        response = requests.post(API_URL, headers=HEADERS, data=file.read())

    if response.status_code == 200:
        return response.json() #제이슨 데이터를 딕셔너리 형태로 반환
    else:
        return {"error": "Prediction request failed"}


def binder(client_socket, addr):
    print('Connected by', addr)
    try:
        while True:
            users = client_socket.recv(BUFFER_SIZE)
            mem = json.loads(users.decode())
            print(f"Parsed JSON: {mem}")

            conn = sqlite3.connect("WebCam.db")
            c = conn.cursor()

            if mem["type"] == 'Join':
                sql = """INSERT INTO Users(name, user_id, pwd, phonenum, age, gender, height, weight) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"""
                c.execute(sql, (
                    mem["name"], mem["user_id"], mem["pwd"], mem["phonenum"], mem["age"], mem["gender"],
                    mem["height"], mem["weight"]))

            elif mem["type"] == 'Login':
                sql = "SELECT user_id, pwd FROM Users WHERE user_id = ? AND pwd = ?"
                c.execute(sql, (mem["user_id"], mem["pwd"]))
                result = c.fetchone()
                response = json.dumps(
                    {"Num": 1, "user_id": mem["user_id"], "pwd": mem["pwd"]}) if result else json.dumps({"Num": 2})
                client_socket.sendall(response.encode())

            elif mem["type"] == 'File':
                now = datetime.now()
                filetime = now.strftime("%Y%m%d_%H%M%S")
                file_path = f"C:\\Users\\lms5\\Desktop\\Image\\{filetime}.png"

                with open(file_path, 'wb') as f:
                    f.write(base64.b64decode(mem["file"]))
                print("이미지 저장 성공")
                client_socket.send(json.dumps({"Num": 1, "user_id": mem["user_id"]}).encode('utf-8'))  # 키워드 인수로 전송해야 함.


                result_data = make_prediction(file_path)
                predictions = result_data.get("predictions", []) #딕셔너라 값 추출하기
                client_socket.send(json.dumps({"predictions" : predictions}).encode('utf-8'))
                print(predictions)
                take_mask = "정상 착용"
                non_mask = "미착용"
                for item in predictions:
                    if item['tagName'] == 'take_mask' and item['probability'] >= 0.5:
                        print("마스크 착용")
                        sql = """insert into Result(user_id, MeasureResult) values (?,?)"""
                        c.execute(sql, (mem["user_id"], take_mask))
                        break

                    else:
                        print("마스크 미착용")
                        sql = """insert into Result(user_id, MeasureResult) values (?,?)"""
                        c.execute(sql, (mem["user_id"], non_mask))
                        break

            conn.commit()
            conn.close()
    except json.JSONDecodeError:
        print("JSON Decode Error: ", addr)
    finally:
        client_socket.close()


try:
    while True:
        client_socket, addr = server_socket.accept()
        th = threading.Thread(target=binder, args=(client_socket, addr))
        th.start()
except Exception as e:
    print("Server error:", e)
finally:
    server_socket.close()

