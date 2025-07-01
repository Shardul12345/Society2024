﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;
using Microsoft.ApplicationBlocks.Data;
using System.Collections;



namespace Society
{
    public partial class stored : System.Web.UI.Page
    {
        String  sqlconn, server_name, db_name;
        public string setsqlconnection()
        {
            sqlconn =ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;
            //db_name = WebConfigurationManager.AppSettings["db_name"];
            //sqlconn = "Server=" + server_name + "; Database=" + db_name + "Tusted_Connection = True; ";

            //sqlconn = "Data Source = 195.250.30.235; User maint_cal_id = admin; password = QWERTYUIOP; Initial Catalog =Society; Integrated Security = false; Connection Timeout=36367";
            //sqlconn = "Data Source =.; Initial Catalog =Society; Integrated Security = true; Connection Timeout=36367";
            return sqlconn;
        }
        //function run_query(string operation,collection data_item)
        //{

        //}
        public void fill_drop_1(DropDownList drp_down, string sqlstring, string text, string value)
        {
            SqlConnection con ;

            con = new SqlConnection(setsqlconnection());
            //  string sqlstring = "Select * from standard";
            // SqlCommand cmd = new SqlCommand(sqlstring, con);

            SqlDataReader sdr = SqlHelper.ExecuteReader(con, CommandType.Text, sqlstring);

            drp_down.DataSource = sdr;
            drp_down.DataTextField = text;
            drp_down.DataValueField = value;
            drp_down.DataBind();
            drp_down.Items.Insert(0, new ListItem("ALL", "0"));

        }

        internal void fill_drop(object dpdwYear, string sql1, string v1, string v2)
        {
            throw new NotImplementedException();
        }

        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            SqlConnection con = null;
           
                con = new SqlConnection(setsqlconnection());
                //  string sqlstring = "Select * from standard";
               // SqlCommand cmd = new SqlCommand(sqlstring, con);

                SqlDataReader sdr = SqlHelper.ExecuteReader(con, CommandType.Text, sqlstring);
            
                drp_down.DataSource = sdr;
                drp_down.DataTextField = text;
                drp_down.DataValueField = value;
                drp_down.DataBind();
                drp_down.Items.Insert(0, new ListItem("select"));
        }

        public ArrayList create_array(string field_name,object field_value)
        {
            ArrayList data_aaray = new ArrayList();
            data_aaray.Add(field_name);
            data_aaray.Add(field_value);
            return data_aaray;
        }

        public string run_query(ICollection<ArrayList> data_item,string operation,string stored_proc,ref SqlDataReader sdr)
        {
            
            string status = "Error";
            SqlConnection con = null;
            try{
            con = new SqlConnection(setsqlconnection());
            //  string sqlstring = "Select * from standard";
           // SqlCommand cmd = new SqlCommand(sqlstring, con);

            List<SqlParameter> parameters = new List<SqlParameter>();
            foreach (ArrayList ar in data_item)
            {
                String field_name = (string)ar[0];
               
              //  Console.WriteLine(ar);
                parameters.Add(new SqlParameter(field_name, ar[1]));
                
            }
                int rowsAffected=0;
               switch (operation)  
                {  

                  case "Update":  
                    rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());
                  break;  
                  case "Insert":  
                   rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());
                  break;  
                  case "Delete":  
                  rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());
                  break;  
                  case "Select":
                   sdr = SqlHelper.ExecuteReader(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());
                 //       if(sdr.Read())
                 //       {
                            rowsAffected = 1;
                 //       }
                        
                  break;  
               }  
         //   int rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());
           
            if (rowsAffected == 1)
            {
                status = "Done";
            }
            }
            catch(System.Data.SqlClient.SqlException ex)
            {
               status = ex.Message;
                  
            }
              return status;

        }

       

        public string run_query_scalar(ICollection<ArrayList> data_item, string operation, string stored_proc, ref int sdr)
        {

            string status = "Error";
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(setsqlconnection());
                //  string sqlstring = "Select * from standard";
                // SqlCommand cmd = new SqlCommand(sqlstring, con);

                List<SqlParameter> parameters = new List<SqlParameter>();
                foreach (ArrayList ar in data_item)
                {
                    String field_name = (string)ar[0];

                    //  Console.WriteLine(ar);
                    parameters.Add(new SqlParameter(field_name, ar[1]));

                }
                int rowsAffected = 0;
                switch (operation)
                {

                    case "Update":
                        rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());
                        break;
                    case "Insert":
                        rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());
                        break;
                    case "Delete":
                        rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());
                        break;
                    case "Select":
                    object  obj =Convert.ToInt32(SqlHelper.ExecuteScalar(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray()));
                        //       if(sdr.Read())
                        //       {
                        rowsAffected = 1;
                        sdr = Convert.ToInt32(obj);
                        //       }

                        break;
                }
                //   int rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, stored_proc, parameters.ToArray());

                if (rowsAffected == 1)
                {
                    status = "Done";
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                status = ex.Message;

            }
            return status;

        }

       
    }


}