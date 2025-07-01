﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Web.Configuration;
//using System.Windows.Controls;
//using Azure;
using System.Drawing.Drawing2D;
using Page = System.Web.UI.Page;
using Microsoft.Reporting.WebForms;
using Utility.DataClass;
using BusinessLogic.BL;
//using System.IdentityModel.Metadata


namespace Society
{
    public partial class cashbook : System.Web.UI.Page
    {
        Cashbook cash = new Cashbook();
        BL_Receipt bL_Receipt = new BL_Receipt();
        DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }


            if (!IsPostBack)
            {
                fill_dropdowns();


                txt_from.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txt_to.Text = DateTime.Now.ToString("yyyy-MM-dd");
                //ddl_build.SelectedIndex =1;

               // Cashbook_GridBind();

            }

        }

        public void fill_dropdowns()
        {

            String sql_query = "Select build_id ,name from building_master where society_id='" + society_id.Value + "'";
            bL_Receipt.fill_drop(ddl_build, sql_query, "name", "build_id");

        }

        protected void Cashbook_GridBind()
        {
           
            cash.Sql_Operation = "cashbook";
            cash.build_id = Convert.ToInt32(ddl_build.SelectedValue);
            if (txt_from.Text != "" && txt_to.Text != "")
            {
                cash.Date1 = Convert.ToDateTime(txt_from.Text.ToString());
                cash.Date2 = Convert.ToDateTime(txt_to.Text.ToString());
            }
            ds = bL_Receipt.Get_CashBook(cash);
            GridView1.DataSource = ds.Tables[0];
            ViewState["dirState"] = ds.Tables[0];
            GridView1.DataBind();





        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                GridView1.DataSource = dtrslt;
                GridView1.DataBind();


            }

        }


        protected void btn_new_Click(object sender, EventArgs e)
        {
            Response.Redirect("receipt_search_form.aspx");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            Cashbook_GridBind();
            Panel1.Visible = false;
            GridView1.Visible = true;
            int count = 1;
          
        }



        protected void btn_close_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("receipt_search_form.aspx");
            //Response.Redirect("owner_detailsDataSet.aspx?view_id=" + Request.QueryString["view_id"]);

        }





        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();




            //btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);
        }



        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btn_print_Click(object sender, EventArgs e)
        {


            Panel1.Visible = true;
            GridView1.Visible = false;
            Cashbook_GridBind();
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rds = new ReportDataSource("cashbook", ds.Tables[0]);
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("Cashbook.rdlc");
                //  ReportParameter parameter = new ReportParameter("@receipt_id",receipt_id.Value);
                // ReportViewer1.LocalReport.SetParameters(parameter);
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();

               





            //using (SqlConnection con = new SqlConnection(st.setsqlconnection()))
            //{

            //    con.Open();
            //    SqlCommand c = new SqlCommand("Select * from society_cashbook");
            //    SqlDataAdapter s = new SqlDataAdapter(c);
            //    DataTable dt = new DataTable();
            //    s.Fill(dt);

            //    ReportViewer1.LocalReport.DataSources.Clear();
            //    ReportDataSource rds = new ReportDataSource("cashbook", dt);
            //    ReportViewer1.LocalReport.ReportPath = Server.MapPath("Cashbook.rdlc");
            //    //ReportParameter parameter = new ReportParameter("build", ddl_build.Text);
            //    //ReportViewer1.LocalReport.SetParameters(parameter);
            //    ReportViewer1.LocalReport.DataSources.Add(rds);
            //    ReportViewer1.LocalReport.Refresh();
            //}
        }
    }
}


      

      
