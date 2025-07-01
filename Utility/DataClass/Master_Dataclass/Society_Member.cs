using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass.Master_Dataclass
{
    public class Society_Member
    {
        private int memid;
        private string name;
        private string jobroll;
        private string address1;
        private string address2;
        private string contactno;
        private string email;
        private string societyid;
        private string Operation;
        private string Result;



        public int Mem_Id
        {
            get { return memid; }
            set { memid = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Job_Roll
        {
            get { return jobroll; }
            set { jobroll = value; }
        }
        public string Address1
        {
            get { return address1; }
            set { address1 = value; }
        }
        public string Address2
        {
            get { return address2; }
            set { address2 = value; }
        }
        public string Contact_No
        {
            get { return contactno; }
            set { contactno = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
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