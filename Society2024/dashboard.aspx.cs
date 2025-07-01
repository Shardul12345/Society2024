using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Utility.DataClass;
using BusinessLogic.MasterBL;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;

namespace Society
{
    public class MyDataModel
    {
        public Color Color { get; set; }
        public string Label { get; set; }
        public int Value { get; set; }
    }
    public partial class dashboard : System.Web.UI.Page
    {

        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();
        protected void Page_Load(object sender, System.EventArgs e)
        {
           
            if (Session["UserId"] == null)
            {
                Response.Redirect("login1.aspx");
            }

            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();

            if (!IsPostBack)
            {
                //pdc_reminder_Gridbind();
                //Event_Gridbind();
                //Meeting_Gridbind();
                //Notice_Gridbind();
                //maintenance_Gridbind();
                //Receipt_Gridbind();
                //GetDataForChart1();
                //GetDataForPieChart();
                //get_ticket();
                //BindMonthData();
                //fetch_defaulter();

                lblDateRange.Text = (new DateTime(DateTime.Now.Year, 1, 1).ToShortDateString() + " to " + DateTime.Now.ToShortDateString()).ToString();

            }

        }

        public void fetch_defaulter()
        {
            details.Sql_Operation = "defaulter_show";
            details.Society_Id = society_id.Value;
            var dt = BL_Login.getdefaulter(details);
            defaulter.Text = dt.Rows.Count.ToString() + " defaulters";
        }
        public void GetDataForChart1()
        {
            //details.Sql_Operation = "ExpenseChart";
            //details.Society_Id = society_id.Value;
            //var dt = BL_Login.get_expense_chart(details);
            //Chart2.DataSource = dt;
            //Chart2.DataBind();

            //due_bal.Text = "-" + dt.Compute("Sum(f_amount)", string.Empty).ToString();



            //details.Sql_Operation = "ExpenseChart";
            //details.Society_Id = society_id.Value;
            //var dt = BL_Login.get_expense_chart(details);

            //if (dt == null || dt.Rows.Count == 0)
            //{
            //    Chart2.Visible = false; // Hide the chart if no data is available
            //    due_bal.Text = "No Data Available";
            //    return;
            //}

            //Chart2.Visible = true; // Ensure the chart is visible when data is available
            //Chart2.DataSource = dt;
            //Chart2.DataBind();

            //due_bal.Text = "-" + dt.Compute("Sum(f_amount)", string.Empty).ToString();


            details.Sql_Operation = "ExpenseChart";
            details.Society_Id = society_id.Value;
            var dt = BL_Login.get_expense_chart(details);

            bool hasData = dt != null && dt.Rows.Count > 0;

            // Show/hide data elements based on availability
            Chart2.Visible = hasData;
            Label35.Visible = hasData;
            due_bal.Visible = hasData;

            if (!hasData)
            {
                due_bal.Text = "No Data Available";
                return;
            }

            // Ensure the title is always visible

            //Chart2.Titles[0].Text = "EXPENSE TRACKER";

            // Bind data to the chart
            Chart2.DataSource = dt;
            Chart2.DataBind();

            // Calculate total expense amount and update button text
            due_bal.Text = "-" + dt.Compute("Sum(expense)", string.Empty).ToString();

        }

