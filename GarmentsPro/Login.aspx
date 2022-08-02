<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GarmentsPro.Login" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <script src="../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />
    <link href="../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../Assets/SweetAlert/sweetalert.min.js"></script>
    <style>
        body {
            background-color:   whitesmoke;
            
        }
        .MyCon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            background: #ffffff;
            width: 360px;
            padding: 30px;
            box-shadow: rgb(255, 0, 0) 10px, 3px,10px, 10px,rgb(255, 0, 0) 10px, 3px,10px, 10px;
        }
    </style>
    <script type="text/javascript">
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=Label1.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="MyCon shadow">
            <center>
                 <h4 style="text-align: center">Login Your Account</h4>
            <p>Enter your username & password</p>
            </center>
           
            <label>UserName</label>
            <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                ControlToValidate="txtUserName"
                Text="Username is Required"
                ForeColor="red"
                Font-Size="Small"
                runat="server"></asp:RequiredFieldValidator>
            <br />
            <label>Password</label>
            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                ControlToValidate="txtPassword"
                Text="You Need to Enter the Password"
                ForeColor="red"
                Font-Size="Small"
                runat="server"></asp:RequiredFieldValidator>
            <br />
            <div class="d-grid mt-2">
                <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Login" CssClass="btn btn-secondary ms-3 " Width="250px" Height="39px" />
                <asp:Label ID="Label1" runat="server" CssClass="mt-3 ms-3" ForeColor="#ff6600" Text="Invalid Username or Password" Visible="false"></asp:Label>
                <div class="d-block mt-3">
                    <asp:Label ID="lblForget" runat="server" CssClass="mt-3 ms-3" Text="Forget Password ?"> </asp:Label>
                    <a style="text-decoration: dotted;" href="#">Contact Admin</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
