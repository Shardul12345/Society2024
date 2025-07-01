using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass
{
    public class Event
    {
        private int eventid;
        private DateTime fromdate;
        private DateTime todate;
        private string eventname;
        private string description;
        private string societyid;
        private string Operation;
        private string Result;

        public int Event_Id
        {
            get { return eventid; }
            set { eventid = value; }
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
        public string Event_Name
        {
            get { return eventname; }
            set { eventname = value; }
        }
        public string Description
        {
            get { return description; }
            set { description = value; }
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