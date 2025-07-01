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
using Society2024;

namespace Society
{

    public partial class event_search : System.Web.UI.Page
    {
        Event evt = new Event();
        BL_Event_Master bL_Event = new BL_Event_Master();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();

            if (!IsPostBack)
            {
                Event_Gridbind();
                
            }

        }

        public void Event_Gridbind()
        {
            DataSet dt = new DataSet();
            evt.Sql_Operation = "Grid_Show";
            evt.Society_Id = society_id.Value;
            dt = bL_Event.getEventDetails(evt);
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


        protected void btn_new_Click(object sender, EventArgs e)
        {
            Response.Redirect("event_search.aspx");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(" Select * from event_master where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '%" + txt_search.Text + "%'");

            }
            evt.Sql_Operation = sb.ToString();
           var result = bL_Event.search_event(evt);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();

        }


        public void runproc_save(string operation)
        {
            if (event_id.Value != "")
                evt.Event_Id = Convert.ToInt32(event_id.Value.ToString());
            evt.Sql_Operation = operation;
            evt.Society_Id = society_id.Value;
            evt.Event_Name = txt_sub.Text;
            evt.From_Date = Convert.ToDateTime(txt_from_date.Text.ToString());
            evt.To_Date = Convert.ToDateTime(txt_to_date.Text.ToString());
            evt.Description = txt_desc.Text;
           var result= bL_Event.updateEventDetails(evt);
            foreach (DataRow row in result.Rows)
            {
                evt.User_Id = Convert.ToInt32(row["user_id"].ToString());
                evt.UserType = row["type"].ToString();
                evt.Notification_Id = evt.Event_Id;
             evt.Notification_Type = "Event";
                evt.Body = txt_sub.Text;
                bL_Event.send_notification(evt);
                generate_notification(row["token"].ToString());
            }
        }

        protected async void generate_notification(string token)
        {
            var Fcm = new FirebaseCloudMessaging();
            string result1 = await Fcm.SendNotificationAsync(token, "New Event", txt_sub.Text);
        }

        public void runproc(string operation)
        {
            if (event_id.Value != "")
                evt.Event_Id = Convert.ToInt32(event_id.Value);
            evt.Sql_Operation = operation;
            var result = bL_Event.getevent(evt);

            event_id.Value = result.Event_Id.ToString();
            society_id.Value = result.Society_Id;
            txt_sub.Text = result.Event_Name;
            txt_from_date.Text = result.From_Date.ToString("yyyy-MM-dd");
            txt_to_date.Text = result.To_Date.ToString("yyyy-MM-dd");
            txt_desc.Text = result.Description;

        }
        protected void btn_save_Click1(object sender, EventArgs e)
        {
            runproc_save("Update");
            txt_sub.Text = null;
            txt_from_date.Text = null;
            txt_to_date.Text = null;
            txt_desc.Text = null;
            Event_Gridbind();

            //Response.Redirect("event_search.aspx");

        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
           
                if (event_id.Value != "")
                    evt.Event_Id = Convert.ToInt32(event_id.Value);
                evt.Sql_Operation = "Delete";
                bL_Event.delete(evt);
            
            Response.Redirect("event_search.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("event_search.aspx");

        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            event_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show("Are you sure want to delete", "delete", buttons);
            if (result == DialogResult.Yes)
            {
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label event_id = (System.Web.UI.WebControls.Label)row.FindControl("event_id");
                evt.Sql_Operation = "Delete";

                evt.Event_Id = Convert.ToInt32(event_id.Text);
                bL_Event.delete(evt);
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            }
            Event_Gridbind();

        }



        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void search_field_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (search_field.SelectedValue == "from_date")
            {
                txt_search.TextMode = TextBoxMode.Date;
            }
            else
                txt_search.TextMode = TextBoxMode.SingleLine;
            txt_search.Text = "";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Event_Gridbind();
        }
    }
}


