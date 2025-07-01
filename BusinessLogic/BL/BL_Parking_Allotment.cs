﻿using DataAccessLayer.DA;
using DBCode.DataClass.Master_Dataclass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace BusinessLogic.BL
{
    public class BL_Parking_Allotment
    {
        DA_Parking_Allotment parking_Allotment = new DA_Parking_Allotment();
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            parking_Allotment.fill_drop(drp_down, sqlstring, text, value);
        }
        public DataSet GetParkingAllotment(Parking parking)
        {
            return parking_Allotment.GetParkingAllotment(parking);

        }
        public Parking UpdateParkingAllotment(Parking parking)
        {
            return parking_Allotment.updateparkingallotment(parking);

        }
        public Parking Parking_Delete(Parking parking)
        {
            return parking_Allotment.delete(parking);

        }
        public Parking Vehicle_No_Textchanged(Parking parking)
        {
            return parking_Allotment.vehicle_no_textchanged(parking);

        }

        public object search_park(Parking parking)
        {
            return parking_Allotment.parking_search(parking);
        }
    }
}