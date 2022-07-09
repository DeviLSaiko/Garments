<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GarmentsPro.Login" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script src="../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />
    <link href="../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../Assets/SweetAlert/sweetalert.min.js"></script>
    <style>
        body  {
             
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mt-5">
        </div>
        <div class="container">
             <div class="row p-5 mt-5"></div>
            <div class="row p-5 mt-5">
                <div class="col-md-4">
            </div>
                <div class="col-md-4">
                    </div>
                    <label>UserName</label>
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        ControlToValidate="txtUserName"
                        Text=" This Field Cannot be Empty"
                        ForeColor="red"
                        Font-Size="Small"
                        runat="server"></asp:RequiredFieldValidator>
                    <br />
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlToValidate="txtPassword"
                        Text=" This Field Cannot be Empty"
                        ForeColor="red"
                        Font-Size="Small"
                        runat="server"></asp:RequiredFieldValidator>
                    <br />
                    <div class="d-grid">
                        <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Login" CssClass="btn btn-dark" Width="207px" Height="39px" />
                    </div>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                     <a style="color:aliceblue" href="/Admin/AdminLogin.aspx">L</a>
                </div>
        </div>
    </form>
</body>
</html>
