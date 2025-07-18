﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Net;
using Utility.DataClass;
using BusinessLogic.BL;

namespace Society
{
    public partial class new_registration : Page
    {
        Login_Details Details = new Login_Details();
        BL_New_Registration BL_new_Registration = new BL_New_Registration();

        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               
            }
        }

        public void runproc_save(String operation)
        {

            if (UserLoginId.Value != "")
                Details.UserLoginId = Convert.ToInt32(UserLoginId.Value.ToString());
           
            Details.Sql_Operation = operation;
            Details.Name = txt_Name.Text;
            Details.UserName = txt_user.Text;
            Details.Password = txt_new_pass.Text;
            Details.Address = txt_Address.Text;
            Details.Mobile = txt_Mobile.Text;
            Details.Emailid = txt_Emailid.Text;
            Details.Type = radiobtn1.Checked == true ? "Society" : "Village";
            var result = BL_new_Registration.Save_Registration(Details);
            Session["society_id"] = result.Society_Id;
            Session["village_id"] = result.Village_Id;


        }


        protected void btn_save_Click(object sender, EventArgs e)
        {

            Details.Emailid = txt_Emailid.Text;
            Details.Sql_Operation = "check_Email";
            var result = BL_new_Registration.Email_Check(Details);
            if (result.Sql_Result == "Exist")
                Label10.Text = "This Email ID Already Registered With Us";
            else
            {
                runproc_save("Update");
                // Response.Redirect("society_search.aspx?UserLoginId=" + Session["UserTypeId"].ToString());
                if (radiobtn1.Checked)
                    Response.Redirect("new_society.aspx");
                else
                    Response.Redirect("new_village.aspx");
            }
        }



        protected void btn_verify2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }
        protected string Generate_otp()
        {
            char[] charArr = "0123456789".ToCharArray();
            string strrandom = string.Empty;
            Random objran = new Random();
            for (int i = 0; i < 4; i++)
            {
                //It will not allow Repetation of Characters
                int pos = objran.Next(1, charArr.Length);
                if (!strrandom.Contains(charArr.GetValue(pos).ToString())) strrandom += charArr.GetValue(pos);
                else i--;
            }
            return strrandom;
        }
        protected void btn_verify1_Click(object sender, EventArgs e)
        {
            string otp = Generate_otp();
            string mobileNo = txt_Mobile.Text.Trim();
            string SMSContents = "", smsResult = "";
            SMSContents = otp + " is your One-Time Password, valid for 10 minutes only, Please do not share your OTP with anyone.";
            smsResult = SendSMS(mobileNo, SMSContents);
            txt_Mobile.Focus();
            //lblMsg.Text = " OTP is sent to your registered mobile no.";
            //lblMsg.CssClass = "green";
            mobileNo = string.Empty;
            txt_Mobile.Focus();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "countdown()", true);
            Panel1.Visible = true;

        }
        public static string SendSMS(string MblNo, string Msg)
        {
            string MainUrl = "SMSAPIURL"; //Here need to give SMS API URL
            string UserName = "username"; //Here need to give username
            string Password = "Password"; //Here need to give Password
            string SenderId = "SenderId";
            string strMobileno = MblNo;
            string URL = "";
            URL = MainUrl + "username=" + UserName + "&msg_token=" + Password + "&sender_id=" + SenderId + "&message=" + HttpUtility.UrlEncode(Msg).Trim() + "&mobile=" + strMobileno.Trim() + "";
            string strResponce = GetResponse(URL);
            string msg = "";
            if (strResponce.Equals("Fail"))
            {
                msg = "Fail";
            }
            else
            {
                msg = strResponce;
            }
            return msg;
        }
        public static string GetResponse(string smsURL)
        {
            try
            {
                WebClient objWebClient = new WebClient();
                System.IO.StreamReader reader = new System.IO.StreamReader(objWebClient.OpenRead(smsURL));
                string ResultHTML = reader.ReadToEnd();
                return ResultHTML;
            }
            catch (Exception)
            {
                return "Fail";
            }
        }
        protected void txt_Emailid_TextChanged(object sender, EventArgs e)
        {
            txt_user.Text = txt_Emailid.Text;
            txt_new_pass.Focus();
            //txt_UserName.Enabled = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}
 
