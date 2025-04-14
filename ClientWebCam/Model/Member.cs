using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ClientWebCam.Model
{
    [Serializable]
    public class Member
    {
        public int Num { get; set; }
        //primary key
        private string _user_id = string.Empty;
        public string user_id
        {
            get { return _user_id; }
            set { _user_id = value; }
        }

        private string _pwd = string.Empty;
        public string pwd
        {
            get { return _pwd; }
            set { _pwd = value; }
        }
        private string _name = string.Empty;
        public string name
        {
            get { return _name; }
            set { _name = value; }
        }
        private string _age = string.Empty;
        public string age
        {
            get { return _age; }
            set { _age = value; }
        }
        private string _gender = string.Empty;
        public string gender
        {
            get { return _gender; }
            set { _gender = value; }
        }
        private string _height = string.Empty;
        public string height
        {
            get { return _height; }
            set { _height = value; }
        }
        private string _weight = string.Empty;
        public string weight
        {
            get { return _weight; }
            set { _weight = value; }
        }
        private string _phonenum = string.Empty;
        public string phonenum
        {
            get { return _phonenum; }
            set { _phonenum = value; }
        }
        private string _type = string.Empty;
        public string type
        {
            get { return _type; }
            set { _type = value; }
        }

        private Byte[] _file;
        public Byte[] file
        {
            get { return _file; }
            set { _file = value; }
        }
        private string _ResultMeasure = string.Empty;
        public string ResultMeasure
        {
            get { return _ResultMeasure; }
            set { _ResultMeasure = value; }
        }

    }
}
