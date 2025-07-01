﻿using BusinessLogic.MasterBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace Society
{
    public partial class SiteMaster : MasterPage
    {
        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();


            if (Session["Name"] != null)
            {
                Panel1.Visible = true;
                txt_welcome.Text = "Hello,\n" + Session["Name"].ToString();
                name_society.Text = "Welcome To " + Session["society_name"].ToString();
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            //Session.Clear();
            //Session.Abandon();
            //Response.Redirect(Request.RawUrl);

            //Response.Redirect("login1.aspx");



            // Clear session
            Session.Clear();
            Session.Abandon();

            // Prevent caching so Back button won't show the previous page
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();

            // Redirect to login
            Response.Redirect("login1.aspx", true);

        }
    }
}