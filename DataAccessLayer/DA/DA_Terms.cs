﻿using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Utility.DataClass;

namespace DataAccessLayer.DA
{
    public class DA_Terms
    {
        stored st = new stored();
        public terms_condition Get_Update_Details(terms_condition terms)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            data_item.Add(st.create_array("operation", terms.Sql_Operation));
            data_item.Add(st.create_array("term_id", terms.term_id));
            
            if (terms.Sql_Operation == "Update")
            {
                data_item.Add(st.create_array("society_id", terms.Society_Id));
                data_item.Add(st.create_array("terms", terms.Terms));
              
            }
            status1 = st.run_query(data_item, "Select", "sp_terms_condition", ref sdr);

            if (status1 == "Done")
            {
                if (terms.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {
                        terms.Society_Id = sdr["society_id"].ToString();
                        terms.Terms = sdr["terms"].ToString();
                       
                    }
                }
                else
                {
                    terms.Sql_Result = status1;
                }
            }
            return terms;

        }

        public DataSet Term_Show(terms_condition terms)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", terms.Sql_Operation));
            data_item.Add(st.create_array("society_id", terms.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_terms_condition", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

    }
}