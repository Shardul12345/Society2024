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
using DBCode.DataClass;
using BusinessLogic.MasterBL;
//using System.IdentityModel.Metadata


namespace Society
{
    public partial class ownerwise_maintenance : System.Web.UI.Page
    {
        //stored st = new stored();
        DataSet ds = new DataSet();
        

        maintenance GetMaintenance = new maintenance();
        BL_Maintenance_Master bL_Maintenance = new BL_Maintenance_Master();
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
                txt_from.Text =new DateTime(DateTime.Now.Year,1,1).ToString("yyyy-MM-dd");
                txt_to.Text = DateTime.Now.ToShortDateString();
                ddl_build.SelectedValue = "1";
                ddl_build_SelectedIndexChanged(sender, e);
                //ownerwise_maintenance_GridBind();

            }

        }

        public void fill_dropdowns()
        {

            String sql_query = "Select build_id ,name from building_master where society_id='" + society_id.Value + "'";
            bL_Maintenance.fill_drop(ddl_build, sql_query, "name", "build_id");

        }

        protected void ownerwise_maintenance_GridBind()
        {
            int count = 0;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();


           


           
                sb.Append("exec sp_dashboard @operation= 'ownerwise_maintenance', @date1='"+ txt_from.Text+"',@date2= '" + txt_to.Text +"' , @build_id= '" + ddl_build.SelectedValue + "', @owner_id= " + ddl_owner.SelectedValue);

               
            GetMaintenance.Sql_Operation = sb.ToString();
            GetMaintenance.build_id = Convert.ToInt32(ddl_build.SelectedValue);
            GetMaintenance.owner_id = Convert.ToInt32(ddl_owner.SelectedValue);
            if (txt_from.Text != "" && txt_to.Text != "")
            {
                GetMaintenance.Date_1 = Convert.ToDateTime(txt_from.Text);
                GetMaintenance.Date_2 = Convert.ToDateTime(txt_to.Text);
            }
            ds = bL_Maintenance.Get_Ownerwise_Maintenance(GetMaintenance);
            GridView1.DataSource = ds.Tables[0];
            ViewState["dirState"]= ds.Tables[0];
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
            ownerwise_maintenance_GridBind();
            Panel1.Visible = false;
            GridView1.Visible = true;
           
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
           
                ownerwise_maintenance_GridBind();

                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rds = new ReportDataSource("ownerwise", ds.Tables[0]);
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("ownerwise_maintenance.rdlc");
                //  ReportParameter parameter = new ReportParameter("@receipt_id",receipt_id.Value);
                // ReportViewer1.LocalReport.SetParameters(parameter);
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();

        }
         
        

        protected void ddl_build_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_build.Text != "select")
            {
                string sql1 = "Select distinct owner_id, name from owner_search_vw where society_id='" + society_id.Value + "' and  build_id='" + ddl_build.SelectedValue + "' ";
                bL_Maintenance.fill_drop(ddl_owner, sql1, "name", "owner_id");
               
            }
        }
    }
}


      

      
