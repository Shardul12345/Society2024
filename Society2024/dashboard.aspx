<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Society.dashboard" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="True" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<style>
.expense-heading {
    font-family: 'Microsoft Sans Serif', sans-serif;
    font-size: 18pt;
    color: black; /* Change if needed */
    text-align: Center;
    margin-left: 10px; /* Adjust spacing */
}

</style>
    <style>
        .income-heading {
    font-family: 'Microsoft Sans Serif', sans-serif;
    font-size: 18pt;
    color: black; /* Change if needed */
    text-align: Center;
    margin-left: 10px; /* Adjust spacing */
}
    </style>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">


                <div class="form-group">
                    <div class="row">


                        <div class="col-md-6 text-center">

                            <div class="container" style="background: white; border-radius: 8px; box-shadow: 0 4px 20px 0 rgb(128 128 128);">

                                <header style="font-size: x-large; color: #000000; font-family: 'Microsoft Sans Serif';">
                                    HELPDESK TICKETS
                                </header>


                                <div class="form-group">

                                    <div class="col-sm-9">
                                        <asp:Label ID="Label3" runat="server" Text="Open Requests" ForeColor="Black"></asp:Label>
                                    </div>
                                    <br />
                                    <div class="row ">
                                        <div class="col-sm-6">
                                            <asp:Label ID="open" runat="server" Text="Open" ForeColor="Black"></asp:Label>

                                        </div>
                                        <div class="col-sm-6">
                                            <asp:Label ID="resolved" runat="server" Text="Resolved" ForeColor="Black"></asp:Label>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="col-sm-12">
                                        <asp:Button ID="lodge_req_btn" runat="server" Text="Lodge New Request" BackColor="LightSkyBlue" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-6 text-center">
                            <div class="container" style="background: white; border-radius: 8px; box-shadow: 0 4px 20px 0 rgb(128 128 128);">

                                <header style="font-size: x-large; color: #000000; font-family: 'Microsoft Sans Serif';">
                                    GENERAL LEDGER
                                </header>


                                <div class="row justify-content-center">
                                    <div class="col-auto">
                                        <asp:Button ID="fin_statement" runat="server" Text="Financial Statements"
                                            CssClass="btn btn-primary mx-2"  OnClick="fin_statement_Click" BackColor="LightSkyBlue" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>







                <div class="form-group">
                    <div class="row ">

                        <div class="col-md-6 text-center">
                             <asp:Panel ID="pnlIncomeTracker" runat="server" Visible="true">
                            <div class="container" style="background: white; height: 700px; border-radius: 8px; box-shadow: 0 4px 20px 0 rgb(128 128 128);">

                                 <h2 id="income_tracker" runat="server" class="income-heading">INCOME TRACKER</h2>
                                <asp:Chart ID="Chart1" runat="server"
                                    BorderlineWidth="0" Palette="None"
                                    Width="380px" BorderlineColor="64, 0, 64">
                                   <%-- <Titles>
                                        <asp:Title Name="Items" Text="INCOME TRACKER" Alignment="TopLeft" Font="Microsoft Sans Serif, 18pt" />
                                    </Titles>--%>
                                    <Legends>
                                        <asp:Legend Alignment="Near" Docking="Right" IsTextAutoFit="True" Name="Default"
                                            LegendStyle="Column" />
                                    </Legends>
                                    <Series>
                                        <asp:Series Name="Default" ChartType="Doughnut" />
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" BorderWidth="0" Area3DStyle-Enable3D="False" />

                                    </ChartAreas>
                                </asp:Chart>

                                <div class="col-sm-10">
                                    <asp:Label ID="lblDateRange" runat="server" ForeColor="Black" /><br />
                                    <asp:Label ID="Label1" runat="server" Text="Balance Amount" /><br />
                                    <asp:Button ID="due_amt" runat="server" Text="0.00" OnClick="due_amt_Click" CssClass="btn" ForeColor="#FF3300" Font-Size="X-Large" Font-Bold="True"/><br />
                                </div>



                                <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="false" CssClass="table-borderless" ShowHeader="false">

                                    <Columns>

                                        <asp:TemplateField HeaderText="Value" ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="month_name" runat="server" Text='<%# Bind("month_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Value" ItemStyle-Width="700px" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="amount" runat="server" Text='<%# "₹" +Eval("amount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <br />
                                <div class="col-sm-12">
                                    <asp:Button ID="defaulter" runat="server" Text="Defaulters" BackColor="LightSkyBlue" Width="475px" OnClick="defaulter_Click" />
                                </div>
                            </div>
                            </asp:Panel>

                            <asp:Label ID="lblResult" runat="server" ForeColor="Blue"></asp:Label>


                        </div>



                        <div class="col-md-6 text-center">
                            <div class="container" style="background: white; height : 700px;  border-radius: 8px; box-shadow: 0 4px 20px 0 rgb(128 128 128);">

                               <h2 id="expenseTitle" runat="server" class="expense-heading">EXPENSE TRACKER</h2>

                                <asp:Chart ID="Chart2" runat="server" Width="490px" Height="500px">
                                   <%-- <Titles>
                                        <asp:Title Name="Items" Text="EXPENSE TRACKER" Alignment="TopLeft" Font="Microsoft Sans Serif, 18pt" />
                                    </Titles>--%>

                                    <Series>
                                        <asp:Series Name="Month" XValueMember="expense_month" YValueMembers="expense"
                                            IsVisibleInLegend="true"
                                            IsValueShownAsLabel="true"
                                            YValuesPerPoint="2"
                                            ToolTip="#VALX: #VALY">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="True" AlignmentStyle="PlotPosition">
                                            <AxisX LineColor="Gray">
                                                <MajorGrid LineColor="Gray" />
                                            </AxisX>
                                            <AxisY LineColor="Gray">
                                                <MajorGrid LineColor="Gray" />
                                            </AxisY>
                                            <Area3DStyle Enable3D="false" LightStyle="Realistic"></Area3DStyle>
                                        </asp:ChartArea>
                                    </ChartAreas>

                                    <Legends>
                                        <asp:Legend>
                                        </asp:Legend>
                                    </Legends>
                                </asp:Chart>
                                <div class="col-sm-10">
                                    <asp:Label ID="Label35" runat="server" Text="Balance Amount" /><br />
                                    <asp:Button ID="due_bal" OnClick="due_bal_Click" runat="server" CssClass="btn" Text="balance" ForeColor="Black" Font-Size="X-Large" Font-Bold="True" />

                                </div>
                            </div>
                            <br />
                        </div>



                    </div>
                </div>
            </div>
        </div>

    </div>



     <asp:Panel ID="clearing" runat="server">
    <table width="100%">
        <tr>
            <th width="100%">
                <h1 class="bg-primary text-white">
                    <center>Search PDC Clearing</center>
                </h1>
            </th>
        </tr>

    </table>
         </asp:Panel>

    <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
    <asp:HiddenField ID="society_id" runat="server" />
    <asp:HiddenField ID="notice_id" runat="server" />
    <asp:HiddenField ID="HiddenField4" runat="server" />

   
    
    <div class="form-group">
        <div class="row ">
            <div class="col-sm-12">
                <div style="width: 100%; overflow: auto; height: 263px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table_dark" HeaderStyle-BackColor="lightblue" AllowSorting="true" OnSorting="GridView1_Sorting">

                        <Columns>
                            <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Building Name" ItemStyle-Width="100" SortExpression="name">
                                <ItemTemplate>
                                    <asp:Label ID="b_id" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Wing Name" ItemStyle-Width="100" SortExpression="w_name">
                                <ItemTemplate>
                                    <asp:Label ID="w_id" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Pdc Remainder" ItemStyle-Width="100" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="pdc_rem_id" runat="server" Text='<%# Bind("pdc_rem_id")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Owner Name" ItemStyle-Width="100" SortExpression="o_name">
                                <ItemTemplate>
                                    <asp:Label ID="o_name" runat="server" Text='<%# Bind("o_name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cheque No" ItemStyle-Width="100" SortExpression="chqno">
                                <ItemTemplate>
                                    <asp:Label ID="chqno" runat="server" Text='<%# Bind("chqno")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Amount" ItemStyle-Width="100" SortExpression="che_amount">
                                <ItemTemplate>
                                    <asp:Label ID="che_amount" runat="server" Text='<%# Bind("che_amount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cheque Date" ItemStyle-Width="100" SortExpression="che_date">
                                <ItemTemplate>
                                    <asp:Label ID="che_date" runat="server" Text='<%# Bind("che_date", "{0:yyyy-MM-dd}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--     <asp:CommandField ShowDeleteButton="false" ControlStyle-ForeColor="blue" />--%>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
        

   
    <div class="box box-primary">
        <div class="box-header with-border">
            <h2 class="box-title"></h2>
        </div>
        <div class="box-body">

             <asp:Panel ID="events" runat="server">
            <table width="100%">
                <tr>
                    <th width="100%">
                        <h1 class="bg-primary text-white">
                            <center>Search Events</center>
                        </h1>
                    </th>
                </tr>
            </table>
                 </asp:Panel>


            <div class="form-group">
                <div class="row">
                    <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView5_Sorting">

                                <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_id" ItemStyle-Width="200" SortExpression="event_id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="event_id" runat="server" Text='<%# Bind("event_id")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText=" Event Name" ItemStyle-Width="200" SortExpression="event_name">
                                        <ItemTemplate>
                                            <asp:Label ID="event_name" runat="server" Text='<%# Bind("event_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From date" ItemStyle-Width="100" SortExpression="from_date">
                                        <ItemTemplate>
                                            <asp:Label ID="from_date" runat="server" Text='<%# Bind("from_date","{0:dd-MM-yyyy}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To Date" ItemStyle-Width="200" SortExpression="to_date">
                                        <ItemTemplate>
                                            <asp:Label ID="to_date" runat="server" Text='<%# Bind("to_date","{0:dd-MM-yyyy}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="box box-primary">
        <div class="box-header with-border">
            <h2 class="box-title"></h2>
        </div>
        <div class="box-body">
             <asp:Panel ID="meeting" runat="server">
            <table width="100%">
                <tr>
                    <th width="100%">
                        <h1 class="bg-primary text-white">
                            <center>Search Meetings</center>
                        </h1>
                    </th>
                </tr>
            </table>
               </asp:Panel>

            <div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
                            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView6_Sorting">

                                <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="meet_id" ItemStyle-Width="200" SortExpression="meet_id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="meet_id" runat="server" Text='<%# Bind("meet_id")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject" ItemStyle-Width="200" SortExpression="subject">
                                        <ItemTemplate>
                                            <asp:Label ID="subject" runat="server" Text='<%# Bind("subject")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="100" SortExpression="meeting_date">
                                        <ItemTemplate>
                                            <asp:Label ID="meeting_date" runat="server" Text='<%# Bind("meeting_date","{0:dd-MM-yyyy}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Meeting Time" ItemStyle-Width="200" SortExpression="meeting_time">
                                        <ItemTemplate>
                                            <asp:Label ID="meeting_time" runat="server" Text='<%# Bind("meeting_time","{0:hh:mm}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>

            <%--             <div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                        <div class="pull-center">
                            <asp:Button ID="btn_mom" runat="server" Height="32px" Width="150px" Text="Add MOM"  OnClick="btn_mom_Click" />
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>




    <div class="box box-info">
        <div class="box-body">
            <div class="col-sm-12">
                <h2 class="box-title"></h2>
            </div>
            <div class="box-body">


                 <asp:Panel ID="notice" runat="server">
                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Search Notice</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                     </asp:Panel>

                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="lightblue" AllowSorting="true" OnSorting="GridView2_Sorting">
                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="notice_id" ItemStyle-Width="300" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="notice_id" runat="server" Text='<%# Bind("notice_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject" ItemStyle-Width="200" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description" Visible="true" SortExpression="description" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="description" Text='<%# Bind("description")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date" ItemStyle-Width="100" SortExpression="date">
                                            <ItemTemplate>
                                                <asp:Label ID="date" runat="server" Text='<%# Bind("date","{0:dd-MM-yyyy}")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <%--                                    <asp:LinkButton  ButtonType="Button" data-toggle="modal" data-target=".bs-example-modal-sm" SelectText="Edit" ControlStyle-ForeColor="blue" />--%>
                                    </Columns>
                                </asp:GridView>
                                <%-- 
                                <div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                       
                            <asp:Button ID="btn_mom" runat="server" Height="32px" Width="150px" Text="Add MOM" required class="btn btn-primary" OnClick="btn_mom_Click" />--%>

                                <%-- </div>
                </div>
            </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="box box-info">
        <div class="box-body">
            <div class="col-sm-12">
                <h2 class="box-title"></h2>
            </div>
            <div class="box-body">

                 <asp:Panel ID="maintenance" runat="server">
                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Search Maintenance</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                     </asp:Panel>

                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">


                                <%--<asp:GridView ID="GridView1" Width="100%" runat="server" SkinID="gvSkin" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" OnRowUpdating="GridView1_RowUpdating" AllowPaging="false" OnRowDeleting="GridView1_RowDeleting">--%>
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="lightblue" AllowSorting="true" OnSorting="GridView3_Sorting">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="id" runat="server" Text='<%# Bind("n_m_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Year" SortExpression="year">
                                            <ItemTemplate>
                                                <asp:Label ID="Year" runat="server" Text='<%# Bind("year")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Month" SortExpression="month_name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="month" runat="server" Text='<%#Bind("month_name")%>' NavigateUrl='<%# "printreport.aspx?n_m_id=" + Eval("n_m_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Building" SortExpression="build_name">
                                            <ItemTemplate>
                                                <asp:Label ID="build_name" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Flat No" SortExpression="flat_no">
                                            <ItemTemplate>
                                                <asp:Label ID="flat_no" runat="server" Text='<%# Bind("flat_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>






    <div class="box box-primary">
        <%--div class="box-header with-border">
              <h2 class="box-title"></h2>
            </div>--%>
        <div class="box-body">

             <asp:Panel ID="receipt" runat="server">
            <table width="100%">
                <tr>
                    <th width="100%">
                        <h1 class="bg-primary text-white">
                            <center>Search Receipt</center>
                        </h1>
                    </th>
                </tr>
            </table>
                 </asp:Panel>


            <div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" OnSorting="GridView4_Sorting" HeaderStyle-BackColor="lightblue">

                                <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Receipt" ItemStyle-Width="200" SortExpression="receipt_no">
                                        <ItemTemplate>
                                            <asp:Label ID="receipt_no" runat="server" Text='<%# Bind("receipt_no")%>'></asp:Label>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Building Name" ItemStyle-Width="200" SortExpression="build_name">
                                        <ItemTemplate>
                                            <asp:Label ID="b_id" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--                        <asp:LinkButton  ButtonType="Button" data-toggle="modal" data-target=".bs-example-modal-sm" SelectText="Edit" ControlStyle-ForeColor="blue" />--%>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


