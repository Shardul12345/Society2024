﻿using DataAccessLayer.MasterDA;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace BusinessLogic.MasterBL
{
    public class BL_User_Login
    {
        DA_User_Login dA_User = new DA_User_Login();
        public Login_Details UpdateLoginDetails(Login_Details login)
        {
           
            return dA_User.UpdateLoginDetails(login);
        
        }
        public DataTable getEventDetails(Login_Details details)
        {
            
            return dA_User.Event_Details(details);
        }

        public DataTable getmeeting(Login_Details details)
        {
           
            return dA_User.Meeting_Details(details);
        }

        public DataTable getnotice(Login_Details details)
        {
            
            return dA_User.Notice_Details(details);
        }

        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            dA_User.fill_drop(drp_down, sqlstring, text, value);
        }

        public DataTable getmaintenance(Login_Details details)
        {
           
            return dA_User.Maintenance_Details(details);
        }

        public DataTable getreceipt(Login_Details details)
        {
           
            return dA_User.Receipt_Details(details);
        }

        public Login_Details getmail(Login_Details details)
        {
           
            return dA_User.Get_Mail(details);
        }

        public DataTable get_expense_chart(Login_Details details)
        {
           
            return dA_User.Get_Expense_Chart(details);
        }

        

        public DataTable Get_Pdc_Clearing(Login_Details details)
        {
           
            return dA_User.Pdc_Clear(details);
        }

        public DataTable income_chart(Login_Details details)
        {
           
            return dA_User.Income_Chart(details);
        }

        public Login_Details getticket(Login_Details details)
        {
           
            return dA_User.GetTicket(details);
        }

        public DataTable search_admin(Login_Details details)
        {
            return dA_User.Search_Admin(details);
        }

        public DataTable getmonth(Login_Details details)
        {
            
            return dA_User.GetMonth(details);
        }

        public DataTable getdefaulter(Login_Details details)
        {
           
            return dA_User.GetDefaulter(details);
        }

        public DataTable search_defaulter(Login_Details details)
        {
            
            return dA_User.SearchDefaulter(details);
        }
        public Login_Details generate_token(Login_Details details)
        {

            return dA_User.Generate_Token(details);
        }
    }
}