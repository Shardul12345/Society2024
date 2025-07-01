﻿using DBCode.DataClass;
using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;

namespace DataAccessLayer.MasterDA
{
    public class DA_Owner_Master
    {
        stored st = new stored();
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            st.fill_drop(drp_down, sqlstring, text, value);
        }
        public DataSet getOwnerDetails(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;
             DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            data_item.Add(st.create_array("operation",owner.Sql_Operation));
            data_item.Add(st.create_array("society_id", owner.Society_Id));
            data_item.Add(st.create_array("type", owner.Type));

            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
                ds.Tables.Add(dt);
            return ds;
        }



        public DataSet getFamilyDetails(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            

            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataTable Print_House_Receipt(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", owner.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;
        }

        public DataSet Get_Tax_Receipt(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_id", owner.Village_Id));
            
            status1 = st.run_query(data_item, "Select", "sp_house_tax_receipt", ref sdr);

            if (status1 == "Done")
                if(sdr.HasRows)
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet Get_Village_Owner(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_id", owner.Village_Id));
            
            status1 = st.run_query(data_item, "Select", "sp_house_owner", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public Owner Update_House_Tax_Receipt(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("house_receipt_id", owner.House_Receipt_Id));
            if (owner.Sql_Operation == "Update")
            {
                data_item.Add(st.create_array("village_id", owner.Village_Id));
                data_item.Add(st.create_array("pay_mode", owner.Pay_Mode));
                data_item.Add(st.create_array("house_no", owner.House_No));
                data_item.Add(st.create_array("receipt_no", owner.Receipt_No));
                //data_item.Add(st.create_array("date", owner.Date));
                data_item.Add(st.create_array("house_tax", owner.House_Tax));
                if(owner.Type=="1")
                data_item.Add(st.create_array("house_amount", owner.Paid_Amount));
                if (owner.Type == "2")
                    data_item.Add(st.create_array("water_amount", owner.Paid_Amount));

                
               if (owner.Pay_Mode == 2 || owner.Pay_Mode == 3)
                {
                    data_item.Add(st.create_array("chqno", owner.Chqno));
                    data_item.Add(st.create_array("chqdate", owner.Chqdate));
                }
            }
            if (owner.Sql_Operation == "pending_dues") {
                data_item.Add(st.create_array("house_amount", owner.Paid_Amount));
                data_item.Add(st.create_array("house_no", owner.House_No));
                data_item.Add(st.create_array("pay_for", owner.Type));
            }
            status1 = st.run_query(data_item, "Select", "sp_house_tax_receipt", ref sdr);

            if (status1 == "Done")
            {
                if (owner.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {

                        owner.Village_Id = sdr["village_id"].ToString();
                        owner.Pay_Mode = Convert.ToInt32(sdr["pay_mode"].ToString());
                        //owner.Date = Convert.ToDateTime(sdr["date"].ToString());
                        owner.Receipt_No = sdr["receipt_no"].ToString();
                        owner.House_Tax = Convert.ToDecimal(sdr["house_tax"].ToString());
                        owner.House_No = Convert.ToInt32(sdr["house_no"].ToString());
                        if(sdr["house_amount"].ToString()!="0.00")
                        owner.Paid_Amount = Convert.ToDecimal(sdr["house_amount"].ToString());
                        else
                            owner.Paid_Amount = Convert.ToDecimal(sdr["water_amount"].ToString());
                        owner.Balance = Convert.ToDecimal(sdr["house_tax"].ToString())- owner.Paid_Amount;
                        owner.Chqno = sdr["chqno"].ToString();
                        if (sdr["chqdate"].ToString() != "")
                        {
                            owner.Chqdate = Convert.ToDateTime(sdr["chqdate"]);
                        }
                    }
                }
                else
                {
                    owner.Sql_Result = status1;
                }
            }
            return owner;
        }

        public DataTable House_Tax_Receipt_Search(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", owner.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;
        }

        public Owner Fetch_Address(Owner owner)
        {
            string status = "";
           
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_id", owner.Village_Id));
            status = st.run_query(data_item, "Select", "sp_house_owner", ref sdr);
            if (status == "Done")
            {
                if (sdr.Read())
                {
                    //str = sdr["address_line1"].ToString();
                    owner.Address_Line1 = sdr["address_line1"].ToString();
                }
              
            }
            return owner;
        }

        public Owner Check_Select(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("chqno", owner.Chqno));
            data_item.Add(st.create_array("house_no", owner.House_No));
            status = st.run_query(data_item, "Select", "sp_receipt", ref sdr);
            if (status == "Done")
            {
                if (sdr.Read())
                {
                    owner.Chqdate = Convert.ToDateTime(sdr["che_date"].ToString());
                    owner.Chq_Amount = Convert.ToDecimal(sdr["che_amount"].ToString());
                }
            }
            return owner;
        }

        public Owner Pending_House_Tax_Receipt(Owner owner)
        {
            
            SqlDataReader sdr = null;
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("house_no", owner.House_No));
            data_item.Add(st.create_array("pay_for", owner.Type));
            string status = st.run_query(data_item, "Select", "sp_house_tax_receipt", ref sdr);
           
            if (status == "Done")
                if (sdr.Read())
                {
                    owner.House_Tax = Convert.ToDecimal(sdr["due"]);
                    owner.Advance = float.Parse((sdr["advance"]).ToString());
                    owner.Balance = Convert.ToDecimal(sdr["balance"]);
                }

            return owner;
        }

        public Owner Fetch_House_Tax_Receipt(Owner owner)
        {
            string status = "", str = "";
            int val = 0;
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_id", owner.Village_Id));
            status = st.run_query(data_item, "Select", "sp_house_tax_receipt", ref sdr);
            if (status == "Done")
            {
                if (sdr.Read())
                {
                    str = sdr["receipt_no"].ToString();
                    val = int.Parse(Regex.Match(str, @"\d+").ToString()) + 1;
                    owner.Receipt_No = str.Replace((val - 1).ToString(), (val).ToString());
                }
                else
                {
                    owner.Receipt_No = "RPT0001";
                }
               
            }
            return owner;
        }

        public Owner Delete_House_Tax(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("house_receipt_id", owner.House_Receipt_Id));
            status1 = st.run_query(data_item, "Select", "sp_house_tax_receipt", ref sdr);

            if (status1 == "Done")
            {
                owner.Sql_Result = status1;
            }
            return owner;
        }

