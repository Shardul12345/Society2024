﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass
{
    public class maintenance
    {
        private int mid;
        private int Flag;
        private string SocietyId;
        private string mname;
        private string name;
        private string wname;
        private float mamount;
        private int status;
        private int bid;
        private int buildid;
        private float mtotal;
        private string flatno;
        private int flat;
        private string Operation;
        private string Result;
        private int id;
        private int billno;
        private int nmid;
        private DateTime gendate;
        private DateTime duedate;
        private decimal totalamount;
        private int oid;
        private string ownername;
        private int amountpaid;
        private string paymentmethod;
        private int wid;
        private DateTime mdate;
        private DateTime date;
        private DateTime date1;
        private DateTime date2;
        private decimal due;
       

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int flag
        {
            get { return Flag; }
            set { Flag = value; }
        }
        public int n_m_id
        {
            get { return nmid; }
            set { nmid = value; }
        }
        public int Bill_No
        {
            get { return billno; }
            set { billno = value; }
        }
      
        public DateTime Gen_Date
        {
            get { return gendate; }
            set { gendate = value; }
        }
        public DateTime Due_Date
        {
            get { return duedate; }
            set { duedate = value; }
        }
        public decimal Total_Amount
        {
            get { return totalamount; }
            set { totalamount = value; }
        }
     
        public int O_Id
        {
            get { return oid; }
            set { oid = value; }
        }
        public string Owner_Name
        {
            get { return ownername; }
            set { ownername = value; }
        }
        public int Amount_Paid
        {
            get { return amountpaid; }
            set { amountpaid = value; }
        }
        public string Payment_Method
        {
            get { return paymentmethod; }
            set { paymentmethod = value; }
        }
        public int W_Id
        {
            get { return wid; }
            set { wid = value; }
        }

        public int Flat
        {
            get { return flat; }
            set { flat = value; }
        }
        public DateTime M_Date
        {
            get { return mdate; }
            set { mdate = value; }
        }
        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }
        public DateTime Date_1
        {
            get { return date1; }
            set { date1 = value; }
        }
        public DateTime Date_2
        {
            get { return date2; }
            set { date2 = value; }
        }
        public decimal Due
        {
            get { return due; }
            set { due = value; }
        }


        public int M_Id
        {
            get { return mid; }
            set { mid = value; }
        }
        public string Society_Id
        {
            get { return SocietyId; }
            set { SocietyId = value; }
        }
       
        public string M_Name
        {
            get { return mname; }
            set { mname = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string W_Name
        {
            get { return wname; }
            set { wname = value; }
        }

        public float M_Amount
        {
            get { return mamount; }
            set { mamount = value; }
        }
        public int Status
        {
            get { return status; }
            set { status = value; }
        }
        public int b_id
        {
            get { return bid; }
            set { bid = value; }
        }

        public int Build_Id
        {
            get { return buildid; }
            set { buildid = value; }
        }
        public float M_Total
        {
            get { return mtotal; }
            set { mtotal = value; }
        }
        public string Flat_No
        {
            get { return flatno; }
            set { flatno = value; }
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