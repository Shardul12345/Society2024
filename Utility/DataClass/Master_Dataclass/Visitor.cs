﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass.Master_Dataclass
{
    public class Visitor
    {

        private int vid;
        private string vname;
        private string vtype;
        private string orgname;
        private string orgaddr1;
        private string orgaddr2;
        private string orgtel;
        private int fid;
        private string vpername;
        private DateTime indate;
        private DateTime outdate;
        private DateTime intime;
        private DateTime outtime;
        private string societyid;
        private int bid;
        private int wid;
        private string Operation;
        private string Result;



        public int V_Id
        {
            get { return vid; }
            set { vid = value; }
        }
        public string V_Name
        {
            get { return vname; }
            set { vname = value; }
        }
        public string V_Type
        {
            get { return vtype; }
            set { vtype = value; }
        }
        public string Org_Name
        {
            get { return orgname; }
            set { orgname = value; }
        }
        public string Org_Addr1
        {
            get { return orgaddr1; }
            set { orgaddr1 = value; }
        }
        public string Org_Addr2
        {
            get { return orgaddr2; }
            set { orgaddr2 = value; }
        }
        public string Org_Tel
        {
            get { return orgtel; }
            set { orgtel = value; }
        }
        public int F_Id
        {
            get { return fid; }
            set { fid = value; }
        }
        public string V_Per_Name
        {
            get { return vpername; }
            set { vpername = value; }
        }
        public string Society_Id
        {
            get { return societyid; }
            set { societyid = value; }
        }
        public DateTime In_Date
        {
            get { return indate; }
            set { indate = value; }
        }
        public DateTime Out_Date
        {
            get { return outdate; }
            set { outdate = value; }
        }
        public DateTime In_Time
        {
            get { return intime; }
            set { intime = value; }
        }
        public DateTime Out_Time
        {
            get { return outtime; }
            set { outtime = value; }
        }
        public int B_Id
        {
            get { return bid; }
            set { bid = value; }
        }
        public int W_Id
        {
            get { return wid; }
            set { wid = value; }
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