        public object Print_House_Owner(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", owner.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;
        }

        public Owner updateOwnerDetails(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            //SqlDataReader sdr = null;
            int sdr = 0;
            string status1;
            //string type = "Owner";
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            if (owner.Sql_Operation == "Update")
            {

                data_item.Add(st.create_array("society_id", owner.Society_Id));
                data_item.Add(st.create_array("wing_id", owner.wing_id));
                data_item.Add(st.create_array("poss_date", owner.Poss_Date));
                data_item.Add(st.create_array("name", owner.Name));
                data_item.Add(st.create_array("pre_mob", owner.Pre_Mob));
                data_item.Add(st.create_array("dob", owner.Dob));
                data_item.Add(st.create_array("married_id", owner.married_id));
                data_item.Add(st.create_array("occup", owner.Occup));
                data_item.Add(st.create_array("monthly_income", owner.Monthly_Income));
                data_item.Add(st.create_array("off_tel", owner.Off_Tel));
                data_item.Add(st.create_array("off_addr1", owner.Off_Addr1));
                data_item.Add(st.create_array("email", owner.Email));
                data_item.Add(st.create_array("alter_mob", owner.Alter_Mob));
                data_item.Add(st.create_array("flat_id", owner.flat_id));
                data_item.Add(st.create_array("flat_type_id", owner.Flat_type_Id));
                data_item.Add(st.create_array("photo_name", owner.Photo_Name));
                data_item.Add(st.create_array("id_proof", owner.Id_Proof));
                data_item.Add(st.create_array("type", owner.Type));
            }
            status1 = st.run_query_scalar(data_item, "Select", "sp_owner_master", ref sdr);
            if (status1 == "Done")
                if(sdr!=0)
                owner.owner_id = sdr;
            return owner;

        }

