﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using Page = System.Web.UI.Page;
using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System.Windows.Forms;
//using System.IdentityModel.Metadata;

namespace Society
{
    public partial class caretaker : Page
    {
        BL_CareTaker_Master bL_Caretaker = new BL_CareTaker_Master();
        Caretaker care = new Caretaker();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                
                Caretaker_Gridbind();
                fill_drop1();
            }
        }


        public void fill_drop1()
        {

            String sql_query = "Select *  from doc_master";
            bL_Caretaker.fill_drop(ddl_doc_name, sql_query, "doc_name", "doc_id");

            String sql_query1 = "Select *  from state";
            bL_Caretaker.fill_drop(ddl_state, sql_query1, "state", "state_id");

            String sql_query2 = "Select wing_id,(name + w_name) as name from global_society_view";
            bL_Caretaker.fill_drop(ddl_build_wing1, sql_query2, "name", "wing_id");
        }

        public void Caretaker_Gridbind()
        {
            DataSet dt = new DataSet();
            dt = bL_Caretaker.CareTakerDetails(society_id.Value);
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
            sb.Append(" Select * from caretaker_master where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '%" + txt_search.Text + "%'");
            }
            care.Sql_Operation = sb.ToString();
            var result = bL_Caretaker.search_caretaker(care);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }

        public void runproc_save(string operation)
        {
            if (caretaker_id.Value != "")
                care.Caretaker_Id = Convert.ToInt32(caretaker_id.Value);
            care.Sql_Operation = operation;
            care.Society_Id = society_id.Value;
            care.Wing_Id = Convert.ToInt32(ddl_build_wing1.SelectedValue.ToString());
            care.Flat_No = txt_flat_no.Text;
            care.C_Name = txt_c_name.Text;
            care.doc_id = Convert.ToInt32(ddl_doc_name.SelectedValue.ToString());
            care.C_Address = txt_c_address.Text;
            care.Area = txt_area.Text;
            care.Mobile_No = txt_mobile_no.Text;
            care.Email = txt_email.Text;
            care.City = txt_city.Text;
            care.State_Id = Convert.ToInt32(ddl_state.SelectedValue.ToString());
            care.Pincode = txt_pincode.Text;
            //care.Doc_Executed = txt_doc_executed.Text;
            bL_Caretaker.updateCareTakerDetails(care);
        }

        public void runproc(string operation)
        {
            if (caretaker_id.Value != "")
               care.Caretaker_Id = Convert.ToInt32(caretaker_id.Value);
            care.Sql_Operation = operation;
            var result = bL_Caretaker.updateCareTakerDetails(care);

            caretaker_id.Value = result.Caretaker_Id.ToString();
            society_id.Value = result.Society_Id;
            wing_id.Value = result.Wing_Id.ToString();
            txt_flat_no.Text = result.Flat_No;
            txt_c_name.Text = result.C_Name;
            ddl_doc_name.SelectedValue = result.doc_id.ToString();
            txt_c_address.Text = result.C_Address;
            txt_area.Text = result.Area;
            txt_mobile_no.Text = result.Mobile_No;
            txt_email.Text = result.Email;
            txt_city.Text = result.City;
            ddl_state.SelectedValue = result.State_Id.ToString();
            txt_pincode.Text = result.Pincode;
            //txt_doc_executed.Text = result.Doc_Executed;

        }


        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (Label13.Text == "")
            {
                runproc_save("Update");
                Response.Redirect("caretaker.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

            }
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("caretaker.aspx");
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
                if (caretaker_id.Value != "")
                    care.Caretaker_Id = Convert.ToInt32(caretaker_id.Value);
                care.Sql_Operation = "Delete";
                bL_Caretaker.delete(care);
            
            Response.Redirect("caretaker.aspx");

        }



        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            caretaker_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label c_id = (System.Web.UI.WebControls.Label)row.FindControl("caretaker_id");
                care.Sql_Operation = "Delete";

                care.Caretaker_Id = Convert.ToInt32(c_id.Text);
                bL_Caretaker.delete(care);
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
          
            Caretaker_Gridbind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }


        protected void ddl_build_wing_SelectedIndexChanged(object sender, EventArgs e)
        {
            //care.Flat_No = (txt_flat_no.Text);
            //care.wing_id = Convert.ToInt32(ddl_build_wing1.SelectedValue);
            //care.Sql_Operation = "GetFlat";
            //var result = bL_Caretaker.(care);
            //txt_flat_no.Text = result.Flat_No.ToString();


            //party.owner_id = Convert.ToInt32(ddl_name.SelectedValue);
            //party.Sql_Operation = "GetFlat";
            //var result = bL_Party.getflatno(party);
            //txt_flat.Text = result.Flat_No.ToString();




            //ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            //SqlDataReader sdr = null;
            //string status1 = "";

            //data_item.Add(st.create_array("operation", "check_no"));
            //data_item.Add(st.create_array("flat_no", string.IsNullOrWhiteSpace(txt_flat_no.Text) ? (object)DBNull.Value : txt_flat_no.Text));
            //data_item.Add(st.create_array("w_id", string.IsNullOrWhiteSpace(ddl_build_wing1.SelectedValue) ? (object)DBNull.Value : ddl_build_wing1.SelectedValue));
            //status1 = st.run_query(data_item, "Select", "sp_caretaker_master", ref sdr);
            //if (status1 == "Done")
            //{
            //    if (sdr.Read())
            //    {
            //        Label13.Text = ("Already exist");
            //    }
            //    else
            //        Label13.Text = "";


        }
    }
}
