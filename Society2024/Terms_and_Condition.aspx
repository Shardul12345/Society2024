﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Terms_and_Condition.aspx.cs" ValidateRequest="false" Inherits="Society2024.Terms_and_Condition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../Scripts/ckeditor/ckeditor.js"></script>
       <script type='text/javascript'>
        function openModal() {
            $('#edit_model').modal('show');
        }
       </script>
    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <asp:HiddenField ID="term_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
              <div class="col-sm-12 d-flex justify-content-center my-3">
              <asp:Button ID="add_new" runat="server" Text="Add Terms and Conditions" CssClass="btn btn-primary btn-lg px-5" OnClick="add_new_Click" UseSubmitBehavior="False" />     
             </div>
          </div>
        </div>
    </div>
    <br />

    <div class="form-group">
        <div class="row ">
            <div class="col-sm-12">
                <div style="width: 70%; overflow: auto;">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating" HeaderStyle-BackColor="lightblue">

                        <Columns>
                            <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="t_id" ItemStyle-Width="100" SortExpression="terms_id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="t_id" runat="server" Text='<%# Bind("term_id")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Terms" Visible="true" SortExpression="terms" ItemStyle-Width="300">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="terms" Text='<%# Bind("terms")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ItemStyle-Width="50">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="edit1" OnCommand="edit1_Command" CommandName="Update" CommandArgument='<%# Bind("term_id")%>'><img src="Images/123.png" /></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>


      <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="mymodel" data-backdrop="static">
                <div class="modal-dialog modal-sm-4">
                    <div class="modal-content" style="height: auto; width: 800px">
                        <div class="modal-header">
                            <h4 class="modal-title" id="gridSystem"><strong> Terms and Conditions</strong></h4>
                             
                        </div>
                        <div class="modal-body" id="invoice_data">
                            <div class="form-group">
                             <div class="row ">
                                  <div class="col-sm-12">
                                 <asp:TextBox ID="editor1" runat="server" CssClass="ckeditor" TextMode="MultiLine"> </asp:TextBox>
                                      </div>

                                  
                                  <asp:Button type="submit" runat="server" class="btn btn-primary"  ID="btnSubmit" OnClick="btnSubmit_Click" Text="Submit" />&nbsp;&nbsp;
                                  <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="False" />
                                 
                                 </div>
                        </div>
                           
                    </div>
                  </div>
               </div>
             </div>


</asp:Content>
