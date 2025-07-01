﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="facility_booking.aspx.cs" Inherits="Society.facility_booking" MasterPageFile="~/Site.Master" %>


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
                                <center>Facility Booking</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="facility_book_id" runat="server" />
                <asp:HiddenField ID="owner_id" runat="server" />
                <asp:HiddenField ID="slot_id" runat="server" />
                 <asp:HiddenField ID="hidden_total_amount" runat="server" />
                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                            <div class="d-flex align-items-center">

                                <asp:DropDownList ID="search_field" runat="server" Height="32px" Width="200px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="name">Name</asp:ListItem>
                                    <asp:ListItem Value="from_date">From Date</asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp;
                       
                           <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">

                               <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="150px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                 <%-- <i class="fas fa-search"></i>--%>
                               <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />
                                </asp:Panel>
                                &nbsp;&nbsp;

                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">New Entry</button>

                            </div>
                        </div>
                    </div>
                </div>
         
            <div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowUpdating="GridView1_RowUpdating" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="parking_id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="facility_book_id" runat="server" Text='<%# Bind("facility_book_id")%>'></asp:Label>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" Visible="true" SortExpression="name">
                                        <ItemTemplate>
                                            <asp:Label ID="gfg" runat="server" Text='<%# Bind("name")%>'></asp:Label>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Facility" Visible="true" SortExpression="facility_name">
                                        <ItemTemplate>
                                            <asp:Label ID="addr" runat="server" Text='<%# Bind("facility_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="addr23" runat="server" Text='<%#!string.IsNullOrEmpty(Eval("to_date").ToString()) ? Eval("from_date", "{0:yyyy-MM-dd}") + " to  " + Eval("to_date", "{0:yyyy-MM-dd}"):Eval("from_date","{0:yyyy-MM-dd}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Time" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="addr1" runat="server" Text='<%# Eval("from_time") + " -   "+  Eval("to_time")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Charges" ItemStyle-Width="150" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="charges" runat="server" Text='<%# Bind("amount")%>'></asp:Label>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("parking_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
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
                    <div class="modal-content" style="height: auto; width: 800px;">
                        <div class="modal-header">
                            <h4 class="modal-title" id="gridSystemModalLabel"><strong>Facility Booking</strong></h4>
                        </div>
                        <div class="modal-body" id="invoice_data">

                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>


                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-2">
                                                <asp:Label ID="Label7" runat="server" Text="Facilities"></asp:Label>
                                                <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*" required></asp:Label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="ddl_facility" OnSelectedIndexChanged="ddl_facility_SelectedIndexChanged" runat="server" Height="32px" Width="200px" AutoPostBack="true"></asp:DropDownList>
                                                <%-- <asp:RequiredFieldValidator ControlToValidate=" ForeColor="Red" ID="RequiredFieldValidator1"
                                                        ValidationGroup="valid" CssClass="errormesg" ErrorMessage="Please select a type"
                                                        InitialValue="Select" runat="server" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>--%>
                                            </div>


                                            <div class="col-sm-2">
                                                <asp:Label ID="Label33" runat="server" Text="Date :"></asp:Label>

                                                <asp:Label ID="Label34" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_date" runat="server" TextMode="Date" OnTextChanged="txt_date_TextChanged" Height="32px" Width="200px" AutoPostBack="true" required autofocus></asp:TextBox>

                                            </div>


                                        </div>
                                    </div>
                                     </ContentTemplate>
                                </asp:UpdatePanel>
                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-12">
                                                <div style="width: 100%; overflow: auto;">
                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" OnRowDataBound="GridView2_RowDataBound" HeaderStyle-BackColor="lightblue">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Reason" SortExpression="reason" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="status" runat="server" Text='<%# Bind("status")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="parking_id" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="slot_id" runat="server" Text='<%# Bind("slot_id")%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="From Time" SortExpression="from_time">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="start_time" runat="server" Text='<%# Bind("start_time","{0:hh:mm tt}")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="To Time" SortExpression="to_time">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="end_time" runat="server" Text='<%# Bind("end_time","{0:hh:mm tt}")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>



                                                            <asp:TemplateField Visible="true" SortExpression="reason">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="reason" runat="server"></asp:Label>
                                                                    <asp:CheckBox ID="chk" runat="server" AutoPostBack="true" OnCheckedChanged="chk_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                   
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>


                                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label10" runat="server" Text="Name"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddl_name" runat="server" OnSelectedIndexChanged="ddl_name_SelectedIndexChanged" parsley-trigger="change" AutoPostBack="true" Height="32px" Width="200px"></asp:DropDownList>
                                                 
                                                    <br>
                                                    </br>
                            <asp:CompareValidator ControlToValidate="ddl_name" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Name" Font-Bold="true" Height="32px" Width="200px" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label13" runat="server" Text="Flat no"></asp:Label>
                                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_flat" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" AutoPostBack="true" placeholder="Enter Flat No" required autofocus></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel1" Visible="false" runat="server">
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_name" runat="server" Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter Name" required autofocus></asp:TextBox>

                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label1" runat="server" Text="Address"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_add" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" placeholder="Enter Address" required autofocus></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label25" runat="server" Text="Contact No:"></asp:Label>
                                                    <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_contact" runat="server" MaxLength="10" Height="32px" Width="200px" placeholder="Enter Mobile no" required autofocus></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_co_name" runat="server" TextMode="Date" Text="From Date :"></asp:Label>

                                                    <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_from_date" runat="server" TextMode="Date" Height="32px" Width="200px" placeholder="Enter Date" required autofocus></asp:TextBox>

                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label6" runat="server" TextMode="Date" Text="To Date:"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                  
                                                      <asp:TextBox ID="txt_to_date" runat="server" Height="32px" Width="200px" TextMode="Date" placeholder="Enter Date" OnTextChanged="txt_to_date_TextChanged" AutoPostBack="true" autofocus required></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                       
                                          </asp:Panel>
                                       <asp:Panel ID="Panel4" runat="server" Visible="false">
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label16" runat="server" TextMode="Date" Text="From Time"></asp:Label>
                                                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    
                                                     <asp:TextBox ID="from_time" runat="server" Height="32px" Width="200px" TextMode="Time" required></asp:TextBox>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label19" runat="server" TextMode="Date" Text="To Time"></asp:Label>
                                                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="to_time" runat="server" TextMode="Time" OnTextChanged="to_time_TextChanged" AutoPostBack="true" Height="32px" Width="200px" required autofocus></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                     


                                    <div class="form-group">
                                        <div class="row ">

                                            <div class="col-sm-2">
                                                <asp:Label ID="Label22" runat="server" Text="Charges"></asp:Label>
                                                <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_amount" runat="server" Height="50px" Width="200px" Enabled="false" TextMode="MultiLine"></asp:TextBox>

                                            </div>

                                            <div class="col-sm-2">
                                                <asp:Label ID="Label30" runat="server" Text="Note to Admin"></asp:Label>
                                                <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txt_note" runat="server" Height="50px" Width="200px" placeholder="Enter Note" TextMode="MultiLine"></asp:TextBox>

                                            </div>



                                        </div>
                                    </div>

                                    <div class="col-sm-2">
                                        <asp:CheckBox ID="society_in" Text="In Society" runat="server" Checked="true" AutoPostBack="true" OnCheckedChanged="society_in_CheckedChanged" />

                                    </div>
                                </ContentTemplate>
                                 </asp:UpdatePanel>
                           
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
        </div>
    </div>
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
</asp:Content>
