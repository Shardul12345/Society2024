using System;
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

namespace Society
{
    public partial class contact_search : System.Web.UI.Page
    {
        usefull_Contact Usefull = new usefull_Contact();
        BL_Usefull_Contact bL_Usefull = new BL_Usefull_Contact();

       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                //runproc("Select");

                contact_gridbind();

                if (Request.QueryString["id"] != null)
                {
                    //cust_id.Value = Request.QueryString["id"].ToString();

                }

            }

        }
        protected void contact_gridbind()
        {
            DataSet dt = new DataSet();
            Usefull.Sql_Operation = "Grid_Show";
            Usefull.Society_Id = society_id.Value;
            dt = bL_Usefull.GetUsefullContact(society_id.Value);
            GridView1.DataSource = dt.Tables[0];
            GridView1.DataBind();





            //using (SqlConnection con = new SqlConnection(cs))
            //{
            //    con.Open();
            //    //string sql = "Select model,serial,color,b_type,price,quantity,gst,t_amt from purchase_details";
            //    SqlCommand cmd = new SqlCommand("Select * from usefull_contact", con);
            //    SqlDataReader dr = cmd.ExecuteReader();
            //    if (dr.HasRows == true)
            //    {
            //        DataTable dt = new DataTable();
            //        dt.Load(dr);
            //        ViewState["dirState"] = dt;
            //        GridView1.DataSource = dt;
            //        GridView1.DataBind();
            //    }
            //    con.Close();
            //}
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
            Response.Redirect("contact1.aspx");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(" Select * from usefull_contact");
            if (txt_search.Text != "")
            {
                sb.Append(" Where " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }

            Usefull.Sql_Operation = sb.ToString();
            var result = bL_Usefull.search_usefull_contact(Usefull);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();




            //using (SqlConnection con = new SqlConnection(st.setsqlconnection()))
            //{
            //    //con = new SqlConnection(connectionstring);
            //    con.Open();
            //    //string sql = "Select model,serial,color,b_type,price,quantity,gst,t_amt from purchase_details";
            //    SqlCommand cmd = new SqlCommand(sb.ToString(), con);
            //    SqlDataReader dr = cmd.ExecuteReader();
            //    if (dr.HasRows == true)
            //    {
            //        // GridView1.DataSource = dr;
            //        GridView1.DataSource = dr;
            //        GridView1.DataBind();
            //        ////ds = new DataSet();
            //        //da.Fill(ds);
            //    }
            //    else
            //    {
            //        Response.Write("<script>alert('No Data Found !!')</script>");

            //        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "Popup", "Fail();", true) ;

            //    }
            //}
        }
    }
}


    
