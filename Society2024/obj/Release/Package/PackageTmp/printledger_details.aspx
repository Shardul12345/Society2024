<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="printledger_details.aspx.cs" Inherits="Society.printledger_details" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding:15px">
        <asp:HiddenField ID="society_id" runat="server" />
<div align="center" style="font-size: 30px;">Ledger Details Report</div> 
         <br />
<div align="center">
<asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Load Report" OnClick="Button1_Click"
    Font-Bold="True" />
<br />
 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px"></rsweb:ReportViewer>
</div>
</div>
   
</asp:Content>