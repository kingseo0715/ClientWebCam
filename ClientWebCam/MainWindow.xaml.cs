using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ClientWebCam.Model;
using System.Net.Sockets;
using Newtonsoft.Json;

namespace ClientWebCam;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    Member mem = new Member();
    Socket client;
    

    public MainWindow()
    {
        InitializeComponent();
        Start();
        string text = TxT_pw.Password;
        
    }
    public void Start()
    {
        client = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        
        client.Connect(new IPEndPoint(IPAddress.Parse("127.0.0.1"), 9999));
        
    }

    public static void Send_UserInfo(object obj, Member mem)
    {
        Socket client = (Socket)obj;
        string datas = JsonConvert.SerializeObject(mem);
        byte[] jsonByte = Encoding.UTF8.GetBytes(datas);
        client.Send(jsonByte);
        byte[] responseBuffer = new byte[1024];

    }
    public static Member Receive_UserInfo(object obj, Member mem)
    {
        Socket client = (Socket)obj;
        byte[] data = new byte[1024];

        int byteRead = client.Receive(data, data.Length, SocketFlags.None);
        string datas = Encoding.UTF8.GetString(data, 0, byteRead);
        mem = JsonConvert.DeserializeObject<Member>(datas);
        return mem;
        
    }

    private void btn_login_Click(object sender, RoutedEventArgs e)
    {
        mem.user_id = TxT_id.Text;
        mem.pwd = TxT_pw.Password;
        mem.type = "Login";
        Send_UserInfo(client, mem);
        mem = Receive_UserInfo(client, mem);
        if (mem.Num == 1)
        {
            MessageBox.Show("로그인 성공");
            Measurement ms = new Measurement(client, mem);
            Close();
            ms.Show();
        }
        else
        {
            MessageBox.Show("로그인 실패 다시 입력해주세요");
        }
    }

    private void btn_join_Click(object sender, RoutedEventArgs e)
    {
        Join jo = new Join(client, mem);
        Close();
        jo.Show();
    }


    private void TxT_id_GotFocus(object sender, RoutedEventArgs e)
    {
        TxT_id.Clear();
    }

    private void TxT_pw_GotFocus(object sender, RoutedEventArgs e)
    {
        TxT_pw.Clear();
    }
}