using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Sockets;
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
using ClientWebCam.Model;

namespace ClientWebCam
{
    /// <summary>
    /// Login.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Join : Window
    {
        Member mem = new Member();
        Socket client;

        public Join(object obj, object obj2)
        {
            //tcpClient = (TcpClient)obj;
            //user = (User)obj2;

            client = (Socket)obj;
            mem = (Member)obj2;

            InitializeComponent();

        }

        private void Btn_Join_Click(object sender, RoutedEventArgs e)
        {
            mem.name = TxT_Name.Text;
            mem.user_id = TxT_Id.Text;
            mem.pwd = TxT_Pw.Text;
            mem.phonenum = TxT_PN.Text;

            mem.age = txt_age.Text;
            mem.gender = txt_gender.Text;
            mem.height = txt_height.Text;
            mem.weight = txt_weight.Text;

            mem.type = "Join";
            MainWindow.Send_UserInfo(client, mem);

            MessageBox.Show("회원가입 성공!");

            MainWindow mw = new MainWindow();
            Close();
            mw.Show();

            
        }
    }
}
