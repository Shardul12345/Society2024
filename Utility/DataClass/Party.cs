using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass
{
    public class Party
    {
        private int pid;
        private int oid;
        private DateTime bookdate;
        private DateTime fromdate;
        private DateTime todate;
        private string name;
        private int flatno;
        private string address;
        private string contact;
        private int societyin;
        private DateTime fromtime;
        private DateTime totime;
        private string societyid;
        private string Operation;
        private string Result;

        public int P_Id
        {
            get { return pid; }
            set { pid = value; }
        }
        public int O_Id
        {
            get { return oid; }
            set { oid = value; }
        }
        public DateTime Book_Date
        {
            get { return bookdate; }
            set { bookdate = value; }
        }
        public DateTime From_Date
        {
            get { return fromdate; }
            set { fromdate = value; }
        }
        public DateTime To_Date
        {
            get { return todate; }
            set { todate = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public int Flat_No
        {
            get { return flatno; }
            set { flatno = value; }
        }
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        public string Contact
        {
            get { return contact; }
            set { contact = value; }
        }
        public int Society_In
        {
            get { return societyin; }
            set { societyin = value; }
        }
        public DateTime From_Time
        {
            get { return fromtime; }
            set { fromtime = value; }
        }
        public DateTime To_Time
        {
            get { return totime; }
            set { totime = value; }
        }
        public string Society_Id
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