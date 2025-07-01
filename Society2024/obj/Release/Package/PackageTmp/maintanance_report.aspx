<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="maintanance_report.aspx.cs" Inherits="Society.maintanance_report" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <asp:HiddenField ID="society_id" runat="server" />
         <asp:HiddenField ID="receipt_id" runat="server" />
    <div style="padding:15px"/>
<div align="center" style="font-size: 30px;">User Info Report</div>
<div align="center">
<asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click"
    BackColor="Yellow" Font-Bold="True" />
<br />
<br />
 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px"></rsweb:ReportViewer>
</div>

</asp:Content>