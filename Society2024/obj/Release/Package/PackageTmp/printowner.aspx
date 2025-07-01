<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="printowner.aspx.cs" Inherits="Society.printowner" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding:15px">
         <asp:HiddenField ID="society_id" runat="server" />
<div align="center" style="font-size: 30px;">Owner Report</div>
         <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_acc_no" runat="server" Text="Building Name :"></asp:Label>
                                       
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddl_build" Height="32px" Width="200px" runat="server" OnSelectedIndexChanged="ddl_build_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </div>

                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_date" runat="server" Text="Wing :"></asp:Label>
                                       
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddl_wing" Height="32px" Width="200px" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
<div align="center">
<asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click"
    class="btn btn-primary" Font-Bold="True" />
<br />
<br />
 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px"></rsweb:ReportViewer>
</div>
</div>
   
</asp:Content>