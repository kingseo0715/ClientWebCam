using ClientWebCam.Model;
using Microsoft.Win32;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Sockets;
using System.Reflection.Metadata;
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

namespace ClientWebCam
{
    /// <summary>
    /// Result.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class Result : Window
    {
        Socket client;
        Member mem = new Member();

        public Result(Socket obj, Member obj2)
        {
            client = obj;
            mem = obj2;


            InitializeComponent();

            MeasureResult mrs = new MeasureResult();

            txt_user.Text = mem.user_id;

            
            byte[] data = new byte[1024];
            int byteRead = client.Receive(data, data.Length, SocketFlags.None);
            string datas = Encoding.UTF8.GetString(data, 0, byteRead);
            mrs = JsonConvert.DeserializeObject<MeasureResult>(datas);

            predictListview.ItemsSource = mrs.predictions;

        }
       

    }
}
