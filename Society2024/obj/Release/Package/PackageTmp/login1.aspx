<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="login1.aspx.cs" Inherits="Society.login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <script src="script/rich-textarea-53.js" type="text/javascript"></script>
    <script src="script/isc_base.js" type="text/javascript"></script>

    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrap/js/bootstrap.js" />
    <link rel="stylesheet" href="bootstrap/js/bootstrap.min.js" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css" />
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css" />
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" />
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />
    <style type="text/css">
       /* .auto-style1 {
            margin-top: 6px;
        }
        .auto-style2 {
            width: 521px;
        }*/

    body {
       
        background-size: cover;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
    }

    .login-container {
        display: flex;
        background-color:antiquewhite;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-box {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        width: 400px;
        text-align: center;
    }

    .login-box h2 {
        margin-bottom: 30px;
        font-weight: bold;
    }

    .form-control {
        margin-bottom: 20px;
        height: 45px;
        font-size: 16px;
    }

    .login-box .btn {
        width: 100%;
        height: 45px;
        font-size: 18px;
    }

    .footer {
        position: fixed;
        bottom: 10px;
        width: 100%;
        text-align: center;
        color: white;
        font-size: 14px;
        text-shadow: 1px 1px 2px #000;
    }

</style>
             
    </head>
     
  <body>
      
  <form id="form1" runat="server" style="background-image: url('https://www.google.com/url?sa=i&url=https%3A%2F%2Fcoverr.co%2Fstock-video-footage%2Fsociety&psig=AOvVaw3CWCTSEA4BcJ_9xcRrhuFi&ust=1744964026762000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCNjs-t_P3owDFQAAAAAdAAAAABAE')">
    <div class="login-container" style="background-image: url('https://localhost:44309/shibuya.jpg'); background-color: #C0C0C0;">
         <asp:HiddenField ID="user_id" runat="server" />
        <div class="login-box">
            <h2>Society Management System</h2>

            <asp:TextBox runat="server" CssClass="form-control" ID="txt_Username" width="300px" placeholder="Enter Username"></asp:TextBox>
            <asp:TextBox runat="server" CssClass="form-control" ID="txt_password" width ="300px" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <asp:TextBox ID="txt_otp" runat="server" placeholder="OTP" Visible="false" CssClass="form-control"></asp:TextBox>

            <asp:Button runat="server" ID="btn_Login" CssClass="btn btn-success" width="300px" Text="Login" OnClick="btn_Login_Click" />
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="btn btn-primary" width="300px" OnClick="Button1_Click" />

            <br /><br />
            <asp:HyperLink ID="forgot_password" runat="server" NavigateUrl="~/forgot_password.aspx">Forgot Password?</asp:HyperLink>

            <br /><br />
            <asp:Label ID="lbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        </div>
    </div>
</form>
       </body>

  

<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- InputMask -->
<script src="js/jquery.inputmask.js"></script>
<script src="js/jquery.inputmask.date.extensions.js"></script>
<script src="js/jquery.inputmask.extensions.js"></script>
<script src="js/jquery.inputmask.numeric.extensions.js"></script>

<!-- Page script -->
<script>
    $(function () {

        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
        //Money Euro
        $("[data-mask]").inputmask();


    });
</script>




<script type="text/javascript">
    var message = "Function Disabled!";

    function clickIE4() {
        if (event.button == 2) {

            return false;
        }
    }

    function clickNS4(e) {
        if (document.layers || document.getElementById && !document.all) {
            if (e.which == 2 || e.which == 3) {
                return false;
            }
        }
    }
    if (document.layers) {
        document.captureEvents(Event.MOUSEDOWN);
        document.onmousedown = clickNS4;
    }
    else if (document.all && !document.getElementById) {
        document.onmousedown = clickIE4;
    }
    document.oncontextmenu = new Function("return false")
</script>

<script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-64913771-1', 'auto');
    ga('send', 'pageview');

</script>
</html>
<footer class="index-footer">
    <center>
        <strong>Integrasol Software Consultancy.</strong> All rights reserved.
    </center>
</footer>