        public void GetDataForPieChart()
        {
            //details.Sql_Operation = "IncomeChart";
            //details.Society_Id = society_id.Value;
            //var dt = BL_Login.income_chart(details);
            //Chart1.DataSource = dt;
            //Chart1.DataBind();

            //string[] XPointMember = new string[dt.Rows.Count];
            //int[] YPointMember = new int[dt.Rows.Count];

            //for (int count = 0; count < dt.Rows.Count; count++)
            //{
            //    //storing Values for X axis  
            //    XPointMember[count] = dt.Rows[count]["category"].ToString();
            //    //storing values for Y Axis  
            //    YPointMember[count] = Convert.ToInt32(dt.Rows[count]["amount"]);


            //}


            //Chart1.Series[0].Points.DataBindXY(XPointMember, YPointMember);




            ////string cellValue = GridView1.Rows[0].Cells[0].Text; // Row 1, Column 1
            ////lblResult.Text = "Value: " + cellValue;


            ////Chart1.Series[0].ChartType = SeriesChartType.Doughnut;
            //foreach (Series charts in Chart1.Series)
            //{
            //    foreach (DataPoint point in charts.Points)
            //    {
            //        switch (point.AxisLabel)
            //        {
            //            case "due": point.Color = Color.Red; break;
            //            case "collection": point.Color = Color.LightGreen; break;


            //        }
            //        //point.Label = string.Format("{0:0} - {1}", point.YValues[0], point.AxisLabel);
            //        point.ToolTip = $"{point.AxisLabel}: {point.YValues[0]:N2}";
            //        //point.LegendText = $"{point.AxisLabel}: {point.YValues[0]:N2}";


            //    }

            //}
            ////Enabled 3D  
            ////  Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;  

            //due_amt.Text = YPointMember[0].ToString();




            //details.Sql_Operation = "IncomeChart";
            //details.Society_Id = society_id.Value;
            //var dt = BL_Login.income_chart(details);

            //if (dt == null || dt.Rows.Count == 0)
            //{
            //    Chart1.Visible = false; // Hide the chart if no data is available
            //    due_amt.Text = "No Data Available";
            //    return;
            //}

            //Chart1.Visible = true; // Ensure the chart is visible when data is available
            //Chart1.DataSource = dt;
            //Chart1.DataBind();

            //string[] XPointMember = new string[dt.Rows.Count];
            //int[] YPointMember = new int[dt.Rows.Count];

            //for (int count = 0; count < dt.Rows.Count; count++)
            //{
            //    XPointMember[count] = dt.Rows[count]["category"].ToString();
            //    YPointMember[count] = Convert.ToInt32(dt.Rows[count]["amount"]);
            //}

            //Chart1.Series[0].Points.DataBindXY(XPointMember, YPointMember);

            //foreach (Series charts in Chart1.Series)
            //{
            //    foreach (DataPoint point in charts.Points)
            //    {
            //        switch (point.AxisLabel)
            //        {
            //            case "due": point.Color = Color.Red; break;
            //            case "collection": point.Color = Color.LightGreen; break;
            //        }
            //        point.ToolTip = $"{point.AxisLabel}: {point.YValues[0]:N2}";
            //    }
            //}

            //due_amt.Text = YPointMember[0].ToString();


          
                details.Sql_Operation = "IncomeChart";
                details.Society_Id = society_id.Value;
                var dt = BL_Login.income_chart(details);  // Fetch data from DAL

                bool hasData = dt != null && dt.Rows.Count > 0;

                // Show/hide elements based on data availability
                Chart1.Visible = hasData;
                lblDateRange.Visible = hasData;
                Label1.Visible = hasData;
                due_amt.Visible = hasData;
                GridView7.Visible = hasData;
                defaulter.Visible = hasData;

                // If no data, update message
                if (!hasData)
                {
                    due_amt.Text = "No Data Available";
                    return;
                }

                // Bind data to chart
                Chart1.Series[0].Points.Clear();
                string[] XPointMember = new string[dt.Rows.Count];
                int[] YPointMember = new int[dt.Rows.Count];

                for (int count = 0; count < dt.Rows.Count; count++)
                {
                    XPointMember[count] = dt.Rows[count]["category"].ToString();
                    YPointMember[count] = Convert.ToInt32(dt.Rows[count]["amount"]);
                }

                Chart1.Series[0].Points.DataBindXY(XPointMember, YPointMember);

                // Customize colors
                foreach (Series charts in Chart1.Series)
                {
                    foreach (DataPoint point in charts.Points)
                    {
                        switch (point.AxisLabel)
                        {
                            case "due": point.Color = Color.Red; break;
                            case "collection": point.Color = Color.LightGreen; break;
                        }
                        point.ToolTip = $"{point.AxisLabel}: {point.YValues[0]:N2}";
                    }
                }

                due_amt.Text = YPointMember[0].ToString();  // Update balance amount
        }
       




        public void get_ticket()
        {
            details.Sql_Operation = "Get_Ticket";
            details.Society_Id = society_id.Value;
            var dt = BL_Login.getticket(details);

            open.Text ="Open Ticket <br/>"+Convert.ToInt32(dt.Open).ToString();
            resolved.Text ="Resolved Ticket <br/>"+ Convert.ToInt32(dt.Resolve).ToString();
          
        }
        private void BindMonthData()
        {


            details.Sql_Operation = "Get_Month";
            var result = BL_Login.getmonth(details);


            GridView7.DataSource = result;
            GridView7.DataBind();


            if (result.Rows.Count > 0)
            {
                lblDateRange.Text = Convert.ToDateTime(result.Rows[0]["gen_date"]).ToString("yyyy-MM-dd") + " to " + DateTime.Now.ToShortDateString().ToString(); // Row 1, Column 1

            }

        }

