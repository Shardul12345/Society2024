﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="park_place_search.aspx.cs" Inherits="Society.park_place_search" MasterPageFile="~/Site.Master" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function SuccessEntry() {
            Swal.fire(
                'SUCCESS!',
                'Quotation Entry Successfully Registered!',
                'success'
            )
        }
        function Fail() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'You Missed Something Empty!',
            })
        }

    </script>

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
                                <center>Search Park Place</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="meet_id" runat="server" />
                <asp:HiddenField ID="place_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="status" runat="Server"></asp:HiddenField>

                <div class="form-group">
                   <div class="row ">
                         <div class="col-12">
                            <div class="d-flex align-items-center">

                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="park_for">Park For</asp:ListItem>
                                <asp:ListItem Value="parking_no">Parking No</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp;
                       
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Font-Bold="true" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                       
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
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="place_id" SortExpression="place_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="place_id" runat="server" Text='<%# Bind("place_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Park For" SortExpression="park_for">
                                            <ItemTemplate>
                                                <asp:Label ID="park_for" runat="server" Text='<%# Bind("park_for")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Parking No" SortExpression="parking_no">
                                            <ItemTemplate>
                                                <asp:Label ID="parking_no" runat="server" Text='<%# Bind("parking_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="50" HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("place_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="50" HeaderText="Delete">
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

                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: 500px">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Park Place</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">
                                <form id="owner-socity-add" action="" method="post">

                                    <div class="form-group">
                                        <div class="alert alert-danger danger" style="display: none;"></div>
                                    </div>
                                    <asp:UpdatePanel ID="upnlCountry" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="lbl_co_name" runat="server" Text="Parking Number"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_number" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" placeholder="Enter No" required autofocus></asp:TextBox>
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="Label1" runat="server" Text="Parking For :"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddl_park_for" Height="32px" Width="200px" runat="server" parsley-trigger="change" AutoPostBack="true" OnSelectedIndexChanged="ddl_park_for_SelectedIndexChanged" required>
                                                            <asp:ListItem Value="select">Select</asp:ListItem>
                                                            <asp:ListItem Value="1">2 Wheeler</asp:ListItem>
                                                            <asp:ListItem Value="2">3 Wheeler</asp:ListItem>
                                                            <asp:ListItem Value="3">4 Wheeler</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:CompareValidator ControlToValidate="ddl_park_for" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select parking vehical" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                        <%--<asp:CompareValidator ID="re1" runat="Server" ValueToCompare="0"  ControlToValidate="ddl_park_for" ErrorMessage="Please" Operator="Equal" />--%>
                                                    </div>

                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </form>
                            </div>
                            <div class="modal-footer">


                                <div class="form-group">
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" Visible="false" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="False" />
                                        </center>
                                    </div>
                                </div>


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
</asp:Content>
