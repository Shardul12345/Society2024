<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="printreport.aspx.cs" Inherits="Society.printreport" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <asp:HiddenField ID="society_id" runat="server" />
         <asp:HiddenField ID="n_m_id" runat="server" />
    <div style="padding:15px">
<div align="center" style="font-size: 30px;">Maintanance Bill Report</div>
<div align="center">

<br />
<br />
 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px"></rsweb:ReportViewer>
</div>
</div>
   
</asp:Content>