        public void pdc_reminder_Gridbind()
        {

            details.Sql_Operation = "Grid_Show";
            details.Society_Id = society_id.Value;
            var dt = BL_Login.Get_Pdc_Clearing(details);
            GridView1.DataSource = dt;
            ViewState["pdc_remainder"] = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                clearing.Visible = false;
            }
            else
            {
                clearing.Visible = true;
            }
        }


        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["pdc_remainder"];
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
   
        public void Event_Gridbind()
        {
            details.Sql_Operation = "Grid_Show";
            details.Society_Id = society_id.Value;
            var dt = BL_Login.getEventDetails(details);
            GridView5.DataSource = dt;
            ViewState["Event"] = dt;
            GridView5.DataBind();
            if (GridView5.Rows.Count == 0)
            {
                events.Visible = false;
            }
            else
            {
                events.Visible = true;
            }
        }
        protected void GridView2_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["Notice"];
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
                GridView2.DataSource = dtrslt;
                GridView2.DataBind();


            }
        }


        protected void Meeting_Gridbind()
        {
            
            details.Sql_Operation = "Grid_Show";
            details.Society_Id = society_id.Value;
            var dt = BL_Login.getmeeting(details);
            GridView6.DataSource = dt;
            ViewState["Meeting"] = dt;
            GridView6.DataBind();
            if(GridView6.Rows.Count==0)
            {
                meeting.Visible = false;
            }
            else
            {
                meeting.Visible = true;
            }
        }

        protected void GridView3_Sorting(object sender, GridViewSortEventArgs e)
    {
            DataTable dtrslt = (DataTable)ViewState["Maintenance"];
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
                GridView3.DataSource = dtrslt;
                GridView3.DataBind();


            }

        }

        public void Notice_Gridbind()
        {
           
            details.Sql_Operation = "Grid_Show";
            //if (notice_id.Value != "")
            //details.NID = Convert.ToInt32(notice_id.Value);
            details.Society_Id = society_id.Value;
            var dt = BL_Login.getnotice(details);
            GridView2.DataSource = dt;
            ViewState["Notice"] = dt;
            GridView2.DataBind();
            if (GridView2.Rows.Count == 0)
            {
                notice.Visible = false;
            }
            else
            {
                notice.Visible = true;
            }
        }

        protected void GridView5_Sorting(object sender, GridViewSortEventArgs e)
        {

            DataTable dtrslt = (DataTable)ViewState["Event"];
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
                GridView5.DataSource = dtrslt;
                GridView5.DataBind();


            }

        }
    
        public void maintenance_Gridbind()
        {
           
            details.Sql_Operation = "Dash_Main";
            details.Society_Id = society_id.Value;
            var dt = BL_Login.getmaintenance(details);
            GridView3.DataSource = dt;
            ViewState["Maintenance"] = dt;
            GridView3.DataBind();
            if (GridView3.Rows.Count == 0)
            {
                maintenance.Visible = false;
            }
            else
            {
                maintenance.Visible = true;
            }
        }

        protected void GridView6_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["Meeting"];
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
                GridView6.DataSource = dtrslt;
                GridView6.DataBind();


            }
        }

        public void Receipt_Gridbind()
        {
           
            details.Sql_Operation = "Grid_Show";
            details.Society_Id = society_id.Value;
            var dt = BL_Login.getreceipt(details);
            GridView4.DataSource = dt;
            ViewState["Receipt"] = dt;
            GridView4.DataBind();
            if (GridView4.Rows.Count == 0)
            {
                receipt.Visible = false;
            }
            else
            {
                receipt.Visible = true;
            }
        }

        protected void defaulter_Click(object sender, EventArgs e)
        {
            Response.Redirect("Defaulter.aspx");
          
        }

        protected void GridView4_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["Receipt"];
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
                GridView4.DataSource = dtrslt;
                GridView4.DataBind();


            }
        }
        protected void btn_mom_Click(object sender, EventArgs e)
        {
            //runproc("Update");
            //gridshow();

            // Response.Redirect("meeting_search.aspx");


            Response.Redirect("meeting_search.aspx");

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);



        }

        protected void due_amt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Defaulter.aspx");
        }

        protected void due_bal_Click(object sender, EventArgs e)
        {
            Response.Redirect("society_expense.aspx");
        }

        protected void fin_statement_Click(object sender, EventArgs e)
        {
            Response.Redirect("ledger_form.aspx");
        }
    }
}





