﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass.Master_Dataclass
{
    public class Search_Society
    {
        private int sid;
        private string name;
        private DateTime establishdate;
        private string registrationno;
        private string offaddress1;
        private string offaddress2;
        private string contactno1;
        private string email;
        private string societyid;
        private string city;
        private int stateid;
        private string pincode;
        private string tanno;
        private string gstinno;
        private string panno;
        private string Operation;
        private string Result;



        public int S_Id
        {
            get { return sid; }
            set { sid = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public DateTime Establish_Date
        {
            get { return establishdate; }
            set { establishdate = value; }
        }
        public string Registration_No
        {
            get { return registrationno; }
            set { registrationno = value; }
        }
        public string Off_Address1
        {
            get { return offaddress1; }
            set { offaddress1 = value; }
        }
        public string Off_Address2
        {
            get { return offaddress2; }
            set { offaddress2 = value; }
        }
        public string Contact_No1
        {
            get { return contactno1; }
            set { contactno1 = value; }
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
        public string City
        {
            get { return city; }
            set { city = value; }
        }
        public int State_Id
        {
            get { return stateid; }
            set { stateid = value; }
        }
        public string Pincode
        {
            get { return pincode; }
            set { pincode = value; }
        }
        public string Tan_No
        {
            get { return tanno; }
            set { tanno = value; }
        }
        public string Gstin_No
        {
            get { return gstinno; }
            set { gstinno = value; }
        }
        public string Pan_No
        {
            get { return panno; }
            set { panno = value; }
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