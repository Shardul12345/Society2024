using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Utility.DataClass
{
    public class staff
    {
        private int staffid;
        private string name;
        private string address;
        private string contactno;
        private string buildingname;
        private string email;
        private DateTime dateofjoin;
        private string societyid;
        private int bid;
        private string role;
        private string Operation;
        private string Result;


        public int Staff_Id
        {
            get { return staffid; }
            set { staffid = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        public string Contact_No
        {
            get { return contactno; }
            set { contactno = value; }
        }
        public string Building_Name
        {
            get { return buildingname; }
            set { buildingname = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public DateTime Date_Of_Join
        {
            get { return dateofjoin; }
            set { dateofjoin = value; }
        }
        public string Society_Id
        {
            get { return societyid; }
            set { societyid = value; }
        }
        public int B_Id
        {
            get { return bid; }
            set { bid = value; }
        }
        public string Role
        {
            get { return role; }
            set { role = value; }
        }
        public string Sql_Operation
        {
            get { return Operation; }
            set { Operation = value; }
        }
        public string Sql_Result
        {
            get { return Result; }
            set { Result = value; }
        }



    }
}