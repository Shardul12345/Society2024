using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass
{
    public class Meeting
    {

        private int meetid;
        private int meetexid;
        private DateTime meetingdate;
        private DateTime meetingtime;
        private string subject;
        private string details;
        private string societyid;
        private string Operation;
        private string Result;

        public int Meet_Id
        {
            get { return meetid; }
            set { meetid = value; }
        }
        public int Meet_Ex_Id
        {
            get { return meetexid; }
            set { meetexid = value; }
        }
        public DateTime Meeting_Date
        {
            get { return meetingdate; }
            set { meetingdate = value; }
        }
        public DateTime Meeting_Time
        {
            get { return meetingtime; }
            set { meetingtime = value; }
        }
        public string Subject
        {
            get { return subject; }
            set { subject = value; }
        }
        public string Details
        {
            get { return details; }
            set { details = value; }
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