using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

// OpenCV 사용을 위한 using
using OpenCvSharp;
using OpenCvSharp.WpfExtensions;

using System.Windows.Threading;
using System.Net.Sockets;
using ClientWebCam.Model;
using System.IO;
using System.IO.Pipes;
using System.Reflection.PortableExecutable;
using System.Text.Json;
using Newtonsoft.Json;

namespace ClientWebCam
{
    /// <summary>
    /// Measuring.xaml에 대한 상호 작용 논리
    /// </summary>
    
    //필요한 변수 선언
   

    public partial class Measuring : System.Windows.Window
    {
        VideoCapture cam;
        Mat frame;
        DispatcherTimer timer;
        bool is_initCam, is_initTimer;

        Socket client;
        Member mem = new Member();


        public Measuring(Socket obj, Member obj2)
        {
            client = obj;
            mem = obj2;

            InitializeComponent();

        }

        private void windows_load(object sender, RoutedEventArgs e) 
        {
            is_initCam = init_camera();
            is_initTimer = init_Timer(0.01); 

            if (is_initTimer && is_initCam) timer.Start();
        }

        private bool init_Timer(double interval_ms) 
        {
            try
            {
                timer = new DispatcherTimer();
                timer.Interval = TimeSpan.FromMilliseconds(interval_ms);
                timer.Tick += new EventHandler(timer_tick);
                return true;
            }
            catch
            {
                return false;
            }
        }

        private bool init_camera()
        {
            try
            {
                // 0번 카메라로 VideoCapture 생성 (카메라가 없으면 안됨)
                cam = new VideoCapture(0);
                cam.Set(VideoCaptureProperties.FrameHeight, 450);
                cam.Set(VideoCaptureProperties.FrameWidth, 300);

                // 카메라 영상을 담을 Mat 변수 생성
                frame = new Mat();

                return true;
            }
            catch
            {
                return false;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (!frame.Empty())
            {
                string filePath = "C:\\Users\\lms5\\source\\repos\\TestWebcam\\TestWebcam\\save.jpg";
                Cv2.ImWrite(filePath, frame); // 정상적으로 저장
                
                mem.type = "File";

                FileStream filestream = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                BinaryReader reader = new BinaryReader(filestream);
                mem.file = reader.ReadBytes((int)filestream.Length); //전송용
                
               
                MainWindow.Send_UserInfo(client, mem);
                


                //받아내는  코드
                mem = MainWindow.Receive_UserInfo(client, mem);
                
                
                if (mem.Num == 1)
                {
                    //Thread.Sleep(2000); //2초간 슬립
                    Result rs = new Result(client, mem);
                    Close();
                    rs.Show();
                }
                

                

            }
            else
            {
                MessageBox.Show("캡처된 이미지가 없습니다.");
            }
        }

        private void timer_tick(object sender, EventArgs e)
        {
            // 0번 장비로 생성된 VideoCapture 객체에서 frame을 읽어옴
            cam.Read(frame);
            Cv2.Resize(frame, frame, new OpenCvSharp.Size(300, 450));

            // 읽어온 Mat 데이터를 Bitmap 데이터로 변경 후 컨트롤에 그려줌
            Dispatcher.Invoke(() =>
            {
                Cam_1.Source = WriteableBitmapConverter.ToWriteableBitmap(frame);
            });

           

        }
    
    }
}
