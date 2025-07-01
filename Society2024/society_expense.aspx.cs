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
using Utility.DataClass;
using BusinessLogic.BL;
using System.Windows.Forms;
using DataAccessLayer.DA;
using DBCode.DataClass;
using Microsoft.Ajax.Utilities;
using BusinessLogic.MasterBL;
using DBCode.DataClass.Master_Dataclass;

namespace Society
{
    partial class society_expense : System.Web.UI.Page
    {
        Society_Expense society = new Society_Expense();
        Society_Member member = new Society_Member();
        BL_Society_Expense bL_Society = new BL_Society_Expense();
        BL_Society_Member_Master bL_Society_member = new BL_Society_Member_Master();
        DataTable approverdt = new DataTable();

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                filldrop();
                Society_Expense_Gridbind();
                fetch_expense();
                list_fill();
                ViewState["user_data"] = approverdt;
            }


        }
        public void filldrop()
        {
            String sql_query1 = "Select * from vendor_master where society_id='" + society_id.Value + "'";
            bL_Society.fill_drop(ddl_vendor, sql_query1, "v_name", "vendor_id");
            String sql_query2 = "Select * from building_master where society_id='" + society_id.Value + "'";
            bL_Society.fill_drop(ddl_build, sql_query2, "name", "build_id");


        }



        protected void Society_Expense_Gridbind()
        {
            DataSet dt = new DataSet();
            society.Sql_Operation = "Grid_Show";
            society.Society_Id = society_id.Value;
            dt = bL_Society.GetExpense(society);
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
            sb.Append("Select * from society_expense_vw where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            society.Sql_Operation = sb.ToString();
            var result = bL_Society.search_society_expense(society);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }
        public void runproc_save(String operation)
        {
            if (expense_id.Value != "")
                society.expense_id = Convert.ToInt32(expense_id.Value);
            society.Society_Id = society_id.Value;
            society.Invoice_No = txt_no.Text;
            society.Date = Convert.ToDateTime(txt_date.Text);
            society.Sql_Operation = operation;
            society.build_id = ddl_build.SelectedValue;

            if (cash.Checked == true)
            {
                society.Ex_Type = Convert.ToInt32(cash.Checked == true ? 1 : 0).ToString();
                society.Ex_Name = txt_name.Text;
            }
            if (vendor.Checked == true)
            {
                society.Ex_Type = Convert.ToInt32(vendor.Checked == true ? 0 : 1).ToString();
                society.Ex_Name = ddl_vendor.SelectedItem.ToString();
            }
            society.Ex_Details = txt_details.Text;
            society.Comments = txt_comment.Text;
            society.Add_Maintanance = Convert.ToInt32(add_chk.Checked == true ? 1 : 0).ToString();
            society.Amount = float.Parse(txt_amount.Text);
            society.Tax = float.Parse(txt_tax.Text);
            if (txt_tds.Text != "")
                society.Tds = float.Parse(txt_tds.Text);
            society.F_Amount = float.Parse(txt_famount.Text);
            society.Regular = Convert.ToInt32(regular_chk.Checked == true ? 1 : 0).ToString();
            var result = bL_Society.UpdateExpense(society);
            expense_id.Value = result.expense_id.ToString();
            DataTable dt = (DataTable)ViewState["user_data"];
            foreach (DataRow dataRow in dt.Rows)
            {
                society.expense_id = Convert.ToInt32(expense_id.Value);
                society.User_Id = Convert.ToInt32(dataRow["user_id"].ToString());
                bL_Society.updateApprover(society);

            }
        }

        public void runproc(string operation)
        {

            if (expense_id.Value != "")
                society.expense_id = Convert.ToInt32(expense_id.Value);
            society.Sql_Operation = operation;

            var result = bL_Society.runproc_select(society);


            expense_id.Value = result.expense_id.ToString();
            txt_no.Text = result.Invoice_No;

            txt_date.Text = result.Date.ToString("yyyy-MM-dd");
            ddl_build.SelectedValue = result.build_id;
            if (result.Ex_Type == "1")
            {
                cash.Checked = true;
                txt_name.Text = result.Ex_Name;
                ddl_vendor.Visible = false;
                txt_name.Visible = true;
            }
            else

            {
                var a = ddl_vendor.SelectedValue;
                vendor.Checked = true;
                ddl_vendor.SelectedValue = ddl_vendor.Items.FindByText(result.Ex_Name).Value;
                ddl_vendor.Visible = true;
                txt_name.Visible = false;
            }
            txt_details.Text = result.Ex_Details;
            txt_comment.Text = result.Comments;
            //society.Add_Maintanance = Convert.ToInt32(add_chk.Checked == true ? 1 : 0).ToString();
            if (result.Add_Maintanance == "1")
            {
                add_chk.Checked = true;
            }
            if (result.Regular == "1")
            {
                regular_chk.Checked = true;
            }
            txt_amount.Text = result.Amount.ToString();
            txt_tax.Text = result.Tax.ToString();
            txt_tds.Text = result.Tds.ToString();
            txt_famount.Text = result.F_Amount.ToString();
            if(result.Status==1)
            {
                expense_panel.Enabled = false;
            }

        }

        public void runproc_approvar(string operation)
        {
            if (approvar_id.Value != "")
                society.Approvar_Id = Convert.ToInt32(approvar_id.Value);
            society.User_Id = Convert.ToInt32(mem_id.Value);
            society.expense_id = Convert.ToInt32(expense_id.Value);
            society.Sql_Operation = operation;
            bL_Society.updateApprover(society);
        }
        public void fetch_expense()
        {
            society.Sql_Operation = "invoice_fetch";
            society.Society_Id = society_id.Value;
            var result = bL_Society.Fetch_Expense(society);
            txt_no.Text = result.Invoice_No;
        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            expense_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;
          
            btn_add.Visible = false;
            getapprovallist();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        private void getapprovallist()
        {
            DataTable dt = new DataTable();
            society.Sql_Operation = "Grid_Show";
            society.expense_id = Convert.ToInt32(expense_id.Value);
            dt = bL_Society.GetApprover(society);
            GridView3.DataSource = dt;
            ViewState["user_data"] = dt;
            GridView3.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            DataTable approverdt = (DataTable)ViewState["user_data"];
            if (approverdt.Rows.Count > 0)
            {



                runproc_save("Update");
                Response.Redirect("society_expense.aspx");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('Add at least one Approver.')", true);

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("society_expense.aspx");
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {

            if (expense_id.Value != "")
                society.expense_id = Convert.ToInt32(expense_id.Value);
            society.Sql_Operation = "Delete";
            bL_Society.delete(society);

            Response.Redirect("society_expense_search.aspx");

        }




        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            System.Web.UI.WebControls.Label expense_id = (System.Web.UI.WebControls.Label)row.FindControl("expense_id");
            society.Sql_Operation = "Delete";

            society.expense_id = Convert.ToInt32(expense_id.Text);
            bL_Society.delete(society);

            //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            Society_Expense_Gridbind();

        }


        protected void vendor_CheckedChanged(object sender, EventArgs e)
        {
            if (vendor.Checked == true)
            {
                ddl_vendor.Visible = true;
                txt_name.Visible = false;
            }
        }

        protected void cash_CheckedChanged(object sender, EventArgs e)
        {
            if (cash.Checked == true)
                txt_name.Visible = true;
            txt_name.Text = "Cash";
            ddl_vendor.Visible = false;
        }

        protected void txt_tax_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_amount_TextChanged(object sender, EventArgs e)
        {
            txt_tax.Text = (Decimal.Parse(txt_amount.Text) / 100).ToString();
            //txt_tds.Text = (Decimal.Parse(txt_amount.Text) * 0.10m).ToString();
            txt_famount.Text = (Decimal.Parse(txt_tax.Text) + Decimal.Parse(txt_amount.Text)).ToString();

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                DataSet dt = new DataSet();
                society.Sql_Operation = "reg_exp";
                society.Society_Id = society_id.Value;
                dt = bL_Society.chk_reg_exp(society);
                GridView1.DataSource = dt.Tables[0];
                ViewState["dirState"] = dt.Tables[0];
                GridView1.DataBind();
            }
            else
            {
                Society_Expense_Gridbind();
            }
        }

        protected void CheckAll_CheckedChanged(object sender, EventArgs e)
        {

            bool isAllChecked;
            if (CheckAll.Checked)
                isAllChecked = true;
            else
                isAllChecked = false;
            foreach (GridViewRow row in GridView2.Rows)
            {
                System.Web.UI.WebControls.CheckBox chkBx = (System.Web.UI.WebControls.CheckBox)row.FindControl("chk");
                chkBx.Checked = isAllChecked;
            }

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool isAllChecked = true;
            //foreach (ListItem item in CheckBoxList1.Items)
            //{
            //    if (!item.Selected)
            //    {
            //        isAllChecked = false;
            //        break;
            //    }
            //}

            CheckAll.Checked = isAllChecked;
        }

        public void list_fill()
        {

            DataSet dt = new DataSet();
            member.Sql_Operation = "add_approver";
            member.Society_Id = society_id.Value;
            member.UserId =Convert.ToInt32( Session["UserId"].ToString());
            dt = bL_Society_member.add_approver(member);


            GridView2.DataSource = dt.Tables[0];

            GridView2.DataBind();


        }

        protected void btn_confirm_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            member.Sql_Operation = "add_approver";
            member.Society_Id = society_id.Value;
            member.UserId = Convert.ToInt32(Session["UserId"].ToString());
            ds = bL_Society_member.add_approver(member);
            approverdt = ds.Tables[0];
            foreach (GridViewRow row in GridView2.Rows)
            {

                //    System.Web.UI.WebControls.Label user_id = (System.Web.UI.WebControls.Label)row.FindControl("user_id");
                //    System.Web.UI.WebControls.CheckBox chkBx = (System.Web.UI.WebControls.CheckBox)row.FindControl("chk");
                //    if (!chkBx.Checked)
                //    {
                //        foreach (DataRow dataRow in approverdt.Rows)
                //        {
                //            if (dataRow["user_id"].ToString() == user_id.Text)

                //                dataRow.Delete();



                //        }



                //    }
                //}
                //approverdt.AcceptChanges();
                //ViewState["user_data"] = approverdt;
                //GridView3.DataSource = approverdt;
                //GridView3.DataBind();
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);






                System.Web.UI.WebControls.Label user_id = (System.Web.UI.WebControls.Label)row.FindControl("user_id");
                System.Web.UI.WebControls.CheckBox chkBx = (System.Web.UI.WebControls.CheckBox)row.FindControl("chk");

                if (!chkBx.Checked)
                {
                    
                    List<DataRow> rowsToDelete = new List<DataRow>();

                    foreach (DataRow dataRow in approverdt.Rows)
                    {
                       
                        if (dataRow.RowState != DataRowState.Deleted && dataRow["user_id"].ToString() == user_id.Text)
                        {
                            rowsToDelete.Add(dataRow);
                        }
                    }

                   
                    foreach (DataRow rowToDelete in rowsToDelete)
                    {
                        rowToDelete.Delete();
                    }
                }

            }

            approverdt.AcceptChanges();
            ViewState["user_data"] = approverdt;
            GridView3.DataSource = approverdt;
            GridView3.DataBind();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        protected void name_CheckedChanged(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.CheckBox activeCheckBox = sender as System.Web.UI.WebControls.CheckBox;
            GridViewRow Row = (GridViewRow)activeCheckBox.NamingContainer;

            bool isAllChecked = true;
            foreach (GridViewRow row in GridView2.Rows)
            {
                System.Web.UI.WebControls.CheckBox chkBx = (System.Web.UI.WebControls.CheckBox)row.FindControl("chk");
                if (!chkBx.Checked)
                {
                    isAllChecked = false;
                    break;
                }
            }
            CheckAll.Checked = isAllChecked;

        }

        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            if (ViewState["user_data"] != null)
            {
                DataTable approverdt = (DataTable)ViewState["user_data"];

                // Safety check: Ensure index is within range
                if (e.RowIndex >= 0 && e.RowIndex < approverdt.Rows.Count)
                {
                    approverdt.Rows.RemoveAt(e.RowIndex); // Remove the row from the DataTable
                    ViewState["user_data"] = approverdt; // Save the updated DataTable in ViewState
                }

                // Rebind GridView3 to reflect the deletion
                ViewState["user_data"] = approverdt;
                GridView3.DataSource = approverdt;
                GridView3.DataBind();
                list_fill();
            }

        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["user_data"];
            if (dt != null)
                foreach (GridViewRow row in GridView2.Rows)
                {
                    System.Web.UI.WebControls.Label user_id = (System.Web.UI.WebControls.Label)row.FindControl("user_id");
                    System.Web.UI.WebControls.CheckBox chkBx = (System.Web.UI.WebControls.CheckBox)row.FindControl("chk");
                    foreach (DataRow dataRow in dt.Rows)
                    {
                        if (dataRow["user_id"].ToString() == user_id.Text)
                        {
                            chkBx.Checked = true;
                            break;
                        }
                        else
                        {
                            chkBx.Checked = false;
                            CheckAll.Checked = false;
                        }


                    }
                }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                GridView3.ShowHeader = false;
                GridView3.GridLines = GridLines.None;
                DataTable dt = (DataTable)ViewState["user_data"];
                System.Web.UI.WebControls.Label status = (System.Web.UI.WebControls.Label)e.Row.FindControl("status");
                System.Web.UI.WebControls.Button btn_approve = (System.Web.UI.WebControls.Button)e.Row.FindControl("btn_approved");
                System.Web.UI.WebControls.Label user_id = (System.Web.UI.WebControls.Label)e.Row.FindControl("user_id");


                if (status.Text == "No Action")
                    e.Row.Cells[2].ForeColor = System.Drawing.Color.Red;
                else
                {
                    e.Row.Cells[2].ForeColor = System.Drawing.Color.Green;
                    btn_approve.Visible = false;
                }

                if (Session["UserId"].ToString() == user_id.Text)
                {
                    if (status.Text == "No Action")
                    {
                        btn_approve.Visible = true;
                        status.Visible = false;
                    }
                    else
                    {
                        btn_approve.Visible = false;
                        status.Visible = true;
                    }

                }
                else
                {
                    btn_approve.Visible = false;
                    // break;
                }
                foreach (DataRow dataRow in dt.Rows)
                {
                    if (dataRow["type"].ToString() == "get")
                    {
                        GridView3.Columns[3].Visible = false;
                        GridView3.ShowHeader = true;
                        GridView3.GridLines = GridLines.Both;
                        GridView3.Columns[2].Visible = true;


                    }
                }


            }
        }


        protected void btn_approved_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button approve = sender as System.Web.UI.WebControls.Button;
            GridViewRow row = (GridViewRow)approve.NamingContainer;
            System.Web.UI.WebControls.Label user_id = (System.Web.UI.WebControls.Label)row.FindControl("user_id");
            society.User_Id = Convert.ToInt32(user_id.Text);
            society.expense_id = Convert.ToInt32(expense_id.Value);
            society.Sql_Operation = "update_status";
            bL_Society.update_status(society);
            getapprovallist();
        }
    }
}



