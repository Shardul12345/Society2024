﻿using BusinessLogic.BL;
using DBCode.DataClass;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Society
{
    public partial class ledger : System.Web.UI.Page
    {
        Ledger GetLedger = new Ledger();
        BL_Ledger bL_Ledger = new BL_Ledger();

        protected void Page_Load(object sender, EventArgs e)
        {
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                Ledger_GridBind();
            }

        }
       
        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            led_id.Value = id;
            runproc("Select");          
            btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        public void Ledger_GridBind()
        {
            DataSet dt = new DataSet();
            GetLedger.Sql_Operation = "Grid_Show";
            GetLedger.Society_Id = society_id.Value;
            dt = bL_Ledger.getLedgerDetails(GetLedger);

            GridView1.DataSource = dt.Tables[0];
            ViewState["dirState"] = dt.Tables[0];
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
            sb.Append(" Select *  from ledger");
            if (txt_search.Text != "")
            {
                sb.Append(" where " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            GetLedger.Sql_Operation = sb.ToString();
            var result = bL_Ledger.search_ledger(GetLedger);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            runproc_save("Update");
            Response.Redirect("ledger_form.aspx");
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show("Are you sure want to delete", "delete", buttons);
            if (result == DialogResult.Yes)
            {
                runproc("delete");
            }
            Response.Redirect("ledger_form.aspx");
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("ledger_form.aspx");
        }
        public void runproc_save(String operation)
        {
            if (led_id.Value != "")
               GetLedger.led_id = Convert.ToInt32(led_id.Value.ToString());
            GetLedger.Sql_Operation = operation;
            GetLedger.Society_Id = society_id.Value;
            GetLedger.Led_Description = txt_des.Text;
            GetLedger.Led_Status = radiobtn1.Checked == true ? "Active" : "Inactive";
            bL_Ledger.updateLedgerDetails(GetLedger);

        }


        public void runproc(String operation)
        {
            if (led_id.Value != "")
                GetLedger.led_id = Convert.ToInt32(led_id.Value);
            GetLedger.Sql_Operation = operation;
            var result = bL_Ledger.updateLedgerDetails(GetLedger);

            led_id.Value = result.led_id.ToString();
            society_id.Value = result.Society_Id;
            txt_des.Text = result.Led_Description;
            if(result.Led_Status == "Active")
            {
                radiobtn1.Checked = true;
            }
           else if(result.Led_Status == "Inactive")
            {
                radiobtn2.Checked = true;
            }

           

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label led_id = (System.Web.UI.WebControls.Label)row.FindControl("led_id");
                GetLedger.Sql_Operation = "Delete";

                GetLedger.led_id = Convert.ToInt32(led_id.Text);
                bL_Ledger.delete(GetLedger);
                


            Ledger_GridBind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if(e.Row.RowType==DataControlRowType.DataRow)
            //{
            //    ((System.Web.UI.WebControls.Button)e.Row.Cells[7].Controls[0]).OnClientClick = "return confirm('Are you sure you want to log out?');";
            //}
        }

        protected void search_field_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (search_field.SelectedValue == "date")
            {
                txt_search.TextMode = TextBoxMode.Date;
            }
            else
                txt_search.TextMode = TextBoxMode.SingleLine;
            txt_search.Text = "";
        }
    }    
}