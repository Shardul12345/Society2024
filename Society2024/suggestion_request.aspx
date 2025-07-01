﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="suggestion_request.aspx.cs" Inherits="Society._thought" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:HiddenField ID="th_id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="sug_id" runat="Server"></asp:HiddenField>

    <script type='text/javascript'>
        function openModal() {
            $('#edit_model').modal('show');
        }
    </script>

    <div class="box box-primary">
        <div class="box-header with-border">

            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Suggestions/Requests</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>


                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <div class="form-group">
                    <div class="row ">
                       <div class="col-12">
                         <div class="d-flex align-items-center">

                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="details">Details</asp:ListItem>
                                <asp:ListItem Value="subject">Subject</asp:ListItem>
                            </asp:DropDownList> &nbsp;&nbsp;
                        
                             <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search Here" runat="server"></asp:TextBox> &nbsp;&nbsp;
                       
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /> </asp:Panel>&nbsp;&nbsp; 
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>

                           </div>
                       </div>
                    </div>
               


                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true"
                                    EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="th_id" SortExpression="th_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="sug_id" runat="server" Text='<%# Bind("sug_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject" SortExpression="subject">
                                            <ItemTemplate>
                                                <asp:Label ID="subject" runat="server" Text='<%# Bind("subject")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Details" SortExpression="details">
                                            <ItemTemplate>
                                                <asp:Label ID="details" runat="server" Text='<%# Bind("details")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("sug_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit551" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <%--                                    <asp:LinkButton  ButtonType="Button" data-toggle="modal" data-target=".bs-example-modal-sm" SelectText="Edit" ControlStyle-ForeColor="blue" />--%>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade bs-example-modal-sm" tabindex="-1" id="edit_model" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-1">
                        <div class="modal-content" style="height: auto; width: 600px;">
                            <div class="modal-header">
                                <%--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Suggestion/Request</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">
                                <form id="owner-socity-add" action="" method="post">

                                    <div class="form-group">
                                        <div class="alert alert-danger danger" style="display: none;"></div>
                                    </div>


                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-5">
                                                <asp:Label ID="Label1" runat="server" Text="Subject:"></asp:Label>

                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="txt_sub" runat="server" Height="35px" Width="250px" placeholder="Enter Subject" required autofocus ></asp:TextBox>

                                            </div>
                                        </div>
                                        <br />
                                        <div class="row ">
                                            <div class="col-sm-5">
                                                <asp:Label ID="lbl_co_name" runat="server" Text="Suggestions/Requests:"></asp:Label>

                                                <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="txt_details" runat="server" Height="35px" Width="250px" placeholder="Enter Suggestion/Request" required autofocus TextMode="MultiLine"></asp:TextBox>

                                            </div>
                                        </div>
                                         
                                    </div>



                                </form>



                                <div class="form-group">
                                    <div class="row ">
                                        <div class="pull-right">
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" OnClientClick="return confirm('Are you sure you want to log out?');" OnClick="btn_delete_Click" Visible="false" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="false" />
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <!-- /.modal-body -->
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                    <br />
                    <br />
                    <br />
                    <br />
                </div>

               </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
