﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Utility.DataClass
{
    public class receipt
    {
        private int receiptid;
        private int receiptno;
        private DateTime date;
        private string billno;
        private string ownername;
        private float recivableamt;
        private int paymode;
        private string chqno;
        private DateTime chqdate;
        private string remarks;
        private int mid;
        private int oid;
        private int bid;
        private int wid;
        private float receivedamt;
        private string societyid;
        private string balance;
        private int cheamount;
        private string Operation;
        private string Result;

        public int Receipt_Id
        {
            get { return receiptid; }
            set { receiptid = value; }
        }
        public int Receipt_No
        {
            get { return receiptno; }
            set { receiptno = value; }
        }
        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }
        public string Bill_No
        {
            get { return billno; }
            set { billno = value; }
        }
        public string Owner_Name
        {
            get { return ownername; }
            set { ownername = value; }
        }
        public float Recivable_Amt
        {
            get { return recivableamt; }
            set { recivableamt = value; }
        }
        public int Pay_Mode
        {
            get { return paymode; }
            set { paymode = value; }
        }

        public int Che_Amount
        {
            get { return cheamount; }
            set { cheamount = value; }
        }

        public string Chqno
        {
            get { return chqno; }
            set { chqno = value; }
        }
        public DateTime Chqdate
        {
            get { return chqdate; }
            set { chqdate = value; }
        }
        public string Remarks
        {
            get { return remarks; }
            set { remarks = value; }
        }
        public int M_Id
        {
            get { return mid; }
            set { mid = value; }
        }
        public int O_Id
        {
            get { return oid; }
            set { oid = value; }
        }
        public int B_id
        {
            get { return bid; }
            set { bid = value; }
        }
        public int W_Id
        {
            get { return wid; }
            set { wid = value; }
        }
        public float Received_Amount
        {
            get { return receivedamt; }
            set { receivedamt = value; }
        }
        public string Society_Id
        {
            get { return societyid; }
            set { societyid = value; }
        }
        public string Balance
        {
            get { return balance; }
            set { balance = value; }
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