<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Garments_Pro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />
    <link href="../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../Assets/SweetAlert/sweetalert.min.js"></script>
    <style>
        body {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mt-5">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <label>UserName</label>
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        ControlToValidate="txtUserName"
                        Text=" This Field Cannot be Empty"
                        ForeColor="red"
                        Font-Size="Small"
                        runat="server"></asp:RequiredFieldValidator>
                    <br />
                    <label>Department</label>
                    <asp:DropDownList ID="ddDepartments" CssClass="form-select" Height="35px" Width="288px" runat="server"></asp:DropDownList>
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

                        <asp:Label CssClass="text-danger" ID="lblError" runat="server" Text=""></asp:Label>

                        <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Login" CssClass="btn btn-dark" Width="207px" Height="39px" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
