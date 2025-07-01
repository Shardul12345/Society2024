<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_registration.aspx.cs" Inherits="Society.new_registration" MasterPageFile="~/Site.Master" %>

<%--<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">--%>
<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type='text/javascript'>

        function digit(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode < 48 || charCode > 57) {
                return false;
            }
            return true;
        }
        function checkLength(el) {

            if (el.value.length != 10) {

                alert("length must be exactly 10 digits")

                return false;
            }
        }
    </script>
    <div>
        <%--<asp:ScriptManager runat="server">
                    <Scripts>--%>
        <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
        <%--Framework Scripts--%>
        <%-- <asp:ScriptReference Name="MsAjaxBundle" />
                        <asp:ScriptReference Name="jquery" />
                        <asp:ScriptReference Name="bootstrap" />
                        <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                        <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                        <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                        <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                        <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                        <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                        <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                        <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                        <asp:ScriptReference Name="WebFormsBundle" />--%>

        <%--Site Scripts--%>
        <%--  </Scripts>
                </asp:ScriptManager>--%>

        <h2 class="bg-primary text-white">
            <center>New Registration</center>
        </h2>

        <asp:Panel ID="Panel3" runat="server" BorderStyle="Solid" Style="margin-left: 464px;" BorderWidth="2px" Width="607px" Height="520px">
            <div class="box box-primary" style="width: 913px">
                <div id="personal_info" class="container-fluid" style="width: 133%">
                    <%-- <div class="box-header with-border">
                        <h2 class="box-title">New Registration</h2>
                    </div>--%>
                    <asp:HiddenField ID="UserLoginId" runat="server" />
                    <asp:HiddenField ID="society_id" runat="server" />


                    <br />

                    <div class="box-body">

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <asp:Label ID="lbl_co_name" runat="server" Text="Name"></asp:Label>
                                    <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_Name" runat="server" Style="text-transform: capitalize;" placeholder="Enter  Name" required autofocus></asp:TextBox>

                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label>
                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_Address" runat="server" Style="text-transform: capitalize;" placeholder="Enter Address" required autofocus></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <asp:Label ID="lbl_pre_mob" runat="server" Text="Contact No."></asp:Label>
                                    <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_Mobile" runat="server" MaxLength="10" onblur="checkLength(this)" onkeypress="return digit(event);" placeholder="Enter Contact No." AutoPostBack="true" required> </asp:TextBox>
                                    <asp:Button ID="btn_verify1" runat="server" Text="Verify" OnClick="btn_verify1_Click" UseSubmitBehavior="False" />
                                    <br />
                                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_Mobile" ErrorMessage="Numbers Only" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>--%>

                                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                                        <br />
                                        <asp:TextBox ID="Contact_OTP" runat="server" placeholder="Enter Verify OTP"></asp:TextBox>
                                        <asp:LinkButton ID="LinkButton1" runat="server">Resend OTP</asp:LinkButton>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <asp:Label ID="lbl_mob" runat="server" Text="E-mail ID"></asp:Label>
                                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>



                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_Emailid" placeholder="Enter Email" runat="server" OnTextChanged="txt_Emailid_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                    <asp:Button ID="btn_verify2" runat="server" Text="Verify" OnClick="btn_verify2_Click" UseSubmitBehavior="False" />

                                    <asp:Label ID="Label10" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>

                                    <br />
                                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" Font-Bold="True" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_Emailid" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>

                                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                                        <br />
                                        <asp:TextBox ID="Email_OTP" runat="server" placeholder="Enter Verify OTP"></asp:TextBox>
                                        <asp:LinkButton ID="LinkButton2" runat="server">Resend OTP</asp:LinkButton>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_user" runat="server" placeholder="Enter Username" required autofocus Enabled="false"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_new_pass" runat="server" TextMode="Password" placeholder="Enter Password" required autofocus></asp:TextBox>


                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <asp:Label ID="Label13" runat="server" Text=" Re-Enter Password"></asp:Label>
                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_re_password" TextMode="Password" runat="server" placeholder="Enter Re-Enter Password" required></asp:TextBox>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                                        ControlToCompare="txt_new_pass" ControlToValidate="txt_re_password"
                                        ErrorMessage="*Password Not Match" ForeColor="Red"></asp:CompareValidator>
                                </div>

                            </div>
                        </div>




                        <%--<div class="box box-primary">
                    <div class="box-body">--%>
                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-4">
                                    <asp:Button ID="btn_save" runat="server" Text="Register" class="btn btn-primary" OnClick="btn_save_Click"></asp:Button>
                                    <%-- <asp:Button ID="btn_delete" runat="server" Text="Reset" class="btn btn-primary" OnClick="btn_delete_Click"  />
                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click"   />--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
                <!-- Bootstrap 3.3.6 -->
                <script src="bootstrap/js/bootstrap.min.js"></script>
                <!-- FastClick -->
                <script src="plugins/fastclick/fastclick.js"></script>
                <!-- AdminLTE App -->
                <script src="dist/js/app.min.js"></script>
                <!-- Sparkline -->
                <script src="plugins/sparkline/jquery.sparkline.min.js"></script>
                <!-- jvectormap -->
                <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
                <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
                <!-- SlimScroll 1.3.0 -->
                <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
                <!-- ChartJS 1.0.1 -->
                <script src="plugins/chartjs/Chart.min.js"></script>
                <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
                <script src="dist/js/pages/dashboard2.js"></script>
                <!-- AdminLTE for demo purposes -->
                <script src="dist/js/demo.js"></script>--%>
    </div>
    </asp:Panel>
     
</asp:Content>

