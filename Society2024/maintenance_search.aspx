﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="maintenance_search.aspx.cs" Inherits="Society.maintenance_search" MasterPageFile="~/Site.Master" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
        function openModal() {
            $('#edit_model').modal('show');
        }
    </script>
    <script type="text/javascript">
      /*  function cal()*/
          
    </script>

     <div class="box box-primary">
        <div class="box-header with-border">
        <div class="box-body">

            <table width="100%">
               <tr>
                    <th width="100%">
                       <h1 class="bg-primary text-white">
                            <center>Search Maintenance</center>
                         </h1>
                    </th>
                </tr>
            </table>
            <br />

    <asp:HiddenField ID="n_m_id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
              <asp:HiddenField ID="m_bill_status" runat="Server"></asp:HiddenField>

    <%--<div class="form-group">
                <div class="row ">
                    <div class="col-sm-3">
                       
                    </div>
                     </div>
                    <div class="col-sm-4">

                        <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" runat="server"></asp:TextBox>
                    </div>

                  
                    
                </div>
            </div>--%>
           
            <div class="form-group">
                <div class="col-12">
            <div class="d-flex align-items-center">
                         <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px"  Autopostback="true" OnSelectedIndexChanged="search_field_SelectedIndexChanged">
                              <asp:ListItem  >Select</asp:ListItem>
                            <asp:ListItem Value="build_name">Building Name</asp:ListItem>
                               <asp:ListItem Value="year" >Year</asp:ListItem>
                             <asp:ListItem Value="month_name" >Month</asp:ListItem>
                         </asp:DropDownList>&nbsp;&nbsp;
                    
                        <asp:DropDownList ID="drop_build" runat="server"  Width="200px" Height="32px"></asp:DropDownList>&nbsp;&nbsp;

                      <asp:Button ID="btn_search" runat="server" Text="Search" Class="btn btn-primary" OnClick="btn_search_Click" UseSubmitBehavior="False" />&nbsp;&nbsp;
                   
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model" >New Entry</button>&nbsp;&nbsp;
                         </div>
                    </div>
                </div>

            <div class="form-group">
                <div class="row ">
                     <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
               

            <%--<asp:GridView ID="GridView1" Width="100%" runat="server" SkinID="gvSkin" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" OnRowUpdating="GridView1_RowUpdating" AllowPaging="false" OnRowDeleting="GridView1_RowDeleting">--%>
               <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="50" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" OnRowUpdating="GridView1_RowUpdating" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowDeleting="GridView1_RowDeleting">
                            
                     <Columns>
                         <asp:TemplateField HeaderText="No" Visible="true" ItemStyle-Width="80">
                        <ItemTemplate>
                            <asp:Label ID="No" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="n_m_id" runat="server" Text='<%# Bind("n_m_id")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Month" ItemStyle-Width="100" SortExpression="month_name">
                        <ItemTemplate>
                            <asp:Label ID="month" runat="server" Text='<%#Bind("month_name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Year" ItemStyle-Width="100" SortExpression="year">
                        <ItemTemplate>
                            <asp:Label ID="Year" runat="server" Text='<%# Bind("year")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Building" ItemStyle-Width="350" SortExpression="building_name">
                        <ItemTemplate>
                            <asp:Label ID="building_name" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Wing" ItemStyle-Width="350" SortExpression="wings">
                        <ItemTemplate>
                            <asp:Label ID="w_name" runat="server" Text='<%# Bind("wings")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Bill Date" ItemStyle-Width="200" SortExpression="m_date">
                        <ItemTemplate>
                            <asp:Label ID="m_date" runat="server" Text='<%# Bind("m_date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="200" SortExpression="due_date">
                        <ItemTemplate>
                            <asp:Label ID="due_date" runat="server" Text='<%# Bind("due_date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount" ItemStyle-Width="120" SortExpression="m_total">
                        <ItemTemplate>
                            <asp:Label ID="m_total" runat="server" Text='<%# Bind("m_total")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Status" ItemStyle-Width="120" SortExpression="Status">
                        <ItemTemplate>
                            <asp:Label ID="status" runat="server" Text='<%# Bind("Status")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="100" HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("n_m_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField >
                      <asp:TemplateField ItemStyle-Width="50" HeaderText="Delete">
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
            

            <div class="modal fade bs-example-modal-sm" tabindex="-1" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                <div class="modal-dialog modal-sm-4" style="right:150px">
                    <div class="modal-content" style="height: auto; width: 1000px;">
                        <div class="modal-header">
                            <h4 class="modal-title"><strong>New Maintainance</strong></h4>
                        </div>
                        <div class="modal-body" id="invoice_data">

                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel1" runat="server">
                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-2">
                                                <asp:Label ID="Label41" runat="server" Font-Bold="True" Font-Size="Medium" Text="Building Name"></asp:Label>
                                                <asp:Label ID="Label39" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label40" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="drp_build" runat="server" Width="100px" parsely-trigger="change" OnSelectedIndexChanged="drp_build_SelectedIndexChanged" AutoPostBack="true" required></asp:DropDownList>
                                                  <br/>
                                                <asp:CompareValidator ControlToValidate="drp_build" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Building Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="Medium" Text="Date"></asp:Label>
                                                <asp:Label ID="Label43" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label44" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_date" runat="server" placeholder="Enter Date" required TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-2">
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Text="Wing"></asp:Label>
                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="drp_wing" runat="server" Width="100px" parsely-trigger="change" OnSelectedIndexChanged="drp_wing_SelectedIndexChanged" AutoPostBack="true" required></asp:DropDownList>
                                                <br/>
                                                 
                                            
                                                <asp:CompareValidator ControlToValidate="drp_wing" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Wing" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                            </div>
                                             <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ></asp:Label>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row ">
                                           
                                            <div class="col-sm-2">
                                             
                                                    <asp:Label ID="TextBox2" runat="server" Text="Nature Of Charge" Font-Bold="true" required autofocus></asp:Label>
                                       
                                                <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-width: 1px;" />
                                            </div>
                                               <div class="col-sm-2"></div>
                                            <div class="col-sm-2">
                                              
                                                    <asp:Label ID="TextBox3" runat="server" Text="Total Amount" Font-Bold="true" required autofocus></asp:Label>
                                             
                                                <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-width: 1px;" />
                                                   </div>
                                             <div class="col-sm-1"></div>
                                            <div class="col-sm-2">
                                              
                                                    <asp:Label ID="Label3" runat="server" Text="Amount Per Flat" Font-Bold="true" required autofocus></asp:Label>
                                             
                                                <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-width: 1px;" />
                                                   </div>
                                            </div>

                                        </div>
                                    
                                    <div>
                                     <div class="col-sm-2"></div>
                                        <asp:PlaceHolder runat="server" ID="TextBoxPlaceHolder" />
                                   <asp:Panel ID="pnlTextBoxes" runat="server" ClientIDMode="Static" ></asp:Panel>
                                        </div>
                                   <hr  />
                                   <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="btnAdd_Click" />
                              
                                       

                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-3">
                                                <asp:Label ID="TextBox1" runat="server" Text="Total Amount" required autofocus Font-Bold></asp:Label>
                                                <asp:Label ID="Label45" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_amount" runat="server" placeholder="Amount" Enabled="false" autofocus></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                
                               </asp:Panel>

                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <div class="pull-center">
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="g1" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_bill" runat="server" Text="Generate Bill" class="btn btn-primary" OnClick="btn_bill_Click" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary"  OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#emailmodal">Email</button>
                                             <asp:Button ID="btn_print" runat="server" Text="Print" class="btn btn-primary" OnClick="btn_print_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" UseSubmitBehavior="false" class="btn btn-primary" OnClick="btn_close_Click" />
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
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
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel1"><strong>Select Customer</strong></h4>
                            </div>

                            <div class="modal-body">
                                <asp:UpdatePanel ID="assd" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <label>
                                                        Select all</label>
                                                    <asp:CheckBox ID="CheckAll" runat="server" AutoPostBack="true" OnCheckedChanged="CheckAll_CheckedChanged" ></asp:CheckBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <asp:Panel ID="Panel21" runat="server" ScrollBars="Auto" Height="400px">

                                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" Font-Bold="true"></asp:CheckBoxList>
                                                  </asp:Panel>    </div>
                                                </div>
                                                  </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>


                            </div>
                             <div class="modal-footer">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="pull-left">
                                            <asp:Button ID="Button1" runat="server" Text="Close" class="btn btn-default" data-dismiss="modal" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="pull-right">
                                            <asp:Button ID="btn_email_send" runat="server" Text="Email" class="btn btn-primary" />
                                        </div>
                                    </div>
                                </div>



                            </div>
                        </div>
                        <!-- /.modal-body 
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->


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
