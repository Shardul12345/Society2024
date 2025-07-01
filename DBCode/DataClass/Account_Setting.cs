using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Utility.DataClass
{
    public class Account_Setting
    {
        private int acc_set_id;
        private string society_id;
        private int receipt_btn;
        private int bill_gen_btn;
        private int gst_round;
        private int charge_round;
        private int remainder_email_dues;
        private DateTime bill_gen_date;
        private float late_fee_tax_per;
        private int add_facility;
        private int add_helper;
        private int buy_sale_option;
        private string Operation;
        private string Result;


        public int Acc_Set_Id
        {
            get { return acc_set_id; }
            set { acc_set_id = value; }
        }
        public string Society_Id
        {
            get { return society_id; }
            set { society_id = value; }
        }
        public int Receipt_Btn
        {
            get { return receipt_btn; }
            set { receipt_btn = value; }
        }
        public int Bill_Gen_Btn
        {
            get { return bill_gen_btn; }
            set { bill_gen_btn = value; }
        }
        public int Gst_Round
        {
            get { return gst_round; }
            set { gst_round = value; }
        }
        public int Charge_Round
        {
            get { return charge_round; }
            set { charge_round = value; }
        }
        public int Remainder_Email_Dues
        {
            get { return remainder_email_dues; }
            set { remainder_email_dues = value; }
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
        public DateTime Bill_Gen_Date
        {
            get { return bill_gen_date; }
            set { bill_gen_date = value; }
        }
        public float Late_Fee_Tax_Per
        {
            get { return late_fee_tax_per; }
            set { late_fee_tax_per = value; }
        }
        public int Add_Facility
        {
            get { return add_facility; }
            set { add_facility = value; }
        }
        public int Add_Helper
        {
            get { return add_helper; }
            set { add_helper = value; }
        }
        public int Buy_Sale_Option
        {
            get { return buy_sale_option; }
            set { buy_sale_option = value; }
        }
    }
}