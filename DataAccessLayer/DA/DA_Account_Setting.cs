using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Utility.DataClass;

namespace DataAccessLayer.DA
{
    public class DA_Account_Setting
    {
        stored st = new stored();
        public Account_Setting Get_Code_Details(Account_Setting account)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", account.Sql_Operation));
            data_item.Add(st.create_array("society_id", account.Society_Id));


            status1 = st.run_query(data_item, "Select", "sp_account_setting", ref sdr);

            if (status1 == "Done")

                {
                    if (sdr.Read())
                    {
                        account.Acc_Set_Id = Convert.ToInt32(sdr["acc_set_id"].ToString());
                    }
                }

           
            return account;
        }

        public Account_Setting Update_Account_Setting(Account_Setting account)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            data_item.Add(st.create_array("operation", account.Sql_Operation));

            data_item.Add(st.create_array("s_id", account.Acc_Set_Id));

            if (account.Sql_Operation == "Update")
            {
                data_item.Add(st.create_array("society_id", account.Society_Id));
                data_item.Add(st.create_array("bill_gen_date", account.Bill_Gen_Date));
                data_item.Add(st.create_array("late_fee_tax_per", account.Late_Fee_Tax_Per));
                data_item.Add(st.create_array("receipt_btn", account.Receipt_Btn));
                data_item.Add(st.create_array("bill_gen_btn", account.Bill_Gen_Btn));
                data_item.Add(st.create_array("gst_round", account.Gst_Round));
                data_item.Add(st.create_array("charge_round", account.Charge_Round));
                data_item.Add(st.create_array("add_facility", account.Add_Facility));
                data_item.Add(st.create_array("add_helper", account.Add_Helper));
                data_item.Add(st.create_array("buy_sale_option", account.Buy_Sale_Option));
                data_item.Add(st.create_array("remainder_email_dues", account.Remainder_Email_Dues));
            }
            status1 = st.run_query(data_item, "Select", "sp_account_setting", ref sdr);
            if (status1 == "Done")
            {
                if (account.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {
                        account.Society_Id = sdr["society_id"].ToString();
                        account.Bill_Gen_Date = Convert.ToDateTime(sdr["bill_gen_date"].ToString());
                        account.Late_Fee_Tax_Per = float.Parse(sdr["late_fee_tax_per"].ToString());
                        account.Receipt_Btn = Convert.ToInt32(sdr["receipt_btn"]);
                        account.Bill_Gen_Btn = Convert.ToInt32(sdr["bill_gen_btn"]);
                        account.Gst_Round = Convert.ToInt32(sdr["gst_round"]);
                        account.Charge_Round = Convert.ToInt32(sdr["charge_round"]);
                        account.Add_Facility = Convert.ToInt32(sdr["add_facility"]);
                        account.Add_Helper = Convert.ToInt32(sdr["add_helper"]);
                        account.Buy_Sale_Option = Convert.ToInt32(sdr["buy_sale_option"]);
                        account.Remainder_Email_Dues = Convert.ToInt32(sdr["remainder_email_dues"]);
                    }
                }

            }
            return account;
        }
    }
}