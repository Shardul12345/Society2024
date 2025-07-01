using DataAccessLayer.MasterDA;
using DBCode.DataClass;
using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace BusinessLogic.MasterBL
{
    public class BL_Owner_Master
    {

        DA_Owner_Master DA_Owner = new DA_Owner_Master();
        public DataSet getOwnerDetails(Owner owner)
        {
            return DA_Owner.getOwnerDetails(owner);
        }
           
        public DataSet getFamilyDetails(Owner owner)
        {
            
            return DA_Owner.getFamilyDetails(owner);
            
        }
        public Owner updateOwnerDetails(Owner owner)
        {
            
            return DA_Owner.updateOwnerDetails(owner);
        }



        public Owner updateFamilyOwnerDetails(Owner owner)
        {
            
            return DA_Owner.updateFamilyOwnerDetails(owner);
           
        }

        public Owner runproc(Owner owner)
        {
           
            return DA_Owner.runproc(owner);
        }

        public Owner runproc_family(Owner owner)
        {
           
            return DA_Owner.runproc_family(owner);
        }
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            DA_Owner.fill_drop(drp_down, sqlstring, text, value);
        }

        public DataTable print_house_receipt(Owner owner)
        {
            return DA_Owner.Print_House_Receipt(owner);
        }

        public DataSet get_tax_receipt(Owner owner)
        {
            return DA_Owner.Get_Tax_Receipt(owner);
        }

        public Owner OwnerDelete(Owner owner)
        {
            
            return DA_Owner.owner_delete(owner);

        }
        public Owner FamilyDelete(Owner owner)
        {
          
            return DA_Owner.family_delete(owner);

        }

        public Owner FlatTextChanged(Owner owner)
        {
           
            return DA_Owner.flattextchanged(owner);
        }

        public DataSet get_village_owner(Owner owner)
        {
            return DA_Owner.Get_Village_Owner(owner);
        }

        public Owner TypeTextChanged(Owner owner)
        {

            return DA_Owner.typetextchanged(owner);
        }

        //public Owner TelNoTextchanged(Owner owner)
        //{
        //    DA_Owner_Master dA_Owner = new DA_Owner_Master();
        //    return dA_Owner.telnotextchanged(owner);
        //}
        public Owner MobileTextchanged(Owner owner)
        {
           
            return DA_Owner.mobiletextchanged(owner);
        }

        public object print_house_owner(Owner owner)
        {
            return DA_Owner.Print_House_Owner(owner);
        }

        //rental_search 
        public DataSet getRentalDetails(Owner owner)
        {

            return DA_Owner.getRentalDetails(owner);

        }

        public Owner update_house_tax_receipt(Owner owner)
        {
            return DA_Owner.Update_House_Tax_Receipt(owner);
        }

        public DataTable get_printowner(Owner owner)
        {
            return DA_Owner.Get_PrintOwner(owner);
        }

        public Owner Update_Village_Owner(Owner owner)
        {
            return DA_Owner.update_village_owner(owner);
        }
        public Owner get_house_owner(Owner owner)
        {
            return DA_Owner.runproc_house_owner(owner);
        }

        public Owner delete_house_tax(Owner owner)
        {
            return DA_Owner.Delete_House_Tax(owner);
        }

        public DataTable get_printunitwise_maintenance(Owner owner)
        {
            return DA_Owner.Get_Printunitwise_Maintenance(owner);
        }

        public DataTable get_printrental(Owner owner)
        {
            return DA_Owner.Get_PrintRental(owner);
        }

        public Owner UpdateRentalDetails(Owner owner)
        {

            return DA_Owner.updateRentalDetails(owner);

        }
        
        public DataTable search_rental(Owner owner)
        {
            return DA_Owner.search_rental(owner);
        }

        public Owner getFlat(Owner owner)
        {
            return DA_Owner.GetFlat(owner);
        }

        public Owner get_village_id(Owner owner)
        {
            return DA_Owner.Get_Village_Id(owner);
        }

        public Owner fetch_House_tax_receipt(Owner owner)
        {
            return DA_Owner.Fetch_House_Tax_Receipt(owner);
        }

        public Owner pending_house_tax_receipt(Owner owner)
        {
            return DA_Owner.Pending_House_Tax_Receipt(owner);
        }

        public Owner fetch_house_no(Owner owner)
        {
            return DA_Owner.Fetch_House_No(owner);
        }

        public DataTable search_house_owner(Owner owner)
        {
            return DA_Owner.house_owner_search(owner);
        }

        public Owner delete(Owner owner)
        {
            return DA_Owner.village_owner_delete(owner);
        }

        public Owner address_fetch(Owner owner)
        {
            return DA_Owner.Fetch_Address(owner);
        }

        public Owner check_select(Owner owner)
        {
            return DA_Owner.Check_Select(owner);
        }

        public DataTable search_house_tax_receipt(Owner owner)
        {
            return DA_Owner.House_Tax_Receipt_Search(owner);
        }
    }
}