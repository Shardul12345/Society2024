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
using BusinessLogic.MasterBL;
using DBCode.DataClass.Master_Dataclass;
using System.Windows.Forms;
//using System.IdentityModel.Metadata;

namespace Society
{
    public partial class society_charges : System.Web.UI.Page
    {
        private BL_Society_Master bL_society = new BL_Society_Master();
        private Search_Society society = new Search_Society();
       
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
          
            if (!IsPostBack)
            {
                fill_drop1();
                Society_charges_GridBind();

            }

        }

        public void fill_drop1()
        {
            String sql_query = "Select *  from society_master";
            bL_society.fill_drop(ddl_society, sql_query, "name", "society_id");

        }


        public void Society_charges_GridBind()
        {
          
            DataSet dt = new DataSet();
            society.Sql_Operation = "Grid_Show";
           
            dt = bL_society.getcharge(society);
            ViewState["dirState"] = dt.Tables[0];
            GridView1.DataSource = dt.Tables[0];
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

        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("SELECT   name, amount, charge_id  FROM   society_charges inner join society_master on society_charges.society_id = society_master.society_id and society_master.active_status=0");
            if (txt_search.Text != "")
            {
                sb.Append(" where " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }

            society.Sql_Operation = sb.ToString();
            var result = bL_society.search_society_charges(society);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }


    
        public void runproc_save(string operation)
        {
            if (charge_id.Value != "")
                society.Charge_Id = Convert.ToInt32(charge_id.Value);
                society.Sql_Operation = operation;
            society.Amount = txt_amount.Text;
            society.Society_Id = ddl_society.SelectedValue;
            bL_society.updatecharges(society);
        }



        public void runproc(string operation)
        {
            if (charge_id.Value != "")
                society.Charge_Id = Convert.ToInt32(charge_id.Value);
            society.Sql_Operation = operation;
            var result = bL_society.updatecharges(society);
            charge_id.Value = result.Charge_Id.ToString();
            txt_amount.Text = result.Amount.ToString();
            ddl_society.SelectedValue = result.Society_Id.ToString();

        }


        protected void btn_delete_Click(object sender, EventArgs e)
        {

            if (charge_id.Value != "")
                society.Charge_Id = Convert.ToInt32(charge_id.Value);
            society.Sql_Operation = "Delete";
            bL_society.detete_charge(society);

            Response.Redirect("society_charges.aspx");
        }


        //protected void txt_w_name_TextChanged(object sender, EventArgs e)
        //{

        //    if (charge_id.Value != "")
        //        society.charge_id = Convert.ToInt32(charge_id.Value);
        //    society.W_Name = txt_w_name.Text;
        //    society.build_id = Convert.ToInt32(ddl_build_name.SelectedValue);
        //    society.Sql_Operation = "check_name";
        //    society.Society_Id = society_id.Value;
        //    var result = bL_society.WingTextChanged(society);
        //    Label4.Text = result.Sql_Result;


        //}



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            System.Web.UI.WebControls.Label charge_id = (System.Web.UI.WebControls.Label)row.FindControl("charge_id");
            society.Sql_Operation = "Delete";

            society.Charge_Id = Convert.ToInt32(charge_id.Text);

            bL_society.detete_charge(society);

            //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            Society_charges_GridBind();
        }


        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            charge_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (Label4.Text == "")
            {
                runproc_save("Update");
                Response.Redirect("society_charges.aspx");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("society_charges.aspx");
        }

        protected void ddl_society_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (charge_id.Value != "")
                society.Charge_Id = Convert.ToInt32(charge_id.Value);
            society.Society_Id = ddl_society.SelectedValue;
            society.Sql_Operation = "society_exist";
            
            var result=bL_society.check_society(society);
            Label2.Text =result.Sql_Result;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#edit_model').modal('show');", true);

        }
    }
}




