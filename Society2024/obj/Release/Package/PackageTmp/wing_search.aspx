<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wing_search.aspx.cs" Inherits="Society.wing_search" MasterPageFile="~/Site.Master" %>


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
                            <center>Search Wing</center>
                         </h1>
                    </th>
                </tr>
            </table>
            <br />

            <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
            <asp:HiddenField ID="wing_id" runat="server" />
            <asp:HiddenField ID="HiddenField4" runat="server" />
            <asp:HiddenField ID="society_id" runat="server" />
            <div class="form-group">
                <div class="row ">
                     <div class="col-12">
                           <div class="d-flex align-items-center">
                   
                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                            <asp:ListItem Value="w_name">Wing Name</asp:ListItem>
                            <asp:ListItem Value="name">Building Name</asp:ListItem>
                        </asp:DropDownList>&nbsp;&nbsp;
                    
                   
                         <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                        <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                        <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click"  Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>
                   
                      </div>
                   </div>
                </div>
            </div>

               <div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"  AllowPaging="true" 
              PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging">

                                <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="w_id" SortExpression="wing_id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="wing_id" runat="server" Text='<%# Bind("wing_id")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Building"  SortExpression="name">
                                        <ItemTemplate>
                                            <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Wing Name" SortExpression="w_name" >
                                        <ItemTemplate>
                                            <asp:Label ID="w_name" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="30">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("wing_id")%>'><img src="Images/123.png" /></asp:LinkButton>
                                            <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width ="30">
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
       
                <div class="modal fade bs-example-modal-sm" id="edit_model" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content" style="height: 300px; width: 500px;">
                            <div class="modal-header">
                              
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Wing</strong></h4>
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
                                                    <div class="col-sm-5">
                                                     
                                    <asp:Label ID="lbl_co_name" runat="server" Text="Building No/Name :"></asp:Label>

                                                        <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-7">
                                                        <asp:DropDownList ID="ddl_build_name" runat="server" Width="200px" Height="32px" BackColor="WhiteSmoke">
                                                        </asp:DropDownList>
                                                        <br />
                                                         <asp:CompareValidator ControlToValidate="ddl_build_name" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Building" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    </div>

                                                </div>
                                            </div>
                                          
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-5">
                                                       
                                    <asp:Label ID="Label1" runat="server" Text="Wing :"></asp:Label>
                                                        
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-7">
                                                        <asp:TextBox ID="txt_w_name" parsley-trigger="change" runat="server" class="form-control" Width="200px" Height="32px"  ToolTip="Wing" OnTextChanged="txt_w_name_TextChanged" AutoPostBack="true" placeholder="Enter Wing Name" required autofocus ></asp:TextBox>
                                                        <asp:Label ID="Label4" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                    </div>

                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </form>
                            </div><div class="modal-footer">
    
            <div class="form-group">
                <div class="row ">
                  
                        <center>
                            <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" ValidationGroup="g1"/>
                            <asp:Button ID="btn_delete" class="btn btn-primary" runat="server" Visible="false" Text="Delete"  OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="False" />
                            </center>
                        </>
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

</asp:Content>
