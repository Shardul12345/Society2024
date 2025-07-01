﻿using BusinessLogic.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Utility.DataClass;

namespace Society2024
{
    public partial class Terms_and_Condition : System.Web.UI.Page
    {
        terms_condition Terms = new terms_condition();
        BL_Terms bL_Terms = new BL_Terms();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();


            if (!IsPostBack)
            {
                terms_Gridbind();
            }
        }

        public void save_ckdata(string terms)
        {
            
        }

        public void terms_Gridbind()
        {
            DataSet dt = new DataSet();
            Terms.Sql_Operation = "Grid_Show";
            Terms.Society_Id = society_id.Value;
            dt = bL_Terms.getTermsDetails(Terms);
            if (dt.Tables[0].Rows.Count != 0)
                add_new.Visible = false;
            else
                add_new.Visible = true;
            GridView1.DataSource = dt.Tables[0];
            ViewState["dirState"] = dt.Tables[0];
            GridView1.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           // string terms = Request.Form["editor2"].ToString();
            if (term_id.Value != "")
                Terms.term_id = Convert.ToInt32(term_id.Value);
            Terms.Sql_Operation = "Update";
            Terms.Society_Id = society_id.Value;
            Terms.Terms = editor1.Text;
            bL_Terms.getupdate_details(Terms);
            terms_Gridbind();
        }

        public void runproc(string operation)
        {
            if (term_id.Value != "")
               Terms.term_id = Convert.ToInt32(term_id.Value);
            Terms.Sql_Operation = operation;
            var result = bL_Terms.getupdate_details(Terms);
           editor1.Text= result.Terms.ToString();




        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("Terms_and_Condition.aspx");
        }
       
        protected void edit1_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            term_id.Value = id;
            runproc("Select");
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void add_new_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }
    }
}