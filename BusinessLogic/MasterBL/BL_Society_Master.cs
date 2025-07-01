﻿using DataAccessLayer.MasterDA;
using DBCode.DataClass.Master_Dataclass;
using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace BusinessLogic.MasterBL
{
    public class BL_Society_Master
    {
        stored st = new stored();
        //DA_Society_Master DA_Society = new DA_Society_Master();
        DA_Society_Master dA_Society = new DA_Society_Master();
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            st.fill_drop(drp_down, sqlstring, text, value);
        }
        public DataSet getcharge(Search_Society society)
        {

            return dA_Society.getCharge(society);
            
        }
        public Search_Society updateSocietyDetails(Search_Society society)
        {
         
            return dA_Society.updateSocietyDetails(society);


        }
        public Search_Society delete(Search_Society society)
        {
           
            return dA_Society.delete_society(society);

        }     



        public Search_Society SelectTextChanged(Search_Society society)
        {
           
            return dA_Society.SelectTextChanged(society);

        }

        public DataTable search_society(Search_Society society)
        {
          
            return dA_Society.society_search(society);
        }

        public Search_Society updatecharges(Search_Society society)
        {
            return dA_Society.Update_Charges(society);
        }

        public DataSet getSocietyDetails(string society)
        {
            return dA_Society.Get_Society_Details(society);
        }

        public Search_Society detete_charge(Search_Society society)
        {
            return dA_Society.Delete_Charge(society);
        }

        public DataTable search_society_charges(Search_Society society)
        {
            return dA_Society.society_search(society);
        }

        public Search_Society check_society(Search_Society society)
        {
            return dA_Society.Check_society(society);
        }
    }
}