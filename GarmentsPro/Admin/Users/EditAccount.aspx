<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditAccount.aspx.cs" Inherits="GarmentsPro.Admin.Users.EditAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager ID="scriptmanager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="updatepnl" runat="server">
            <ContentTemplate>
                <div class="container mt-5">
                    <div class="row">
 
                        <div class="col-md-6">
                            <h2>Delete</h2>
                            <div class="align-content-center">
                                <table>
                                    <asp:GridView ID="GridView1" CssClass="table" AutoGenerateColumns="false" runat="server">
                                        <Columns>
                                            <asp:BoundField DataField="UID" HeaderText="ID" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="Username" HeaderText="Username" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="Password" HeaderText="Password" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="Department" HeaderText="Department" HeaderStyle-BackColor="WhiteSmoke" />
                                        </Columns>
                                    </asp:GridView>
                                </table>
                            </div>
                            <span>
                                <tr>
                                    <td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <!-- The Modal -->
                                            <button type="button" class="btn btn-danger" runat="server" id="btnModal" data-bs-toggle="modal" data-bs-target="#myModal">
                                                Delete User
  
                                            </button>

                                            <div class="modal" id="myModal"> 
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <!-- Modal Header -->


                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Confirm</h4>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                        </div>


                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                            <center>
                         
              <h6>Do You Want To Delete This User ?</h6>
          </center>
                                                        </div>
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer">
                                                            <asp:Button ID="BtnDel" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="BtnDel_Click1" Width="79px"></asp:Button>
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- The Modal -->
                                        </td>
                                        <td></td>
                                </tr>
                            </span>
                        </div>

                    </div>

                </div>
                <br />

                <div class="container">
                    <h2>Update</h2>
                    <div class="row">
                        <div class="col-md-4">

                            <label>Name</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                ControlToValidate="txtName"
                                Text=" This Field Cannot be Empty"
                                ForeColor="red"
                                Font-Size="Small"
                                runat="server"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="col-md-4 ">
                            <label>UserName</label>
                            <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                ControlToValidate="txtUserName"
                                Text=" This Field Cannot be Empty"
                                ForeColor="red"
                                Font-Size="Small"
                                runat="server"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="col-md-4">
                            <label>Department</label>
                            <asp:DropDownList ID="ddDepartments" CssClass="form-select" Height="35px" Width="288px" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                ControlToValidate="ddDepartments"
                                Text=" This Field Cannot be Empty"
                                ForeColor="red"
                                Font-Size="Small"
                                runat="server"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                ControlToValidate="txtPassword"
                                Text=" This Field Cannot be Empty"
                                ForeColor="red"
                                Font-Size="Small"
                                runat="server"></asp:RequiredFieldValidator>
                            <br />
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Update Details" CssClass="btn btn-dark" Width="207px" Height="39px" />
                        </div>
                    </div>
                    <div class="d-grid">
                    </div>
                </div>
                </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>




</asp:Content>
