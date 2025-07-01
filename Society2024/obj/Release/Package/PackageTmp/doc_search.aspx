﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doc_search.aspx.cs" Inherits="Society.doc_search" MasterPageFile="~/Site.Master" %>


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
                            <center>Search Documents</center>
                         </h1>
                    </th>
                </tr>
                            </table>
                            <br />

                            <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                            <asp:HiddenField ID="flat_id" runat="server" />
              <asp:HiddenField ID="doc_id" runat="Server"></asp:HiddenField>
                            <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                                   <div class="form-group">

                                          <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                        <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="300px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                   
                                        <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                                   
                                     <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>

                              </div>
                           </div>
                       </div>

              <div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found"  OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">

                                <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="doc_id" SortExpression="doc_id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="doc_id" runat="server" Text='<%# Bind("doc_id")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Document Type" SortExpression="doc_name">
                                        <ItemTemplate>
                                            <asp:Label ID="doc_name" runat="server" Text='<%# Bind("doc_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("doc_id")%>'> <img src="Images/123.png" /></asp:LinkButton>

                                            <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

<%--                                     <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete_10781634.png" ShowDeleteButton="True" ControlStyle-Height="25" />--%>
                                   
                               <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                        <ItemTemplate >
                                            <asp:LinkButton runat="server" ID="edit551" CommandName="Delete"  OnClientClick="return confirm('Are you sure want to delete?');" ><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                              </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    
                                    
                                    <%--                                    <asp:LinkButton  ButtonType="Button" data-toggle="modal" data-target=".bs-example-modal-sm" SelectText="Edit" ControlStyle-ForeColor="blue" />--%>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>


             <div class="modal fade bs-example-modal-sm"  tabindex="-1" id="edit_model" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                <div class="modal-dialog modal-sm"  >
                    <div class="modal-content" style="height: 250px; width: 400px;">
                        <div class="modal-header">
                          <%--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                            <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Document Type</strong></h4>
                        </div>
                        <div class="modal-body" id="invoice_data">
                               

                                    <div class="form-group">
                                        <div class="alert alert-danger danger" style="display: none;"></div>
                                    </div>
                                    <asp:UpdatePanel ID="upnlCountry" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>

        <div class="form-group">
                <div class="row ">
                    <div class="col-sm-5">
                        <asp:Label ID="lbl_co_name" runat="server" Text="Document Type"></asp:Label>
                        <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                        
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txt_doc_name" runat="server" Style="text-transform: capitalize;" placeholder="Enter Document Type" required autofocus OnTextChanged="txt_doc_name_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Forecolor="Red"></asp:Label>
                    </div>
                    
                </div>
            </div>
                                            </ContentTemplate>
                                    </asp:UpdatePanel>

                         
                            </div>

     <div class="modal-footer">
            <div class="form-group">
                <div class="row ">
                  <center>
                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" />
                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" Visible="false" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click"  />
                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click"  UseSubmitBehavior="False" />
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
