﻿using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace DataAccessLayer.MasterDA
{
    public class DA_User_Login
    {
        stored st = new stored();
        public Login_Details UpdateLoginDetails(Login_Details login)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            int count = 0;
            data_item.Add(st.create_array("operation", "login"));
            data_item.Add(st.create_array("UserName", login.UserName));
            data_item.Add(st.create_array("password", login.Password));
            status1 = st.run_query(data_item, "Select", "validateuser", ref sdr);
            if (status1 == "Done")
            {
                while (sdr.Read())
                {

                    count++;
                    login.UserLoginId= Convert.ToInt32(sdr["user_id"].ToString());
                    login.Name = sdr["Name"].ToString();
                    login.Society_Id = sdr["society_id"].ToString();
                    login.Society_Name = sdr["Society_name"].ToString();
                    login.Village_Id = sdr["village_id"].ToString();
                    
                }
               
            }
            return login;
        }

        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            st.fill_drop(drp_down, sqlstring, text, value);
        }

        public DataTable Event_Details(Login_Details details)
        {
                ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
                SqlDataReader sdr = null;
                string status1;
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                data_item.Add(st.create_array("operation", details.Sql_Operation));
                data_item.Add(st.create_array("society_id", details.Society_Id));

                status1 = st.run_query(data_item, "Select", "sp_event_master", ref sdr);

            if (status1 == "Done")
                if (sdr.HasRows)
                {
                    dt.Load(sdr);
                }
                return dt;
           
        }

        public DataTable Search_Admin(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", details.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;

        }

        public Login_Details Generate_Token(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("user_id", details.UserLoginId));
            data_item.Add(st.create_array("web_token", details.Web_Token));

            status1 = st.run_query(data_item, "Select", "sp_UserLogin", ref sdr);
            if (status1 == "Done")
            {
                details.Sql_Result = status1;
            }
            return details;
        }

        public Login_Details Get_Mail(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_dashboard", ref sdr);
            if (status1 == "Done")
            {
                while (sdr.Read())
                {

                    details.Open = Convert.ToInt32(sdr["opened"].ToString());
                    details.Resolve = Convert.ToInt32(sdr["resolved"].ToString());

                }

            }
            return details;
        }

        public DataTable SearchDefaulter(Login_Details details)
        {
                ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
                SqlDataReader sdr = null;
                string status1 = "";

                DataTable dt = new DataTable();
                data_item.Add(st.create_array("query", details.Sql_Operation));

                status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

                if (status1 == "Done")
                    dt.Load(sdr);
                return dt;
           
        }

        public Login_Details GetTicket(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_dashboard", ref sdr);
            if (status1 == "Done")
            {
                while (sdr.Read())
                {

                    details.Open = Convert.ToInt32(sdr["opened"].ToString());
                    details.Resolve = Convert.ToInt32(sdr["resolved"].ToString());

                }

            }
            return details;
        }

        public DataTable GetDefaulter(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));
            status1 = st.run_query(data_item, "Select", "sp_dashboard", ref sdr);
            if (status1 == "Done")
            {
                if (sdr.HasRows)
                    dt.Load(sdr);

            }
            return dt;
        }

        public DataTable GetMonth(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            
            status1 = st.run_query(data_item, "Select", "sp_dashboard", ref sdr);
            if (status1 == "Done")
            {
                if(sdr.HasRows)
                dt.Load(sdr);

            }
            return dt;
        }

        public DataTable Income_Chart(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataTable ChartData = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_dashboard", ref sdr);
            if (status1 == "Done")
            {
                ChartData.Load(sdr);
            }
            return ChartData.Rows.Count > 0 ? ChartData : null;
        }

        public DataTable Get_Expense_Chart(Login_Details details)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataTable ChartData = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_dashboard", ref sdr);
            if (status1 == "Done")
            {
                ChartData.Load(sdr);
            }
            return ChartData;
        }

        public DataTable Pdc_Clear(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_pdc_reminder", ref sdr);

            if (status1 == "Done")
                //if (sdr.HasRows)
                {


                    dt.Load(sdr);
                    
                }
            return dt;
        }

        public DataTable Meeting_Details(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_meeting_master", ref sdr);

            if (status1 == "Done")
                if (sdr.HasRows)
                {


                    dt.Load(sdr);
                    
                }
            return dt;
        }

        public DataTable Notice_Details(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_notice_master", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                   
                   dt.Load(sdr);
                  
            return dt;
        }

        public DataTable Maintenance_Details(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_maintenance_master", ref sdr);

            if (status1 == "Done")
                if (sdr.HasRows)
                {


                    dt.Load(sdr);
                    
                }
            return dt;
        }

        public DataTable Receipt_Details(Login_Details details)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", details.Sql_Operation));
            data_item.Add(st.create_array("society_id", details.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_receipt", ref sdr);

            if (status1 == "Done")
                if (sdr.HasRows)
                {


                    dt.Load(sdr);
                    
                }
            return dt;
        }
    }
}