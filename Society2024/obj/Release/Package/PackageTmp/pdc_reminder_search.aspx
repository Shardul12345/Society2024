﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pdc_reminder_search.aspx.cs" Inherits="Society.pdc_reminder_search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="v_id" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="owner_id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="build_id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="wing_id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="pdc_rem_id" runat="Server"></asp:HiddenField>


    <script type='text/javascript'>
        function openModal() {
            $('#edit_model').modal('show');
        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }
        function checkLength(el) {

            if (el.value.length != 10) {

                alert("length must be exactly 10 digits")

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
                            <center>Search PDC Reminder</center>
                         </h1>
                    </th>
                </tr>
            </table>
            <br />

            <div class="form-group">
                <div class="row ">
                   <div class="col-12">
            <div class="d-flex align-items-center">

                        <asp:Label ID="Label15" runat="server" Text="Building  Name"></asp:Label>&nbsp;&nbsp;
                    
                         <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                        <asp:DropDownList ID="drp_build_wing" runat="server" Height="32px" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="drp_build_wing_SelectedIndexChanged" ></asp:DropDownList>&nbsp;&nbsp; 
                         <asp:CompareValidator ControlToValidate="drp_build_wing" ID="CompareValidator1" ValidationGroup="b1" CssClass="errormesg" ErrorMessage="Please select Building" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                  
                        <asp:Label ID="lbl_name" runat="server" Text=" Owner Name"></asp:Label>&nbsp;&nbsp;
                    
                        <asp:DropDownList ID="drop_owner" runat="server" Height="32px" Width="150px" AutoPostBack="true"></asp:DropDownList></asp:Panel>&nbsp;&nbsp;
                       <asp:CompareValidator ControlToValidate="drop_owner" ID="CompareValidator2" ValidationGroup="b1" CssClass="errormesg" ErrorMessage="Please select Owner" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                    
                        <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" class="btn btn-primary" UseSubmitBehavior="False" ValidationGroup="b1" />&nbsp;&nbsp;
               
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>

                    </div>
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
                                    <asp:TemplateField HeaderText="parking_id" ItemStyle-Width="100"  Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="pdc_rem_id" runat="server" Text='<%# Bind("pdc_rem_id")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Owner Name" ItemStyle-Width="200" SortExpression="o_name">
                                        <ItemTemplate>
                                            <asp:Label ID="o_name" runat="server" Text='<%# Bind("o_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Building Name" ItemStyle-Width="200" SortExpression="name">
                                        <ItemTemplate>
                                            <asp:Label ID="b_id" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Wing Name" ItemStyle-Width="150" SortExpression="w_name">
                                        <ItemTemplate>
                                            <asp:Label ID="w_name" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque No" ItemStyle-Width="120" SortExpression="chqno">
                                        <ItemTemplate>
                                            <asp:Label ID="chqno" runat="server" Text='<%# Bind("chqno")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total Amount" ItemStyle-Width="150" SortExpression="che_amount">
                                        <ItemTemplate>
                                            <asp:Label ID="che_amount" runat="server" Text='<%# Bind("che_amount")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("pdc_rem_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                            <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                        <ItemTemplate >
                                            <asp:LinkButton runat="server" ID="edit551" CommandName="Delete"  OnClientClick="return confirm('Are you sure want to delete?');" ><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                              </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                <div class="modal-dialog modal-sm-4" style="right: 80px">
                    <div class="modal-content" style="height: auto; width: 900px;">
                        <div class="modal-header">
                            <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                            <h4 class="modal-title" id="gridSystemModalLabel"><strong>Pending Cheque Remainder</strong></h4>
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
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_cust_name" runat="server" Text="Owner Name"></asp:Label>
                                                    <asp:Label ID="lbl_cust_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddl_owner" runat="server" Height="32px" Width="200px" parsely-trigger="change" AutoPostBack="true" OnSelectedIndexChanged="ddl_owner_SelectedIndexChanged" ></asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="ddl_owner" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Owner Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />

                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label16" runat="server" Text="Buildng-Wing Name"></asp:Label>
                                                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddl_build_wing" Height="32px" Width="200px" parsely-trigger="change" runat="server"></asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="ddl_build_wing" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Building-Wing Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_pre_mob" runat="server" Text="Mobile No."></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_pre_mob" runat="server" MaxLength="10" Height="32px" Width="200px" onblur="checkLength(this)" onkeypress="return digit(event);" placeholder="Enter Mobile No." AutoPostBack="true" required></asp:TextBox>
                                               </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_pre_addr1" runat="server" Text="Present Address"></asp:Label>
                                                    <asp:Label ID="lbl_pre_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_pre_addr1" runat="server" MaxLength="250" Height="32px" Width="200px" placeholder="Enter Present Address" required></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-8"></div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_pre_addr2" runat="server" MaxLength="250" Height="32px" Width="200px" placeholder="Enter Present Address 1"></asp:TextBox>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_add_mob" runat="server" Text="Alternate Mobile No."></asp:Label>
                                                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_add_mob" runat="server" MaxLength="10" Height="32px" Width="200px" onblur="checkLength(this)" onkeypress="return digit(event);" placeholder="Enter Mobile No." ></asp:TextBox>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_mob" runat="server" Text="E-mail ID"></asp:Label>
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_email" Height="32px" Width="200px" placeholder="Enter Email" runat="server" required></asp:TextBox> </br>
                                                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-1">
                                                    <asp:Label ID="lbl_chq_no" runat="server" Text="Cheque No"></asp:Label>
                                                    <asp:Label ID="lbl_chq_no_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_chq_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_chq_no" runat="server" Height="30px" Width="150px" MaxLength="50" onkeypress="return digit(event);" placeholder="Cheque No"></asp:TextBox>
                                                </div>

                                                <div class="col-sm-1">
                                                    <asp:Label ID="lbl_chq_date" runat="server" Text="Cheque Date"></asp:Label>
                                                    <asp:Label ID="lbl_chq_date_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_chq_date_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_chq_date" Height="30px" Width="150px" runat="server" TextMode="Date"></asp:TextBox>
                                                     </div>


                                                <div class="col-sm-1">
                                                    <asp:Label ID="lbl_chq_amount" runat="server" Text="Cheque Amount"></asp:Label>
                                                    <asp:Label ID="lbl_chq_amount_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_chq_amount_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_chq_amount" runat="server" Height="30px" Width="150px" onkeypress="return digit(event);" placeholder="Cheque Amount" required></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label11" runat="server" Text="Cheque Deposited"></asp:Label> <br />
                                                    <asp:CheckBox ID="deposite_chk" runat="server" Checked="false"  />
                                                    
                                                    
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label12" runat="server" Text="Cheque Returned"></asp:Label> <br />
                                                    <asp:CheckBox ID="return_chk" runat="server" Checked="false"  />
                                                    
                                                    
                                                    
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label13" runat="server" Text="Cheque Bounced"></asp:Label>  <br />
                                                    <asp:CheckBox ID="bounce_chk" runat="server" Checked="false"  />
                                                    
                                                    
                                     
                                                </div>

                                                
                                                
                                                <div class="col-sm-2">
                                                    <asp:Button ID="btn_next" runat="server" Text="Next" class="btn btn-primary" autopostback="true" ValidationGroup="g1"  OnClick="btn_next_Click" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-12">
                                                    <div style="width:800px; overflow: auto;">
                                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue">

                                                            <Columns>
                                                                <asp:TemplateField HeaderText="No." ItemStyle-Width="30">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="id" runat="server" Text='<%#Container.DisplayIndex + 1 %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="pdc_id" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="pdc_rem_id" runat="server" Text='<%#Bind("pdc_rem_id")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cheque No" ItemStyle-Width="100">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="cheque_no" runat="server" Text='<%#Bind("chqno")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Cheque Date" ItemStyle-Width="100">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="chq_date" runat="server" Text='<%#Bind("che_date", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Amount" ItemStyle-Width="100">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="chq_amount" runat="server" Text='<%#Bind("che_amount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Deposited">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chk_deposited" runat="server" Enabled="false" Checked='<%# Eval("che_dep").ToString() == "1" ? true : false %>' ItemStyle-Width="100"></asp:CheckBox>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Returned">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chk_returned" runat="server" Enabled="false" Checked='<%# Eval("che_ret").ToString() == "1" ? true : false %>' ItemStyle-Width="100"></asp:CheckBox>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Bounced">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chk_bounced" runat="server" Enabled="false" Checked='<%# Eval("che_can").ToString() == "1" ? true : false %>' ItemStyle-Width="100"></asp:CheckBox>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
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
                                        <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" Visible="false"  OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
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
      <br />  <br />  <br /> <br />  <br />  <br />  <br />  <br />  <br />

</asp:Content>




