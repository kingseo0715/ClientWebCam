# 소켓을 사용하기 위해서는 socket을 import해야 한다.
import socket, threading
import sqlite3
import json
import base64
import numpy as np
import tensorflow as tf

from datetime import datetime
from PIL import Image
from tensorflow.keras.preprocessing.image import img_to_array

from Model.Member import Member
from Model.UserInfo import UserInfo

#디비버 연동 데이터베이스 생성
#디비 연동을 위해 커서 함수 생성
# conn = sqlite3.connect("WebCam.db")
# c = conn.cursor()
# c. # c.execute("""CREATE TABLE User(name varchar(30), user_id varchar(30) PRIMARY KEY, pwd varchar(30), phonenum varchar(30), age varchar(10), gender varchar(30), height varchar(30), weight varchar(30))""")
# c.execute("""CREATE TABLE Result(user_id varchar(30), MeasureResult varchar(30), FOREIGN KEY (user_id) REFERENCES Users(user_id))""")


BUFFER_SIZE = 5000000000
# data = b""

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind(('', 9999))
server_socket.listen()

#딥러닝 학습모델
#def mask(f, mem):
    # # png 파일 열어서 L(256단계 흑백이미지)로 변환
    # image_path = Image.open('mask1.png')
    #
    # # 이미지를 784개 흑백 픽셀로 사이즈 변환
    # # img = np.resize(img, (1, 783))
    # img = image_path.resize((224, 224))
    # img_array = img_to_array(img)  # 이미지 배열로 변환
    # # 데이터를 모델에 적용할 수 있도록 가공
    # # 이미지를 numpy 배열로 변환
    # img_array = np.array(img_array)
    # # 이미지를 0~1 범위로 정규화
    # img_array = img_array / 255.0
    # images = np.expand_dims(img_array, axis=0)
    # # 모델 불러오기
    # model = tf.keras.models.load_model('C:\\Users\\lms5\\PycharmProjects\\ServerWebCam\\takemask.keras')
    #
    # # 클래스 예측 함수에 가공된 테스트 데이터 넣어 결과 도출
    # res = (model.predict(images) > 0.5).astype("int32")
    # str_res = "정상 착용"
    # print(res)
    # if(res==[[1]]):
    #     client_socket.send(json.dumps({"Num": 1,"user_id": mem["user_id"], "ResultMeasure": str_res}).encode('utf-8'))  # 키워드 인수로 전송해야 함.
    #
    # else:
    #     response1 = json.dumps({"Num": 2}).encode()
    #     client_socket.send(b"1000000000000000000")

def binder(client_socket, addr):
    # global data
    num = 1

    print('Connected by', addr)
    try:
        while True:
            users = client_socket.recv(BUFFER_SIZE)
            # if not users:
            #     break
            # data += users
            mem = json.loads(users.decode())
            print(f"Parsed JSON: {mem}")
            conn = sqlite3.connect("WebCam.db")
            c = conn.cursor()

            if mem["type"] == 'Join' :
                sql = """insert into Users(name, user_id, pwd , phonenum, age, gender, height, weight) values(?,?,?,?,?,?,?,?)"""
                c.execute(sql, (
                mem["name"], mem["user_id"], mem["pwd"], mem["phonenum"], mem["age"], mem["gender"],
                mem["height"], mem["weight"]))


            elif mem["type"] == 'Login' :
                sql = "SELECT user_id, pwd FROM Users WHERE user_id = ? and pwd = ?"
                c.execute(sql, (mem["user_id"], mem["pwd"],))
                result = c.fetchone()
                if (result) :
                    response = json.dumps({"Num": 1, "user_id": mem["user_id"], "pwd": mem["pwd"]}).encode('utf-8') #키워드 인수로 전송해야 함.
                    print("전송 성공")
                else :
                    response = json.dumps({"Num": 2}).encode()

                client_socket.sendall(response)

            elif mem["type"] == 'File' :
                # print(f"Parsed JSON: {mem["file"]}")
                #sql = """insert into Result(user_id, MeasureResult) values(?,?)"""
                #c.execute(sql, (mem["user_id"], mem["file"]))

                now = datetime.now()
                filetime = now.strftime("%Y%m%d_%H%M%S")
                folder = (f"C:\\Users\\lms5\\Desktop\\Image\\{filetime}.png")
                f = open(folder, 'wb')
                file = base64.b64decode(mem["file"])

                #딥러닝테스트용 이미지저장
                # filetime = now.strftime("%Y%m%d_%H%M%S")
                # folder = (f"C:\\Users\\lms5\\Desktop\\testmask\\mask{num}.png")
                # f = open(folder, 'wb')
                # file = base64.b64decode(mem["file"])


                f.write(file)
                f.close()
                print("이미지저장 성공")

                mask(folder, mem)
                num += 1


            conn.commit()
            conn.close()

            # msg = "echo : " + json.dumps(mem)
            # data = msg.encode()
            # length = len(data)
            # client_socket.sendall(length.to_bytes(4, byteorder='little'))
            # client_socket.sendall(data)
    except json.JSONDecodeError:
        print("except : ", addr)
    finally:
        client_socket.close()

try:
    while True:
        client_socket, addr = server_socket.accept()
        th = threading.Thread(target=binder, args=(client_socket, addr))
        th.start()
except:
    print("server")
finally:
    server_socket.close()


