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
using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System.Windows.Forms;

namespace Society
{
    partial class inventory_search : System.Web.UI.Page
    {
        BL_Inventory_Master bL_Inventory = new BL_Inventory_Master();
        Inventory inventory = new Inventory();


        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {

                Inventory_Gridbind();

            }

        }

        public void Inventory_Gridbind()
        {
            DataSet dt = new DataSet();
            inventory.Sql_Operation = "Grid_Show";
            inventory.Society_Id = society_id.Value;
            dt = bL_Inventory.getInventoryDetails(inventory);

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
            sb.Append("Select * from inventory_master  where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            inventory.Sql_Operation = sb.ToString();
            var result = bL_Inventory.search_inventory(inventory);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }
            public void runproc_save(string operation)
        {
            if (inventory_id.Value != "")
                inventory.inventory_id = Convert.ToInt32(inventory_id.Value.ToString());
            inventory.Sql_Operation = operation;
            inventory.Society_Id = society_id.Value;
            inventory.In_Name = txt_name.Text;
            inventory.Qty = float.Parse(txt_quantity.Text);
            inventory.Slot = Convert.ToInt32(txt_slot.Text.ToString());
            inventory.Charges = float.Parse(txt_charges.Text);
            bL_Inventory.updateInventoryDetails(inventory);
        }

        public void runproc(string operation)
        {
            if (inventory_id.Value != "")
                inventory.inventory_id = Convert.ToInt32(inventory_id.Value);
            inventory.Sql_Operation = operation;
            var result = bL_Inventory.updateInventoryDetails(inventory);

            inventory_id.Value = result.inventory_id.ToString();
            society_id.Value = result.Society_Id;
            txt_name.Text = result.In_Name;
            txt_quantity.Text = result.Qty.ToString();
            txt_charges.Text = result.Charges.ToString();
            txt_slot.Text = result.Slot.ToString();
           
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {

            if (Label7.Text == "")
            {
                runproc_save("Update");
                Response.Redirect("inventory_search.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
           
                if (inventory_id.Value != "")
                    inventory.inventory_id = Convert.ToInt32(inventory_id.Value);
                inventory.Sql_Operation = "Delete";
                bL_Inventory.delete(inventory);
            
            Response.Redirect("inventory_search.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("inventory_search.aspx");
        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            inventory_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label inventory_id = (System.Web.UI.WebControls.Label)row.FindControl("inventory_id");
                inventory.Sql_Operation = "Delete";

                inventory.inventory_id = Convert.ToInt32(inventory_id.Text);
                bL_Inventory.delete(inventory);
           
            Inventory_Gridbind();

        }


    }
}
