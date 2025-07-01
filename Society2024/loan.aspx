<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loan.aspx.cs" Inherits="Society.loan" MasterPageFile="~/Site.Master" %>


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



    <%-- <div class="container">
        <div class="card card-primary">
            <div class="card-body" style="background-color: lemonchiffon">
                <div class="row justify-content-center align-items-center text-center text-white bg-dark">
                    <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-10">

                        <br />
                        <br />
                        <div class="container" style="box-shadow: 2px 1px 35px 6px #000000; box-shadow: 2px 1px 35px 6px #000000;">
                            <br />--%>
     <div class="box box-primary">
        <div class="box-header with-border">
        <div class="box-body">

            <table width="100%">
               <tr>
                    <th width="100%">
                       <h1 class="bg-primary text-white">
                            <center>Search Loan</center>
                         </h1>
                    </th>
                </tr>
            </table>
            <br />

            <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
            <asp:HiddenField ID="loan_id" runat="server" />
            <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
            <div class="form-group">
                <div class="row ">
                  <div class="col-12">
                    <div class="d-flex align-items-center">
                        <asp:DropDownList ID="search_field" runat="server" width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="bank">Bank Name</asp:ListItem>
                                            <asp:ListItem Value="loan_clearance">Loan Clearance</asp:ListItem>
                        </asp:DropDownList>&nbsp;&nbsp
                        
                        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                  
                        <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp
                    
                        <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />&nbsp;&nbsp</asp:Panel>
                    
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">New Entry</button>

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
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="50px" SortExpression="No" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="loan_id" SortExpression="loan_id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="loan_id" runat="server" Text='<%# Bind("loan_id")%>'></asp:Label>
                                            </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Bank Name" SortExpression="bank">
                                        <ItemTemplate>
                                            <asp:Label ID="Lblff" runat="server" Text='<%# Bind("bank")%>'></asp:Label>
                                            </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Loan Clearance" ItemStyle-Width="250px" SortExpression="loan_clearance">
                                        <ItemTemplate>
                                            <asp:Label ID="lfhf" runat="server" Text='<%# Bind("loan_clearance","{0:dd-MM-yyyy}")%>'></asp:Label>
                                            </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("loan_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50px">
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
        </div>

    </div>


<%--    <div class="modal fade bs-example-modal-sm" id="edit_model" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="height: auto; width: auto">
                <div class="modal-header">
                    <h4 class="modal-title" id="gridSystemModalLabel"><strong>Add Loan & Lien</strong></h4>
                </div>
                <div class="modal-body" id="invoice_data">
                    <form id="owner-socity-add" action="" method="post">
                        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                        <div class="form-group">
                            <div class="alert alert-danger danger" style="display: none;"></div>
                        </div>
                        <label>Flat Number:</label>
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                        <div class="form-group">
                            <asp:DropDownList ID="ddl_flat" runat="server" class="form-control" parsely-trigger="change" BackColor="WhiteSmoke" required></asp:DropDownList>
                            <br />
                            <asp:CompareValidator ControlToValidate="ddl_flat" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Flat No" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                        </div>
                        <label>Name of the Bank:</label> 
                                 <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                        <div class="form-group">
                            <asp:TextBox ID="txt_bank" Font-Bold="true" Style="text-transform: capitalize;" placeholder="Enter Bank Name" runat="server" required class="form-control"></asp:TextBox>
                        </div>
                        <label>Type of Loan:</label>
                        <div class="form-group">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                            <asp:DropDownList ID="ddl_loan" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_loan_SelectedIndexChanged" parsley-trigger="change" BackColor="WhiteSmoke"></asp:DropDownList>
                            <br />
                            <asp:CompareValidator ControlToValidate="ddl_loan" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Type of Loan" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                        </div>
                         <asp:Panel ID="Panel2" Visible="false" runat="server">
                        <label class="specifyOthers">Specify Other:</label>
                        <div class="form-group">
                            <asp:TextBox ID="txt_other" Font-Bold="true" runat="server" Style="text-transform: capitalize;"  class="form-control" required></asp:TextBox>
                        </div>
                        </asp:Panel>
                        <label>First NOC Issue By:</label>
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                        <div class="form-group">
                            <asp:DropDownList ID="ddl_noc" runat="server" class="form-control" parsely-trigger="change" BackColor="WhiteSmoke" required>
                                <asp:ListItem>select</asp:ListItem>
                                <asp:ListItem>Society</asp:ListItem>
                                <asp:ListItem>Builder</asp:ListItem>
                            </asp:DropDownList>
                              <br />
                            <asp:CompareValidator ControlToValidate="ddl_noc" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select First NOC Issued By" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                        </div>
                        <label>Society NOC Date:</label>
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                        <div class="form-group">
                            <asp:TextBox ID="txt_noc_society" Font-Bold="true" runat="server" TextMode="Date" class="form-control" required></asp:TextBox>
                        </div>
                        <asp:Panel ID="Panel1" Visible="false" runat="server">
                            <div class="form-group ">
                                <label>Date of Loan Clearance:</label>
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                <asp:TextBox ID="txt_loan_clear" Font-Bold="true" TextMode="Date" runat="server" class="form-control" required></asp:TextBox>
                            </div>
                        </asp:Panel>
                        <label>Share Certificate With:</label>
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                        <div class="form-group">
                            <asp:DropDownList ID="ddl_certificate" runat="server" class="form-control" BackColor="WhiteSmoke" parsley-trigger="change" required></asp:DropDownList>
                        </div>
                        <asp:CompareValidator ControlToValidate="ddl_certificate" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select NOC" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                               
                                </ContentTemplate>
                        </asp:UpdatePanel>
                    </form>
                </div>
                                    <div class="modal-footer">
                <div class="form-group">
                    <div class="row">
                        <center>
                            <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click" ValidationGroup="g1" class="btn btn-primary" />
                            <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                            <asp:Button ID="close" type="button-close" class="btn btn-primary" runat="server" Text="Close" OnClick="close_Click" UseSubmitBehavior="False" />
                        </center>
                        <br />
                    </div>
                </div>
                                        </div>
            </div>
        </div>
    </div>--%>



         <div class="modal fade bs-example-modal-sm" id="edit_model" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="height: auto; width: auto">
            <div class="modal-header">
                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Add Loan & Lien</strong></h4>
            </div>
            <div class="modal-body" id="invoice_data">
                <form id="owner-socity-add" action="" method="post">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                        <ContentTemplate>

                            <div class="form-group">
                                <div class="alert alert-danger danger" style="display: none;"></div>
                            </div>

                            <label>Flat Number:<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddl_flat" runat="server" class="form-control" parsely-trigger="change" BackColor="WhiteSmoke" required></asp:DropDownList>
                                <asp:CompareValidator ControlToValidate="ddl_flat" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Flat No" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                            </div>

                            <label>Name of the Bank:<asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                            <div class="form-group">
                                <asp:TextBox ID="txt_bank" Font-Bold="true" Style="text-transform: capitalize;" placeholder="Enter Bank Name" runat="server" required class="form-control"></asp:TextBox>
                            </div>

                            <label>Type of Loan:<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddl_loan" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_loan_SelectedIndexChanged" parsley-trigger="change" BackColor="WhiteSmoke"></asp:DropDownList>
                                <asp:CompareValidator ControlToValidate="ddl_loan" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Type of Loan" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                            </div>

                            <asp:Panel ID="Panel2" Visible="false" runat="server">
                                <label class="specifyOthers">Specify Other:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_other" Font-Bold="true" runat="server" Style="text-transform: capitalize;" class="form-control" required></asp:TextBox>
                                </div>
                            </asp:Panel>

                            <label>First NOC Issue By:<asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddl_noc" runat="server" class="form-control" parsely-trigger="change" BackColor="WhiteSmoke" required>
                                    <asp:ListItem>select</asp:ListItem>
                                    <asp:ListItem>Society</asp:ListItem>
                                    <asp:ListItem>Builder</asp:ListItem>
                                </asp:DropDownList>
                                <asp:CompareValidator ControlToValidate="ddl_noc" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select First NOC Issued By" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                            </div>

                            <label>Society NOC Date:<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                            <div class="form-group">
                                <asp:TextBox ID="txt_noc_society" Font-Bold="true" runat="server" TextMode="Date" class="form-control" required></asp:TextBox>
                            </div>

                            <asp:Panel ID="Panel1" Visible="false" runat="server">
                                <div class="form-group">
                                    <label>Date of Loan Clearance:<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                                    <asp:TextBox ID="txt_loan_clear" Font-Bold="true" TextMode="Date" runat="server" class="form-control" required></asp:TextBox>
                                </div>
                            </asp:Panel>

                            <label>Share Certificate With:<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddl_certificate" runat="server" class="form-control" BackColor="WhiteSmoke" parsley-trigger="change" required></asp:DropDownList>
                                <asp:CompareValidator ControlToValidate="ddl_certificate" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select NOC" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </form>
            </div>

            <div class="modal-footer">
                <div class="form-group">
                    <div class="row">
                        <center>
                            <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click" ValidationGroup="g1" class="btn btn-primary" />
                            <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                            <asp:Button ID="close" type="button-close" class="btn btn-primary" runat="server" Text="Close" OnClick="close_Click" UseSubmitBehavior="False" />
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

 </div>
    <br /><br /><br /><br /><br /><br />
</asp:Content>
