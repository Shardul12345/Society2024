using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass
{
    public class maintenance_cal
    {
        private int id;
        private int billno;
        private int nmid;
        private DateTime gendate;
        private DateTime duedate;
        private decimal totalamount;
        private int bid;
        private int oid;
        private string ownername;
        private int amountpaid;
        private string paymentmethod;
        private int wid;
        private int mdate;
        private decimal due;
        private string Operation;
        private string Result;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int Bill_No
        {
            get { return billno; }
            set { billno = value; }
        }
        public int N_M_Id
        {
            get { return nmid; }
            set { nmid = value; }
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
        public int B_Id
        {
            get { return bid; }
            set { bid = value; }
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
        public int M_Date
        {
            get { return mdate; }
            set { mdate = value; }
        }
        public decimal Due
        {
            get { return due; }
            set { due = value; }
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