﻿using DBCode.DataClass.Master_Dataclass;
using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DataAccessLayer.MasterDA
{
    public class DA_Society_Member_Master
    {
        stored st = new stored();
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            st.fill_drop(drp_down, sqlstring, text, value);
        }
        public DataSet getSocietyMemberDetails(Society_Member member)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", member.Sql_Operation));
            data_item.Add(st.create_array("society_id", member.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_UserLogin", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;

        }
        public DataSet Add_Approver(Society_Member member)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", member.Sql_Operation));
            data_item.Add(st.create_array("society_id", member.Society_Id));
            data_item.Add(st.create_array("user_id", member.UserId));
            status1 = st.run_query(data_item, "Select", "sp_society_expense", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;

        }

        public Society_Member updateSocietyMemberDetails(Society_Member member)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            data_item.Add(st.create_array("operation", member.Sql_Operation));
            data_item.Add(st.create_array("user_id", member.UserId));
            if (member.Sql_Operation == "Update")
            {
                data_item.Add(st.create_array("society_id", member.Society_Id));
                data_item.Add(st.create_array("name", member.Name));
                data_item.Add(st.create_array("user_type_id", member.Designation));
                data_item.Add(st.create_array("address1", member.Address1));
                data_item.Add(st.create_array("address2", member.Address2));
                data_item.Add(st.create_array("contact_no", member.Contact_No));
                data_item.Add(st.create_array("email", member.Email));
                data_item.Add(st.create_array("username", member.UserName));
                data_item.Add(st.create_array("password", member.Password));
                data_item.Add(st.create_array("active_status", member.Status));
            }
            status1 = st.run_query(data_item, "Select", "sp_UserLogin", ref sdr);

            if (status1 == "Done")
            {
                if (member.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {

                        member.Name = sdr["name"].ToString();
                        member.Designation = Convert.ToInt32(sdr["user_type_id"].ToString());
                        member.Address1 = sdr["address1"].ToString();
                        member.Address2 = sdr["address2"].ToString();
                        member.Contact_No = sdr["contact_no"].ToString();
                        member.Email = sdr["email"].ToString();
                        member.UserName = sdr["username"].ToString();
                        member.Password = sdr["password"].ToString();
                        member.Status = Convert.ToInt32(sdr["active_status"].ToString());

                    }
                }

            }
            return member;
        }

        public object search_member(Society_Member member)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", member.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;
        }

        public Society_Member delete(Society_Member member)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status = "";
            data_item.Add(st.create_array("operation", member.Sql_Operation));
            data_item.Add(st.create_array("user_id", member.UserId));

            status = st.run_query(data_item, "Delete", "sp_UserLogin", ref sdr);
            if (status == "Done")
            {
                member.Sql_Result = status;
            }
            return member;
        }

        public Society_Member SocietyMemberTextChange(Society_Member member)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;

            string status1 = "";

            data_item.Add(st.create_array("operation", member.Sql_Operation));
            data_item.Add(st.create_array("user_id", member.UserId));
            data_item.Add(st.create_array("society_id", member.Society_Id));

            data_item.Add(st.create_array("contact_no", member.Contact_No));
            status1 = st.run_query(data_item, "Select", "sp_UserLogin", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                    member.Sql_Result = "Already exist";
                else
                    member.Sql_Result = "";
            
            return member;

        }

    }
}
