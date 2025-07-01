﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt_search_form.aspx.cs" Inherits="Society.receipt_search_form" MasterPageFile="~/Site.Master" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        
        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }

        function validateAndSubmit() {
           
            $('#emailmodal').modal('hide'); 
            return true; 
        }
    </script>
    
    <script>
        function openEmailModal() {
            $('#emailmodal').modal('show');
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script type="text/javascript"> 
        function SuccessEntry() {
            Swal.fire({
                title: '✅ Success!',
                text: 'Saved Successfully',
                icon: 'success',
                showConfirmButton: true,
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'OK',
                timer: 3000,
                timerProgressBar: true,

                didOpen: () => {
                    Swal.showLoading()

                }, willClose: () => {

                    window.location.href = 'receipt_search_form.aspx';

                }

            });

        }
    </script>

    <div class="box box-primary">
        <div class="box-header with-border">

            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Search Receipts</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                
                <asp:HiddenField ID="receipt_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="build_id" runat="server" />
                <asp:HiddenField ID="n_m_id" runat="server" />

                <asp:HiddenField ID="shop_maint_id" runat="server" />
                <asp:HiddenField ID="wing_id" runat="server" />
                <asp:HiddenField ID="owner_id" runat="server" />

                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                            <div class="d-flex align-items-center">

                                <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                    <asp:ListItem Value="receipt_no">Receipt No</asp:ListItem>
                                    <asp:ListItem Value="build_name">Building name</asp:ListItem>
                                    <asp:ListItem Value="name">Name</asp:ListItem>
                                    <asp:ListItem Value="w_name">Wing name</asp:ListItem>

                                </asp:DropDownList>&nbsp;&nbsp;
                      
                             <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                 <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Width="200px" Height="32px" Font-Bold="true" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                        
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />
                             </asp:Panel>
                                &nbsp;&nbsp; 
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>


                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="50" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Receipt" SortExpression="receipt_no">
                                            <ItemTemplate>
                                                <asp:Label ID="receipt_no" runat="server" Text='<%# Bind("receipt_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Building Name" SortExpression="build_name">
                                            <ItemTemplate>
                                                <asp:Label ID="b_id" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Wing" SortExpression="w_name">
                                            <ItemTemplate>
                                                <asp:Label ID="name1" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Received Amount" SortExpression="received_amt">
                                            <ItemTemplate>
                                                <asp:Label ID="received_amt" runat="server" Text='<%# Bind("received_amt")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Mode" SortExpression="pay_mode_name">
                                            <ItemTemplate>
                                                <asp:Label ID="pay_mode_name" runat="server" Text='<%# Bind("pay_mode_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date" SortExpression="date">
                                            <ItemTemplate>
                                                <asp:Label ID="date" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--   
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("receipt_id")%>'> <img src="Images/123.png" /></asp:LinkButton>--%>
                                        <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                        <%-- </ItemTemplate>
                                    </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Button runat="server" ID="save" OnCommand="print_save_Command" Text="Print" Visible="true" UseSubmitBehavior="false" CommandName="Update" CommandArgument='<%# Bind("receipt_id")%>'></asp:Button>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("receipt_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
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
                        <div class="modal-content" style="height: auto; width: 800px;">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Receipt</strong></h4>
                                <asp:Label ID="receipt_no" runat="server" Font-Bold="True" Font-Size="Medium" Text=":252595"></asp:Label>
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
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label13" runat="server" Text="Building Name"></asp:Label>
                                                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:DropDownList ID="ddl_build" Height="32px" Width="150px" runat="server" required OnSelectedIndexChanged="ddl_build_SelectedIndexChanged" parsely-trigger="change" AutoPostBack="true"></asp:DropDownList>
                                                        <br />
                                                        <asp:CompareValidator ControlToValidate="ddl_build" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Building Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_date" runat="server" Text="Date :"></asp:Label>
                                                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_date" runat="server" Height="32px" Width="150px" TextMode="Date" required></asp:TextBox>


                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label16" runat="server" Text="Wing Name"></asp:Label>
                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:DropDownList ID="ddl_wing" Height="32px" Width="150px" runat="server" parsely_trigger="change" required OnSelectedIndexChanged="ddl_wing_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <br />
                                                        <asp:CompareValidator ControlToValidate="ddl_wing" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Wing Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_cust_name" runat="server" Text="Owner Name"></asp:Label>
                                                        <asp:Label ID="lbl_cust_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:DropDownList ID="ddl_owner" Height="32px" Width="150px" runat="server" parsely-trigger="change" required OnSelectedIndexChanged="ddl_owner_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <br />
                                                        <asp:CompareValidator ControlToValidate="ddl_owner" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Owner Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">


                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label6" runat="server" Text="Receivable Amount"></asp:Label>
                                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_amount" runat="server" Height="32px" Width="150px" placeholder="Enter Amount" Enabled="false"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_pay_status" runat="server" Text="Pay Mode"></asp:Label>
                                                        <asp:Label ID="lbl_pay_status_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:DropDownList ID="drp_pay_status" runat="server" Height="32px" Width="150px" AutoPostBack="true" parsely-trigger="change" OnSelectedIndexChanged="drp_pay_status_SelectedIndexChanged"></asp:DropDownList>
                                                        <br />
                                                        <asp:CompareValidator ControlToValidate="drp_pay_status" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Pay Status" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    </div>
                                                    <%-- <div class="col-sm-3">
                <asp:Label ID="lbl_bill_no" runat="server" Text="Bill No"></asp:Label>
                <asp:Label ID="lbl_bill_no_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                  </div>
            <div class="col-sm-3">
               <asp:DropDownList ID="ddl_bill" runat="server" Height="32px" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddl_bill_SelectedIndexChanged" required></asp:DropDownList>
            </div>--%>
                                                </div>
                                            </div>



                                            <asp:Panel ID="panel3" runat="server" Visible="false">
                                                <div class="form-group">
                                                    <div class="row ">


                                                        <div class="col-sm-2">
                                                            <asp:Label ID="Label21" runat="server" Text="Enter UPI:"></asp:Label>
                                                            <asp:Label ID="Label22" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <asp:TextBox ID="txt_upi" required Width="200px" Height="32px" runat="server"></asp:TextBox>
                                                        </div>

                                                        <asp:Button ID="Button2" runat="server" Height="30px" CssClass="btn btn-primary" Text="Verify & Proceed" />
                                                    </div>

                                                </div>


                                            </asp:Panel>



                                            <asp:Panel ID="panel2" runat="server">
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-3">
                                                            <asp:Label ID="lbl_chqno" runat="server" Text="Cheque/Draft No"></asp:Label>
                                                            <asp:Label ID="lbl_chqno_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:DropDownList ID="ddl_chq" runat="server" Height="32px" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="txt_chqno_SelectedIndexChanged" />
                                                            <asp:TextBox ID="txt_chqno" runat="server" Height="32px" Width="150px" placeholder="Cheque No"></asp:TextBox>
                                                        </div>


                                                        <div class="col-sm-3">
                                                            <asp:Label ID="lbl_chqdate" runat="server" Text="Cheque Date"></asp:Label>
                                                            <asp:Label ID="lbl_chqdate_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:TextBox ID="txt_chqdate" runat="server" Enabled="false" Height="32px" Width="150px" TextMode="Date"></asp:TextBox>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-6"></div>
                                                        <div class="col-sm-3">
                                                            <asp:Label ID="Label17" runat="server" Text="Cheque Amount"></asp:Label>
                                                            <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:TextBox ID="che_amount" runat="server" Enabled="false" Height="32px" Width="150px" placeholder="Cheque Amount"></asp:TextBox>

                                                        </div>

                                                    </div>
                                                </div>
                                            </asp:Panel>

                                            <asp:Panel ID="panel1" runat="server">
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-3">
                                                            <asp:Label ID="Label4" runat="server" Text="Received Amount"></asp:Label>
                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:TextBox ID="txt_received_amt" Height="32px" Width="150px" runat="server" MaxLength="50" placeholder="Received Amount" onkeypress="return digit(event);" required OnTextChanged="txt_received_amt_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:Label ID="Label9" runat="server" Text="Balance"></asp:Label>
                                                            <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:TextBox ID="txt_pdc_balance" Height="32px" Width="150px" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_remarks" runat="server" Text="Remark"></asp:Label>

                                                        <asp:Label ID="lbl_remarks_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_remarks" runat="server" Style="text-transform: capitalize;" Height="32px" Width="150px" MaxLength="250" placeholder="Enter Remark"></asp:TextBox>
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
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="g1" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" Visible="false" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" CausesValidation="false" UseSubmitBehavior="False" />
                                            <asp:Button ID="btn_print" runat="server" Text="Print" class="btn btn-primary" OnClick="btn_print_Click" CausesValidation="false" />
                                             <asp:Button ID="btn_email" runat="server" Text="Email" class="btn btn-primary" OnClick="btn_email_Click" CausesValidation="false" />
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
    <br />
    <br />
    <br />
    <br />


</asp:Content>
