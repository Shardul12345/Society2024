﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="building_search.aspx.cs" Inherits="Society.building_search" MasterPageFile="~/Site.Master" %>

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
            debugger;
            $('#edit_model').modal('show');
        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }

    </script>




    <div class="box box-primary">
        <div class="box-header with-border">
            <%--<div class="box-title" style="font-size:xx-large;">
                <div class=text-center>Search Building</div>

            </div>
        </div>--%>
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Search Building</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="build_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="server" />
                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                           <div class="d-flex align-items-center">

                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="name">Building Name</asp:ListItem>
                                <asp:ListItem Value="no_of_floore">Floor</asp:ListItem>

                            </asp:DropDownList>&nbsp;&nbsp;
                       
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Width="200px" Height="32px" Font-Bold="true" placeHolder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                       
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" CausesValidation="False" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>
                        </div>
                    </div>
                </div>
            

                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                              <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="build_id" ItemStyle-Width="100" SortExpression="name" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="build_id" runat="server" Text='<%# Bind("build_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Building Name" ItemStyle-Width="200" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Print Name" ItemStyle-Width="200" SortExpression="print_name">
                                            <ItemTemplate>
                                                <asp:Label ID="address1" runat="server" Text='<%# Bind("print_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Floor" ItemStyle-Width="100" SortExpression="no_of_floore">
                                            <ItemTemplate>
                                                <asp:Label ID="c_address" runat="server" Text='<%# Bind("no_of_floore")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address" ItemStyle-Width="200" SortExpression="address1">
                                            <ItemTemplate>
                                                <asp:Label ID="mobile_no" runat="server" Text='<%# Eval("address1") +" " + Eval("address2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">                                          
                                            <ItemTemplate>
  
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("build_id")%>'><img src="Images/123.png" /></asp:LinkButton>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
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
                    <div class="modal-dialog modal-sm" style="right: 80px">
                        <div class="modal-content" style="height: auto; width: 540px;">
                            <div class="modal-header">
                                <%--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Building</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">
                                <form id="owner-socity-add" action="" method="post">

                                    <div class="form-group">
                                        <div class="alert alert-danger danger" style="display: none;"></div>
                                    </div>
                                    <asp:UpdatePanel ID="upnlCountry" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="lbl_co_name" runat="server" Text="Building No/Name :"></asp:Label>

                                                            <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_name" runat="server" Height="32px" Width="200px" placeholder="Enter Name/No" Style="text-transform: capitalize;" required autofocus></asp:TextBox>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label1" runat="server" Text="Print Name"></asp:Label>
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_print_name" runat="server" Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter Building Name" required autofocus></asp:TextBox>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label4" runat="server" Text="Registration No"></asp:Label>
                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_reg" runat="server" Height="32px" Width="200px" placeholder="Enter Registration No" AutoPostBack="true" required autofocus OnTextChanged="txt_reg_TextChanged" ValidationGroup="g1"></asp:TextBox>
                                                            <asp:Label ID="Label13" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label>
                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_add1" runat="server" Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter Address" required autofocus></asp:TextBox>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_add2" runat="server" Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter Address" required autofocus></asp:TextBox>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label10" runat="server" Text="No of Floors"></asp:Label>
                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_floore" runat="server" Height="32px" Width="200px" placeholder="Enter No. of Floors" onkeypress="return digit(event);" required autofocus></asp:TextBox>
                                                        </div>

                                                    </div>
                                                </div>
                                                <hr />
                                                <h4>Bank Details</h4>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label14" runat="server" Text="Bank Name"></asp:Label>
                                                            <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_bank" runat="server" Height="32px" Width="200px" placeholder="Enter Bank name" required autofocus></asp:TextBox>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label25" runat="server" Text="Bank Address"></asp:Label>
                                                            <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_bank_add" runat="server" Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter Full Address" required autofocus></asp:TextBox>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label17" runat="server" Text="Branch"></asp:Label>
                                                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_branch" runat="server" Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter Branch" required autofocus></asp:TextBox>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label18" runat="server" Text="IFSC Code"></asp:Label>
                                                            <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_ifsc" runat="server" Height="32px" Width="200px" MaxLength="11" placeholder="Enter IFSC Code" required autofocus></asp:TextBox>
                                                            <br>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Height="32px" Width="200px" runat="server" ValidationExpression="^[A-Z]{4}0[A-Z0-9]{6}$"
                                                                ControlToValidate="txt_ifsc" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid IFSC Format" ValidationGroup="g1" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label21" runat="server" Text="Account No"></asp:Label>
                                                            <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_acc_no" runat="server" Height="32px" Width="200px" placeholder="Enter Account No" required autofocus MaxLength="18"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Height="32px" Width="200px" runat="server" ValidationExpression="^\d{9,18}$"
                                                                ControlToValidate="txt_acc_no" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid Account No Format" ValidationGroup="g1" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-4">
                                                            <asp:Label ID="Label28" runat="server" Text="Email ID"></asp:Label>
                                                            <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <asp:TextBox ID="txt_email" runat="server" Height="32px" Width="200px" placeholder="Enter Email" required autofocus></asp:TextBox>
                                                            <br>
                                                            <asp:RegularExpressionValidator ID="regexEmailValid" Height="32px" Width="200px" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid Email Format" ValidationGroup="g1" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        </div>

                                                    </div>
                                                </div>
                                                </form>  
                                            
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                            </div>





                            <hr />

                            <div class="modal-footer">
                                <div class="form-group">
                                    <div class="row ">

                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" OnClientClick="return confirm('Are you sure want to delete?');" Visible="false" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="False" />
                                        </center>

                                    </div>
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
    <%-- <br />  <br />  <br /> <br />  <br />  <br />  <br />  <br />  <br />--%>
</asp:Content>
