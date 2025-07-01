﻿using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Society2024
{
    public partial class village_owner_master : System.Web.UI.Page
    {
        BL_Owner_Master bL_Owner = new BL_Owner_Master();
        Owner owner = new Owner();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["village_id"] == null)
              
            Response.Redirect("login1.aspx");
            village_id.Value = Session["village_id"].ToString();



            if (!IsPostBack)
            {
                fill_drop();
                village_owner_Gridbind();
                fetch_house_no();
                fetch_address();
            }

        }

        public void fill_drop()
        {
            String sql_query1 = "Select *  from house_type";
            bL_Owner.fill_drop(ddl_house_type, sql_query1, "house_type", "house_type_id");
            String sql_query5 = "Select *  from doc_master";
            bL_Owner.fill_drop(ddl_doc_type, sql_query5, "doc_name", "doc_id");
        }
        public void village_owner_Gridbind()
        {
            DataSet dt = new DataSet();
            owner.Sql_Operation = "Grid_Show";
            owner.Village_Id = (village_id.Value);
            dt = bL_Owner.get_village_owner(owner);
            OwnerGrid.DataSource = dt.Tables[0];
            ViewState["dirState"] = dt.Tables[0];
            OwnerGrid.DataBind();

        }
        public void runproc_save(String operation)
        {

            if (village_owner_id.Value != "")
                owner.Village_Owner_id = Convert.ToInt32(village_owner_id.Value.ToString());
            owner.Sql_Operation = "Update";
            owner.Village_Id = village_id.Value;
            owner.Name = txt_name.Text;
            owner.House_No = Convert.ToInt32(txt_house_no.Text);
            owner.House_Type = ddl_house_type.Text;
            owner.Sq_Ft = Convert.ToDecimal(txt_sq_ft.Text);
            owner.Address = txt_address.Text;
            owner.Pre_Mob = txt_pre_mob.Text;
            owner.Alter_Mob = txt_add_mob.Text;
            owner.Name = txt_name.Text;
            owner.Address_Line1 = txt_street.Text;
            owner.Id_Proof = uploadidproof.Text;
            bL_Owner.Update_Village_Owner(owner);
          
        }
        public void runproc(string operation)
        {
            if (village_owner_id.Value != "")
                owner.Village_Owner_id = Convert.ToInt32(village_owner_id.Value.ToString());
            owner.Sql_Operation = operation;

            var result = bL_Owner.get_house_owner(owner);
            if (operation == "Select")
            {

                (village_owner_id.Value) = result.Village_Owner_id.ToString();
                village_id.Value = result.Village_Id;
                txt_name.Text = result.Name;
                txt_house_no.Text = result.House_No.ToString();
                ddl_house_type.SelectedValue = result.House_Type.ToString();
                txt_sq_ft.Text = result.Sq_Ft.ToString();
                txt_address.Text = result.Address;
                txt_pre_mob.Text = result.Pre_Mob;
                txt_add_mob.Text = result.Alter_Mob;
                txt_street.Text = result.Address_Line1;
                listofuploadedfiles1.Text = Path.GetFileName(result.Id_Proof);
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            }
        }
      

        protected void btn_save_Click(object sender, EventArgs e)
        {
            btnotice_id_upload_Click(sender,e);
            runproc_save("Update");
           
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {

            if (village_owner_id.Value != "")
                owner.Village_Owner_id = Convert.ToInt32(village_owner_id.Value);
            owner.Sql_Operation = "Delete";
            bL_Owner.delete(owner);
            Response.Redirect("village_owner_master.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("village_owner_master.aspx");
        }
        public void fetch_house_no()
        {
            owner.Sql_Operation = "house_no_fetch";
            owner.Village_Id = village_id.Value;
            var result = bL_Owner.fetch_house_no(owner);
            txt_house_no.Text = result.House_No.ToString();

        }
        public void fetch_address()
        {
            owner.Sql_Operation = "address_fetch";
            owner.Village_Id = village_id.Value;
            var result = bL_Owner.address_fetch(owner);
            txt_street.Text = result.Address_Line1.ToString();
        }
        protected void btnotice_id_upload_Click(object sender, EventArgs e)
        {
            string createfolder = Server.MapPath("~/Documents") + "/" + txt_name.Text + "/" + (ddl_doc_type.SelectedItem.Text) + "/";

            System.IO.Directory.CreateDirectory(createfolder);

            if (FileUpload2.HasFiles)
            {

                foreach (HttpPostedFile file_name in FileUpload2.PostedFiles)
                {
                    file_name.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Documents") + "/" + txt_name.Text + "/" + (ddl_doc_type.SelectedItem.Text) + "/" + file_name.FileName));
                    listofuploadedfiles1.Text += file_name.FileName + "<br/>";

                }

                uploadidproof.Text = System.IO.Path.Combine(Server.MapPath("~/Documents") + "\\" + txt_name.Text + "\\" + (ddl_doc_type.SelectedItem.Text) + "\\" + FileUpload2.FileName);

            }
           

        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            village_owner_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);
        }
        protected void txt_pre_mob_TextChanged(object sender, EventArgs e)
        {

        }

        protected void OwnerGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            OwnerGrid.PageIndex = e.NewPageIndex;
            village_owner_Gridbind();
        }

        protected void OwnerGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void OwnerGrid_Sorting(object sender, GridViewSortEventArgs e)
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

                OwnerGrid.DataSource = dtrslt;
                OwnerGrid.DataBind();

            }
        }

        protected void OwnerGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)OwnerGrid.Rows[e.RowIndex];
            System.Web.UI.WebControls.Label village_owner_id = (System.Web.UI.WebControls.Label)row.FindControl("village_owner_id");
            owner.Sql_Operation = "Delete";

            owner.Village_Owner_id = Convert.ToInt32(village_owner_id.Text);
            bL_Owner.delete(owner);

            village_owner_Gridbind();
        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void ddl_district_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("SELECT dbo.house_owner.village_owner_id, dbo.house_owner.house_no, dbo.house_type.house_type, dbo.house_owner.sq_ft, dbo.house_owner.name, dbo.house_owner.address FROM dbo.house_owner INNER JOIN dbo.house_type ON dbo.house_owner.house_type = dbo.house_type.house_type_id where active_status=0 and village_id='" + village_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            owner.Sql_Operation = sb.ToString();
            var result = bL_Owner.search_house_owner(owner);
            OwnerGrid.DataSource = result;
            ViewState["dirState"] = result;
            OwnerGrid.DataBind();
        }

        protected void ddl_house_type_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}