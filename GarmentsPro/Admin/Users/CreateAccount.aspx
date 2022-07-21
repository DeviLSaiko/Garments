<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="GarmentsPro.Admin.Users.CreateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Create New Account</title>
    <link href="../../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../../Assets/SweetAlert/sweetalert.min.js"></script>
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <div class="mt-5">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <label>Name</label>
                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server" Height="35px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            ControlToValidate="txtName"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                        <label>UserName</label>
                        <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" Height="35px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            ControlToValidate="txtUserName"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                        <label>Department</label>
                        <asp:DropDownList ID="ddDepartments" CssClass="form-select" Height="35px" Width="300px" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            ControlToValidate="ddDepartments"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                        <label>Password</label>
                        <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" Height="35px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            ControlToValidate="txtPassword"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                        <div class="d-grid">
                            <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Create New Account" CssClass="btn btn-dark" Width="207px" Height="39px" />
                        </div>
                    </div>
                    <div class="col-md-8">

                        <table class="table-hover     ">
                            <asp:GridView ID="GridView1" HeaderStyle-BackColor="#808080" HeaderStyle-ForeColor="White" CssClass=" table  " AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="UID" HeaderText="ID" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                    <asp:BoundField DataField="Username" HeaderText="Username" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" />
                                    <asp:BoundField DataField="Department" HeaderText="Department" />
                                    <asp:TemplateField HeaderText="Modify" ControlStyle-CssClass="btn btn-dark btn-sm">
                                        <ItemTemplate>
                                            <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/Users/EditAccount.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("UID").ToString()))%>'>Modify</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
