<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact_search.aspx.cs" Inherits="Society.contact_search" MasterPageFile="~/Site.Master" %>


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
              <h2 class="box-title"></h2>
            </div>
         <div class="box-body">



                            <table width="100%">
                                <tr>
                    <th width="100%">
                       <h1 class="bg-primary text-white">
                            <center>Search Contact</center>
                         </h1>
                    </th>
                </tr>
                            </table>
                            <br />

                            <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                           <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                            <asp:HiddenField ID="HiddenField4" runat="server" />
                                   <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="search_field" runat="server" width="200px" Height="32px">
                                            <asp:ListItem Value="p_name">Name</asp:ListItem>
                                            <asp:ListItem Value="p_type">Type</asp:ListItem>
                                            <asp:ListItem Value="org_name">Organization</asp:ListItem>
                                            <asp:ListItem Value="contact_no">Contact No</asp:ListItem>
                                            <asp:ListItem Value="address2">Address2</asp:ListItem>
                                            <asp:ListItem Value="email">Email</asp:ListItem>
                                            <asp:ListItem Value="remark">Remark</asp:ListItem>
                                        
                                            

                                            
                                         </asp:DropDownList>
                                    </div>
                                    <div class="col-sm-4">
                           
                                        <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="col-sm-2">
                                       <%-- <i class="fas fa-search"></i>--%>
                                        <asp:Button ID="btn_search" runat="server" class="btn btn-primary" Font-Bold="true" OnClick="btn_search_Click" Text="Search" />
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:Button ID="btn_new" runat="server" Font-Bold="true" class="btn btn-primary mr-2" OnClick="btn_new_Click" Text="New Entry" />
                                    </div>

                                </div>
                            </div>
                                    






    <asp:panel ID="panel1" runat="server">
   <%-- <div class="box box-info">
         <div class="box-body">--%>
                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <div style="width: 100%; overflow: auto;">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting">

                                                <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:CommandField ShowSelectButton="false" ControlStyle-ForeColor="blue" />--%>
                                                     <asp:TemplateField HeaderText="Name" Visible="true" SortExpression="p_name">
                                                        <ItemTemplate>

                                                            <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl='<%# "contact1.aspx?b_id=" + Eval("id")%>' Text='<%# Bind("p_name")%>'></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type" Visible="true" SortExpression="p_type">
                                    <ItemTemplate>
                                        <asp:Label ID="t_name" runat="server" Text='<%# Bind("p_type")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Organization" Visible="true" SortExpression="org_name" >
                                    <ItemTemplate>
                                        <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact No" Visible="true" SortExpression="contact_no">
                                    <ItemTemplate>
                                        <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address" Visible="true" SortExpression="address2">
                                    <ItemTemplate>
                                        <asp:Label ID="address" runat="server" Text='<%# Bind("address2")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" Visible="true" SortExpression="email">
                                    <ItemTemplate>
                                        <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remark" Visible="true" SortExpression="remark">
                                    <ItemTemplate>
                                        <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                   
                                                 <asp:TemplateField  ItemStyle-Width="50">
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
             <%--</div>
        </div>--%>
        </asp:panel>
    <br />
    <br /> 
    
                  <%--<div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="DropDownList1" runat="server" width="200px" Height="32px">
                                            <asp:ListItem Value="p_name">Name</asp:ListItem>
                                            <asp:ListItem Value="t_name">Type</asp:ListItem>
                                            <asp:ListItem Value="org_name">Organization</asp:ListItem>
                                            <asp:ListItem Value="contact_no">Contact No</asp:ListItem>
                                            <asp:ListItem Value="address">Address</asp:ListItem>
                                            <asp:ListItem Value="email">Email</asp:ListItem>
                                            <asp:ListItem Value="remark">Remark</asp:ListItem>
                                        
                                            

                                            
                                         </asp:DropDownList>
                                    </div>
                                    <div class="col-sm-4">
                           
                                        <asp:TextBox ID="TextBox1" Font-Bold="true" Width="200px" Height="32px" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="col-sm-2">
                                       <i class="fas fa-search"></i>
                                        <asp:Button ID="Button1" runat="server" class="btn btn-primary" Font-Bold="true" OnClick="btn_search_Click" Text="Search" />
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:Button ID="Button2" runat="server" Font-Bold="true" class="btn btn-primary mr-2" OnClick="btn_new_Click" Text="New entry" />
                                    </div>

                                </div>
                            </div>--%>
                                   

    
    
    
    
    <%--<asp:panel ID="panel2" runat="server" Visible="false">
    <div class="box box-info">
         <div class="box-body">
           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView2_Sorting">
                            <Columns>
                                <asp:TemplateField HeaderText="Name">
                                 <ItemTemplate>
                        <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl='<%# "contact1.aspx?b_id=" + Eval("id")%>' Text='<%# Bind("p_name")%>'></asp:HyperLink>

                                   </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact No">
                                    <ItemTemplate>
                                        <asp:Label ID="contact_no" runat="server" Text='<%# Bind("mobile_no1")%>'></asp:Label>
                                        <asp:Label ID="contact_no2" runat="server" Text='<%# Bind("mobile_no2")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="address" runat="server" Text='<%# Bind("s_address_1")%>'></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("s_address_2")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Preparing Meal">
                                    <ItemTemplate>
                                        <asp:Label ID="meal" runat="server" Text='<%# Bind("meal")%>'></asp:Label>
                                        <asp:textbox ID="meal_charge" runat="server" Text='<%# Bind("meal_charge")%>' Enabled="false"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Cloth Wash">
                                    <ItemTemplate>
                                        <asp:Label ID="cloth_wash" runat="server" Text='<%# Bind("cloth_wash")%>'></asp:Label>
                                        <asp:textbox ID="cloth_wash_charge" runat="server" Text='<%# Bind("cloth_wash_charge")%>' Enabled="false"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Pot Wash">
                                    <ItemTemplate>
                                        <asp:Label ID="b_wash" runat="server" Text='<%# Bind("b_wash")%>'></asp:Label>
                                        <asp:textbox ID="b_wash_charge" runat="server" Text='<%# Bind("b_wash_charge")%>' Enabled="false"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                              <asp:TemplateField HeaderText="Floore Wash">
                                    <ItemTemplate>
                                        <asp:Label ID="f_wash" runat="server" Text='<%# Bind("f_wash")%>'></asp:Label>
                                        <asp:textbox ID="f_wash_charge" runat="server" Text='<%# Bind("f_wash_charge")%>' Enabled="false"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Baby Sitting">
                                    <ItemTemplate>
                                        <asp:Label ID="baby_set" runat="server" Text='<%# Bind("baby_set")%>'></asp:Label>
                                        <asp:textbox ID="b_set_charge" runat="server" Text='<%# Bind("b_set_charge")%>' Enabled="false"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Remark">
                                    <ItemTemplate>
                                        <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
             </div>
        </div>
        </asp:panel>--%>
</div>

    </div>
    
</asp:Content>
