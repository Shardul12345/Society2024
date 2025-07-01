using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass
{
    public class Notice
    {
        private int nid;
        private DateTime date;
        private string name;
        private string description;
        private DateTime validto;
        private string societyid;
        private string Operation;
        private string Result;


        public int N_Id
        {
            get { return nid; }
            set { nid = value; }
        }
        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        public DateTime Valid_To
        {
            get { return validto; }
            set { validto = value; }
        }
        public String Society_Id
        {
            get { return societyid; }
            set { societyid = value; }
        }
        public string Sql_Operation
        {
            get { return Operation; }
            set { Operation = value; }
        }
        public string Sql_Result
        {
            get { return Result; }
            set { Result = value; }
        }

    }
}