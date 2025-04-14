using ClientWebCam.Model;
using System.Net.Sockets;
using System.Windows;



namespace ClientWebCam
{
    /// <summary>
    /// Measurement.xaml에 대한 상호 작용 논리
    /// </summary>


    // OpenCvSharp 설치 시 Window를 명시적으로 사용해 주어야 함 (window -> System.Windows.Window)
    public partial class Measurement : Window
    {
        Member mem = new Member();
        Socket client;

       

        public Measurement(Socket obj, Member obj2)
        {
            client = obj;
            mem = obj2;

            
            InitializeComponent();
            //데이터 값 넘길땐 ui업데이트 후에 넘기기
            txt_user.Text = mem.user_id;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Measuring ms = new Measuring(client, mem);
            Close();
            ms.Show();
        }

    }
}
