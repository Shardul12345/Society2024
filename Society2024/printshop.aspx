﻿<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="printshop.aspx.cs" Inherits="Society.printshop" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding:15px">
        <asp:HiddenField ID="society_id" runat="server" />
<div align="center" style="font-size: 30px;">Shop MaintananceReport</div>
          <div class="form-group">
                        <div class="row ">
                         
                             <div class="col-sm-2">
                                <asp:Label ID="Label8" runat="server" Text="Payment Method"></asp:Label>
                              
                            </div>
                            <div class="col-sm-4">
                           <asp:DropDownList ID="ddl_method" Width="200px" Height="32px" runat="server"  AutoPostBack="true" >
                            
                                </asp:DropDownList>

                            </div>
                              <div class="col-sm-2">
                                <asp:Label ID="Label2" runat="server" Text=" Maintenance Date:"></asp:Label>
                                 
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_date"  Width="200px" Height="32px" TextMode="Date" runat="server"></asp:TextBox>
                          
                            </div>

                        </div>
                    </div>
         
<div align="center">
<asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click"
   class="btn btn-primary" Font-Bold="True" />
<br />
 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px"></rsweb:ReportViewer>
</div>
</div>
   
</asp:Content>