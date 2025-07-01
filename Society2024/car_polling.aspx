﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="car_polling.aspx.cs" Inherits="Society.car_polling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type='text/javascript'>
        function openModal() {
            $('#edit_model').modal('show');
        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }
    </script>


    <asp:HiddenField ID="car_id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">


                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Car Pollings</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>

                <asp:HiddenField ID="HiddenField4" runat="server" />
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <div class="form-group">
                    <div class="row ">
                       <div class="col-12">
                         <div class="d-flex align-items-center">
                            <asp:DropDownList ID="search_field" runat="server" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true" Width="200px" Height="32px">
                                <asp:ListItem Value="c_name">Name</asp:ListItem>
                                <asp:ListItem Value="vehical_no">Vehical No</asp:ListItem>
                                <asp:ListItem Value="destination">Destination</asp:ListItem>
                                <asp:ListItem Value="date">Date</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp;
                       
                             <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">

                            <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" runat="server" placeholder="Search Here"></asp:TextBox>&nbsp;&nbsp;
                       
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                       
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>
                        </div>
                    </div>
                </div>
            </div>


                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="car_id" ItemStyle-Width="100" SortExpression="car_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="car_id" runat="server" Text='<%# Bind("car_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name" SortExpression="c_name">
                                            <ItemTemplate>
                                                <asp:Label ID="c_name" runat="server" Text='<%# Bind("c_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Vehicle No" SortExpression="vehical_no">
                                            <ItemTemplate>
                                                <asp:Label ID="vehical_no" runat="server" Text='<%# Bind("vehical_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Destination" SortExpression="destination">
                                            <ItemTemplate>
                                                <asp:Label ID="destination" runat="server" Text='<%# Bind("destination")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Date" SortExpression="date">
                                            <ItemTemplate>
                                                <asp:Label ID="addr" runat="server" Text='<%# Bind("date", "{0:yyyy-MM-dd}")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("car_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
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
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: 520px">
                            <div class="modal-header">
                                <%--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Car Polling</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">
                                <form id="owner-socity-add" action="" method="post">

                                    <div class="form-group">
                                        <div class="alert alert-danger danger" style="display: none;"></div>
                                    </div>



                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-3">
                                                <asp:Label ID="lbl_name" runat="server" Text="Customer Name"></asp:Label>
                                                <asp:Label ID="lbl_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="lbl_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_c_name" runat="server" Width="200px" Height="32px" Style="text-transform: capitalize;" placeholder="Enter Name" required></asp:TextBox>

                                            </div>


                                        </div>
                                    </div>
                                    <asp:UpdatePanel ID="upnlCountry" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label11" runat="server" Text="Vehical No"></asp:Label>
                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_vehical_no" Width="200px" Height="32px" runat="server" placeholder="Enter Vehical No" Style="text-transform: uppercase;" required autofous OnTextChanged="txt_vehical_no_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                        <br />
                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </div>
                                                </div>


                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="form-group">
                                        <div class="row ">

                                            <div class="col-sm-3">
                                                <asp:Label ID="lbl_pre_addr1" runat="server" Text="Seat"></asp:Label>
                                                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_seat" runat="server" Width="200px" Height="32px" required placeholder="Enter seat"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label7" runat="server" Text="Time"></asp:Label>
                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_time" runat="server" TextMode="Time" Width="200px" Height="32px" placeholder="Enter Time" required></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
                                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_date" runat="server" TextMode="Date" Width="200px" Height="32px" placeholder="Enter Date" required></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-3">
                                                <asp:Label ID="lbl_pre_mob" runat="server" Text="Destination"></asp:Label>
                                                <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_destination" runat="server" Width="200px" Height="32px" Style="text-transform: capitalize;" placeholder="Enter Destination" required></asp:TextBox>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label1" runat="server" Text="Charges(Per Head)"></asp:Label>
                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_charges" runat="server" Width="200px" Height="32px" onkeypress="return digit(event);" placeholder="Enter Charges" required></asp:TextBox>


                                            </div>
                                        </div>
                                    </div>



                                </form>


                                <br />
                                <br />

                                <div class="form-group">
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" OnClientClick="return confirm('Are you sure want to delete?');" Visible="false" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="false" />
                                        </center>
                                    </div>
                                </div>
                                <br />
                            </div>

                        </div>
                        <!-- /.modal-body -->
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>
