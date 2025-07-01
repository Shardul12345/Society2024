﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="society_expense.aspx.cs" Inherits="Society.society_expense" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="expense_id" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="approvar_id" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="mem_id" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
    <script>
        function openModal() {
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
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Search Society Expense</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />


                <div class="form-group">
                    <div class="row ">
                     <div class="col-12">
                        <div class="d-flex align-items-center">

                            <asp:DropDownList ID="search_field" runat="server" AutoPostBack="true" Width="200px" Height="32px">
                                <asp:ListItem Value="ex_name">Vendor Name</asp:ListItem>
                                <%-- <asp:ListItem Value="invoice_no">Invoice No</asp:ListItem>--%>
                                <asp:ListItem Value="amount">Amount</asp:ListItem>

                            </asp:DropDownList>&nbsp;&nbsp;

                     
                             <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                      
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                     
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">New Entry</button>&nbsp;&nbsp;
                                                       
                           
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Regular Expense" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" Width="200px" />

                             </div> 
                          </div>
                       </div>
                    </div>

                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">

                        <Columns>
                            <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="expense_id" SortExpression="expense_id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="expense_id" Text='<%# Bind("expense_id")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Vendor Name" SortExpression="ex_name">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="v_name" Text='<%# Bind("ex_name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expense Details" SortExpression="ex_details">
                                <ItemTemplate>
                                    <asp:Label ID="ex_details" runat="server" Text='<%# Bind("ex_details")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Building Name" SortExpression="build_name">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="b_id" Text='<%# Bind("build_name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" SortExpression="date" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="date" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyy}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount" SortExpression="amount">
                                <ItemTemplate>
                                    <asp:Label ID="amount" runat="server" Text='<%# Bind("amount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Final Amount" SortExpression="f_amount">
                                <ItemTemplate>
                                    <asp:Label ID="f_amount" runat="server" Text='<%# Bind("f_amount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="expense_status">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="invoice" Text='<%# Bind("expense_status")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="Edit" ItemStyle-Width="50">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("expense_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="edit551" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                      </div>
                        </div>
                    </div>
                </div>

                    <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                        <div class="modal-dialog modal-sm-4" style="right: 80px">
                            <div class="modal-content" style="height: auto; width: 950px;">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="gridSystemModalLabel"><strong>Society Expense</strong></h4>
                                </div>
                                <div class="modal-body" id="invoice_data">
                                    <asp:Panel ID="expense_panel" runat="server">

                                    <asp:UpdatePanel runat="server"  UpdateMode="Conditional">
                                        <ContentTemplate>


                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_name" runat="server" Text="Invoice No"></asp:Label>
                                                        <asp:Label ID="lbl_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_no" runat="server" Height="32px" Width="200px" placeholder="Enter Invoice No" required> </asp:TextBox>
                                                        <br />

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_date" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_pre_mob" runat="server" Text="Expense Types"></asp:Label>
                                                        <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:RadioButton ID="vendor" runat="server" Text="Vendor" GroupName="g1" Font-Bold="true" AutoPostBack="true" OnCheckedChanged="vendor_CheckedChanged" />
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <asp:RadioButton ID="cash" runat="server" Text="Cash" AutoPostBack="true" GroupName="g1" Font-Bold="true" OnCheckedChanged="cash_CheckedChanged" />
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label4" runat="server" Text="Vendor Name "></asp:Label>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_name" runat="server" Height="32px" Width="200px" placeholder="Enter Name" required></asp:TextBox>
                                                        <asp:DropDownList ID="ddl_vendor" Height="32px" Width="200px" runat="server" parsely-trigger="change" Visible="false"></asp:DropDownList>
                                                        <br />
                                                        <asp:CompareValidator ControlToValidate="ddl_vendor" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Vendor" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label23" runat="server" Text="Building name"></asp:Label>
                                                        <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:DropDownList ID="ddl_build" Height="32px" Width="200px" parsely-trigger="change" runat="server"></asp:DropDownList>
                                                        <asp:CompareValidator ControlToValidate="ddl_build" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Building Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_pre_addr1" runat="server" Text="Expense Details"></asp:Label>
                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        <asp:Label ID="lbl_pre_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_details" runat="server" Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter details" TextMode="MultiLine" required></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label7" runat="server" Text="Comments"></asp:Label>
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_comment" runat="server" Height="32px" Width="200px" placeholder="Enter comments" Style="text-transform: capitalize;" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label15" runat="server" Text="Amount"></asp:Label>
                                                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_amount" runat="server" Height="32px" Width="200px" placeholder="Enter Amount"  onkeypress="return digit(event);" OnTextChanged="txt_amount_TextChanged" AutoPostBack="True" required></asp:TextBox>
                                                        <br />
                                                   </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-6">
                                                        <asp:CheckBox ID="add_chk" runat="server" Text="Adding Maintanance" Width="200px" />
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label10" runat="server" Text="Tax"></asp:Label>
                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_tax" runat="server" Height="32px" Width="200px" placeholder="Tax" onkeypress="return digit(event);" OnTextChanged="txt_tax_TextChanged" AutoPostBack="true" required></asp:TextBox>

                                                    </div>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-6">
                                                        <asp:CheckBox ID="regular_chk" runat="server" Text="Regular Expense" Width="200px" />

                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label26" runat="server" Text="TDS"></asp:Label>
                                                        <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_tds" runat="server" Height="32px" Width="200px" onkeypress="return digit(event);" placeholder="TDS"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="row">

                                                    <div class="col-sm-3">
                                                        <asp:LinkButton ID="btn_add" runat="server" Text="Add Approver" data-toggle="modal" data-target="#emailmodal"></asp:LinkButton>
                                                    </div>


                                                    <div class="col-sm-3">
                                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false"  OnRowDeleting="GridView3_RowDeleting" OnRowDataBound="GridView3_RowDataBound" GridLines="None">

                                                            <Columns>

                                                                <asp:TemplateField HeaderText="user_id" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="user_id" Text='<%# Bind("user_id")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Approvers">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="name1" Text='<%# Bind("name")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="status" Text='<%#  Eval("status").ToString()=="0"?"No Action":"Approved <br/>" +Eval("date","{0:dd-MMM-yyyy}")%>'></asp:Label>
                                                                   <asp:Button runat="server" ID="btn_approved" OnClick="btn_approved_Click" OnClientClick="return confirm('Are you sure want to approve this expense?');" Text="Not Approved" /> 
                                                                        </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="20">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton runat="server" ID="edit551" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                
                                                            </Columns>
                                                        </asp:GridView>

                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label20" runat="server" Text="Final Amount"></asp:Label>
                                                        <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_famount" runat="server" Height="32px" Width="200px" onkeypress="return digit(event);" placeholder="Final Amount" required></asp:TextBox>

                                                    </div>


                                                </div>
                                            </div>



                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </asp:Panel>

                                </div>


                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="row">
                                            <center>
                                                <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click" ValidationGroup="g1" class="btn btn-primary" />
                                                <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                                <asp:Button ID="btn_close" type="button-close" class="btn btn-primary" runat="server" Text="Close" OnClick="btn_close_Click" UseSubmitBehavior="False" />
                                            </center>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="modal fade bs-example-modal-sm" id="emailmodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content" style="height: auto; width: 300px;">
                                <div class="modal-header">

                                    <h4 class="modal-title" id="gridSystemModalLabel1"><strong>Select Customer</strong></h4>
                                </div>
                                <asp:UpdatePanel ID="assd" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="modal-body">

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <label>
                                                            Select all</label>
                                                        <asp:CheckBox ID="CheckAll" runat="server" AutoPostBack="true" OnCheckedChanged="CheckAll_CheckedChanged"></asp:CheckBox>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-sm-12">
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView2_RowDataBound" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeader="false" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" GridLines="None">

                                                    <Columns>

                                                        <asp:TemplateField HeaderText="user_id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="user_id" Text='<%# Bind("user_id")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="name" Text='<%# Bind("name")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox runat="server" ID="chk" AutoPostBack="true" OnCheckedChanged="name_CheckedChanged"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>

                                            </div>


                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="modal-footer">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="pull-left">
                                                <asp:Button ID="Button1" runat="server" Text="Close" class="btn btn-default" data-dismiss="modal" />
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="pull-right">
                                                <asp:Button ID="btn_confirm" runat="server" Text="Confirm" OnClick="btn_confirm_Click" UseSubmitBehavior="false" class="btn btn-primary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.modal-body -->
                        </div>
                        <!-- /.modal-content -->
                    </div>

                </div>
            </div>
        </div>
   
</asp:Content>




