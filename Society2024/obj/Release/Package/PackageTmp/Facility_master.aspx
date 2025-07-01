﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Facility_master.aspx.cs" Inherits="Society2024.Facility_master" MasterPageFile="~/Site.Master" %>

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


        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
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
                                <center>Facilities</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="facility_id" runat="server" />

                <asp:HiddenField ID="slot_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>

                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                           <div class="d-flex align-items-center">

                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="name">Facility Name</asp:ListItem>
                                <asp:ListItem Value="cost">Cost of Facility</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp;
                      
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Width="200px" Height="32px" Font-Bold="true" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                        
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" Text="Search" OnClick="btn_search_Click" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>

                        </div>
                      </div>
                    </div>
                </div>


                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%#  Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Facility Name" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label ID="facility_name" runat="server" Text='<%# Bind("name")%>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cost of Facility" SortExpression="cost">
                                            <ItemTemplate>
                                                <asp:Label ID="facility_cost" runat="server" Text='<%# Eval("cost")  %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50" >
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("facility_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
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
                    <div class="modal-dialog modal-sm-6">
                        <div class="modal-content" style="height: auto; width: 900px;">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Facilities</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">
                                <form id="owner-socity-add" action="" method="post">

                                    <div class="form-group">
                                        <div class="alert alert-danger danger" style="display: none;"></div>
                                    </div>
                                    


                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label1" runat="server" Text="Facility Name"></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_facility" runat="server" Height="32px" Width="200px" placeholder="Enter Facility Name" required autofocus></asp:TextBox>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_co_name" runat="server" Text="Cost of Facility"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_cost" runat="server" Height="32px" Width="200px" placeholder="Enter Facility Cost" required autofocus></asp:TextBox>

                                                        <%--                        <asp:CalendarExtender ID="txt_from_dt_CalendarExtender" runat="server" Enabled="True" TargetControlID="txt_date" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="form-group">
                                                <div class="row ">


                                                    <div class="col-sm-3">
                                                        <asp:Label ID="txt_slot" runat="server" Text="Slots"></asp:Label>
                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>

                                                    <div class="col-sm-3">

                                                        <asp:RadioButton ID="radiobtn1" runat="server" Checked="true" Text="Day" OnCheckedChanged="radiobtn1_CheckedChanged" AutoPostBack="true" GroupName="led_status"></asp:RadioButton>
                                                        <asp:RadioButton ID="radiobtn3" runat="server" Text="Hour" OnCheckedChanged="radiobtn3_CheckedChanged" AutoPostBack="true" GroupName="led_status"></asp:RadioButton>
                                                        <asp:RadioButton ID="radiobtn2" runat="server" Text="Slot" OnCheckedChanged="radiobtn2_CheckedChanged" AutoPostBack="true" GroupName="led_status"></asp:RadioButton>
                                                         
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label7" runat="server" Text=" Description"></asp:Label>
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                     

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_desc" runat="server" Height="50px" placeholder="Enter Description" Width="200px" TextMode="MultiLine" ></asp:TextBox>

                                                        <%--<asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txt_valid_to" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                    </div>
                                                </div>
                                            </div>
                                              
                                            <asp:Panel ID="panel1" runat="server" Visible="false">
                                                <div class="form-group">
                                                    <div class="row ">
                                                        <div class="col-sm-3">
                                                            <asp:Label ID="Label5" runat="server" Text="Start Time"></asp:Label>
                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                           
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:TextBox ID="txt_from" runat="server" Height="32px" Width="200px" TextMode="Time" ></asp:TextBox>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <asp:Label ID="Label11" runat="server" Text="End Time"></asp:Label>
                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                           
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:TextBox ID="txt_to" runat="server" Height="32px" Width="200px" TextMode="Time"></asp:TextBox>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class ="text-center">
                                                <asp:Button ID="btn_add" runat="server" Text="Add Slot" class="btn btn-primary" OnClick="btn_add_Click" />

                                                    </div><br />
                                            </asp:Panel>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-12">
                                                        <div style="width: 100%; overflow: auto;">
                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" OnRowDeleting="GridView2_RowDeleting" OnRowUpdating="GridView2_RowUpdating" EmptyDataText="No Record Found">

                                                                <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Slot" ItemStyle-Width="50">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="meet_id" ItemStyle-Width="200"   Visible="false" >
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="slot_id" runat="server" Text='<%# Bind("slot_id")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Start" ItemStyle-Width="400">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="start_time" runat="server" Text='<%# Bind("start_time")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="End" ItemStyle-Width="400">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="end_time" runat="server" Text='<%# Bind("end_time")%>'></asp:Label>
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



                                    

                                </form>
                            </div>

                            <div class="modal-footer">

                                <div class="form-group">
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure want to delete?');" class="btn btn-primary" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" OnClick="btn_close_Click" class="btn btn-primary" UseSubmitBehavior="False" />
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
    <%--  --%>


    <br />
    <br />
    <br />
    <br />
    <br />
    <br />


</asp:Content>