        public Owner village_owner_delete(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_owner_id", owner.Village_Owner_id));
            status1 = st.run_query(data_item, "Select", "sp_house_owner", ref sdr);

            if (status1 == "Done")
            {
                owner.Sql_Result = status1;
            }
            return owner;
        }

        public DataTable house_owner_search(Owner owner)
        {
                ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
                SqlDataReader sdr = null;
                string status1 = "";

                DataTable dt = new DataTable();
                data_item.Add(st.create_array("query", owner.Sql_Operation));

                status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

                if (status1 == "Done")
                    dt.Load(sdr);
                return dt;
           
        }

        public Owner Fetch_House_No(Owner owner)
        {
            string status = "", str = "";
            int val = 0;
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_id", owner.Village_Id));
            status = st.run_query(data_item, "Select", "sp_house_owner", ref sdr);
            if (status == "Done")
            {
                if (sdr.Read())
                {
                    str = sdr["house_no"].ToString();
                    val = int.Parse(Regex.Match(str, @"\d+").ToString()) + 1;
                    owner.House_No = Convert.ToInt32(str.Replace((val - 1).ToString(), (val).ToString()));
                }
                else
                {
                    owner.House_No = 001;
                }
            }
            return owner;
        }

        public Owner Get_Village_Id(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_owner_id", owner.Village_Owner_id));
            data_item.Add(st.create_array("village_id", owner.Village_Id));
           
            status1 = st.run_query(data_item, "Select", "sp_house_owner", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                    owner.Village_Id = sdr["village_id"].ToString();
                else
                    owner.Village_Id = "V10001";

            return owner;
        }

        public Owner update_village_owner(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            //int sdr = 0;
            string status1;
            //string type = "Owner";
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_owner_id", owner.Village_Owner_id));
            if (owner.Sql_Operation == "Update")
            {

                data_item.Add(st.create_array("village_id", owner.Village_Id));
                data_item.Add(st.create_array("house_no", owner.House_No));
                data_item.Add(st.create_array("house_type", owner.House_Type));
                data_item.Add(st.create_array("sq_ft", owner.Sq_Ft));
                data_item.Add(st.create_array("address", owner.Address));
                data_item.Add(st.create_array("pre_mob", owner.Pre_Mob));
                data_item.Add(st.create_array("alter_mob", owner.Alter_Mob));
                data_item.Add(st.create_array("name", owner.Name));
                data_item.Add(st.create_array("id_proof", owner.Id_Proof));
                
            }
            status1 = st.run_query(data_item, "Select", "sp_house_owner", ref sdr);
            if (status1 == "Done")
                owner.Sql_Result=status1;
            return owner;
        }

        public DataTable Get_Printunitwise_Maintenance(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;

            DataTable dt = new DataTable();

            data_item.Add(st.create_array("query", owner.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
            
               if(sdr.HasRows)
               dt.Load(sdr);
               return dt;
        }

        public Owner GetFlat(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;
           
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("society_id", owner.Society_Id));
            data_item.Add(st.create_array("wing_id", owner.wing_id));
            data_item.Add(st.create_array("flat_type_id", owner.Flat_type_Id));
            data_item.Add(st.create_array("flat", owner.Flat_No));


            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                    owner.flat_id = Convert.ToInt32(sdr["flat_id"].ToString());
                else
                    owner.flat_id = 0;

            return owner;
        }

        public DataTable Get_PrintOwner(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", owner.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;
        }

        public DataTable Get_PrintRental(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", owner.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;
        }

        public DataTable search_rental(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;

            DataTable dt = new DataTable();

            data_item.Add(st.create_array("query", owner.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;
        }

       
        public Owner runproc(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            //data_item.Add(st.create_array("o_ex_id", owner.O_Ex_Id));

            status1 = st.run_query(data_item, owner.Sql_Operation, "sp_owner_master", ref sdr);
            if (status1 == "Done")
            {
                if (owner.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {

                        owner.Society_Id = sdr["society_id"].ToString();
                        owner.Poss_Date = Convert.ToDateTime(sdr["poss_date"]);
                        owner.Name = sdr["name"].ToString();
                        owner.Pre_Mob = sdr["pre_mob"].ToString();
                        owner.Alter_Mob = sdr["alter_mob"].ToString();
                        owner.Dob = Convert.ToDateTime(sdr["dob"]);
                        owner.married_id = Convert.ToInt32(sdr["married_id"].ToString());
                        owner.Flat_No = sdr["_flat"].ToString();
                        owner.Occup = sdr["job_title"].ToString();
                        owner.Off_Addr1 = sdr["off_addr1"].ToString();
                        owner.Off_Tel = sdr["off_tel"].ToString();
                        owner.Email = sdr["email"].ToString();
                        owner.Monthly_Income = sdr["monthly_income"].ToString();
                        owner.Flat_type_Id = Convert.ToInt32(sdr["flat_type_id"].ToString());
                        owner.flat_id = Convert.ToInt32(sdr["flat_id"].ToString());
                        owner.wing_id = Convert.ToInt32(sdr["wing_id"].ToString());
                        owner.Photo_Name = sdr["photo_name"].ToString();
                        owner.Id_Proof = sdr["id_proof"].ToString();
                        owner.Type = sdr["type"].ToString();

                        if (owner.Type == "Rent")
                        {
                            owner.Aggrement_Date = Convert.ToDateTime(sdr["aggrement_date"]);
                            owner.Aggrement_Period_From = Convert.ToDateTime(sdr["aggrement_period_from"]);
                            owner.Aggrement_Period_To = Convert.ToDateTime(sdr["aggrement_period_to"]);
                            owner.Police_Verification_Date = Convert.ToDateTime(sdr["police_verification_date"]);
                        }

                    }

                }
            }
            return owner;
        }


        public Owner runproc_family(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            

            status1 = st.run_query(data_item, owner.Sql_Operation, "sp_owner_master", ref sdr);
            if (status1 == "Done")
            {
                if (owner.Sql_Operation == "Select_Family")
                {
                    while (sdr.Read())
                    {


                        owner.F_Name = sdr["f_name"].ToString();
                        owner.Relation = sdr["relation"].ToString();
                        owner.F_Occu = sdr["f_occu"].ToString();
                        owner.F_Dob = sdr["f_dob"].ToString();

                    }

                }
            }
            return owner;
        }

        public Owner runproc_house_owner(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("village_owner_id", owner.Village_Owner_id));


            status1 = st.run_query(data_item, owner.Sql_Operation, "sp_house_owner", ref sdr);
            if (status1 == "Done")
            {
                if (owner.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {
                        owner.Name = sdr["name"].ToString();
                        owner.House_No = Convert.ToInt32(sdr["house_no"].ToString());
                        owner.House_Type = sdr["house_type"].ToString();
                        owner.Sq_Ft = Convert.ToDecimal(sdr["sq_ft"].ToString());
                        owner.Address = sdr["address"].ToString();
                        owner.Pre_Mob = sdr["pre_mob"].ToString();
                        owner.Village_Id = sdr["village_id"].ToString();
                        owner.Alter_Mob = sdr["alter_mob"].ToString();
                        owner.Id_Proof = sdr["id_proof"].ToString();
                        owner.Address_Line1 = sdr["address_Line1"].ToString();
                    }
                }
            }
            return owner;
        }



        public DataSet getRentalDetails(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("society_id", owner.Society_Id));
            data_item.Add(st.create_array("type", owner.Type));

            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public Owner updateRentalDetails(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            //SqlDataReader sdr = null;
            int sdr = 0;
            string status1 ;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            if (owner.Sql_Operation == "Update")
            {

                data_item.Add(st.create_array("society_id", owner.Society_Id));
                data_item.Add(st.create_array("wing_id", owner.wing_id));
                data_item.Add(st.create_array("poss_date", owner.Poss_Date));
                data_item.Add(st.create_array("name", owner.Name));
                data_item.Add(st.create_array("pre_mob", owner.Pre_Mob));
                data_item.Add(st.create_array("dob", owner.Dob));
                data_item.Add(st.create_array("married_id", owner.married_id));
                data_item.Add(st.create_array("occup", owner.Occup));
                data_item.Add(st.create_array("monthly_income", owner.Monthly_Income));
                data_item.Add(st.create_array("off_addr1", owner.Off_Addr1));
                data_item.Add(st.create_array("off_tel", owner.Off_Tel));
                data_item.Add(st.create_array("email", owner.Email));
                data_item.Add(st.create_array("alter_mob", owner.Alter_Mob));
                data_item.Add(st.create_array("flat_id", owner.flat_id));
                data_item.Add(st.create_array("flat_type_id", owner.Flat_type_Id));
                data_item.Add(st.create_array("photo_name", owner.Photo_Name));
                data_item.Add(st.create_array("id_proof", owner.Id_Proof));
                data_item.Add(st.create_array("type", owner.Type));
                data_item.Add(st.create_array("aggrement_date", owner.Aggrement_Date));
                data_item.Add(st.create_array("aggrement_period_from", owner.Aggrement_Period_From));
                data_item.Add(st.create_array("aggrement_period_to", owner.Aggrement_Period_To));
                data_item.Add(st.create_array("police_verification_date", owner.Police_Verification_Date));

            }
            status1 = st.run_query_scalar(data_item, "Select", "sp_owner_master", ref sdr);
            if (status1 == "Done")
                if(sdr!=0)
                owner.owner_id = sdr;
            return owner;

        }

        public DataSet getFamily1Details(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            data_item.Add(st.create_array("type", "Rental"));

            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public Owner updateFamilyOwnerDetails(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
           
            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            data_item.Add(st.create_array("o_ex_id", owner.O_Ex_Id));

            if (owner.Sql_Operation == "D_Update")
            {
                data_item.Add(st.create_array("society_id", owner.Society_Id));
                data_item.Add(st.create_array("f_name", owner.F_Name));
                data_item.Add(st.create_array("relation", owner.Relation));
                data_item.Add(st.create_array("f_occu", owner.F_Occu));
                data_item.Add(st.create_array("f_dob", owner.F_Dob));


            }
            string status1= st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
            {
                owner.Sql_Result = status1;
            }
            return owner;
        }

        public Owner owner_delete(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
            {
                owner.Sql_Result = status1;
            }
            return owner;
        }
        public Owner family_delete(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 ;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("o_ex_id", owner.O_Ex_Id));
            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
            {
                owner.Sql_Result = status1;
            }
            return owner;
        }

        public Owner flattextchanged(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;

            string status1;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            data_item.Add(st.create_array("wing_id", owner.wing_id));
            data_item.Add(st.create_array("flat_id", owner.flat_id));
            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                    owner.Sql_Result = "Already exist";
                else
                    owner.Sql_Result = "";
            return owner;
        }
        public Owner typetextchanged(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;

            string status1 ;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("owner_id", owner.owner_id));
            data_item.Add(st.create_array("flat_id", owner.flat_id));
            data_item.Add(st.create_array("wing_id", owner.wing_id));
            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                    owner.Sql_Result = "Alredy exist";
                else
                    owner.Sql_Result = "";
            return owner;

        }

        public Owner mobiletextchanged(Owner owner)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;

            string status1;

            data_item.Add(st.create_array("operation", owner.Sql_Operation));
            data_item.Add(st.create_array("pre_mob", owner.Pre_Mob));
            status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                    owner.Sql_Result = "Already exist";
                else
                    owner.Sql_Result = "";
            return owner;

        }

        //public Owner telnotextchanged(Owner owner)
        //{
        //    ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
        //    SqlDataReader sdr = null;

        //    string status1 = "";

        //    data_item.Add(st.create_array("operation", owner.Sql_Operation));
        //    data_item.Add(st.create_array("owner_id", owner.owner_id));
        //    data_item.Add(st.create_array("off_tel", owner.Off_Tel));
        //    status1 = st.run_query(data_item, "Select", "sp_owner_master", ref sdr);

        //    if (status1 == "Done")
        //        if (sdr.Read())
        //            owner.Sql_Result = "Alredy exist";
        //        else
        //            owner.Sql_Result = "";
        //    return owner;

        //}

       

    }
}