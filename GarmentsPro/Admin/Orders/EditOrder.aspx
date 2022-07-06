<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="GarmentsPro.Admin.Orders.EditOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />
    <link href="../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../Assets/SweetAlert/sweetalert.min.js"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="scriptmanager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="updatepnl" runat="server">
            <ContentTemplate>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-8">
                            <h2>Delete</h2>
                            <div class="align-content-center">
                                <table>
                                    <asp:GridView ID="GridView1" CssClass="table" AutoGenerateColumns="false" runat="server">
                                        <Columns>
                                            <asp:BoundField DataField="OrderID" HeaderText="Order ID" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="ClientName" HeaderText="Client Name" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="OrderType" HeaderText="Order Type" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="Qty" HeaderText="Qty" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="ETA_Time" HeaderText="ETA_Time" HeaderStyle-BackColor="WhiteSmoke" />
                                            <asp:BoundField DataField="Status" HeaderText="Status" HeaderStyle-BackColor="WhiteSmoke" />
                                            
                                        </Columns>
                                    </asp:GridView>
                                </table>
                            </div>
                            <span>
                                <tr>
                                    <td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <!-- The Modal  Start-->
                                            <button type="button" class="btn btn-danger" runat="server" id="btnModal" data-bs-toggle="modal" data-bs-target="#myModal">
                                               Delete  
                                   
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
                                                                            <h6>Do You Want To Delete This Order ?</h6>
                                                                        </center>
                                                        </div>
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer">
                                                            <asp:Button ID="BtnDel" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick= "BtnDel_Click1" Width="79px"></asp:Button>
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- The Modal End -->
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
                            <label>OrderID</label>
                            <asp:TextBox ID="txtOrderID" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>

                            <br />
                        </div>
                        <div class="col-md-4">
                            <label>Clinet Name</label>
                            <asp:TextBox ID="txtClinet" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                ControlToValidate="txtClinet"
                                Text=" This Field Cannot be Empty"
                                ForeColor="red"
                                Font-Size="Small"
                                runat="server"></asp:RequiredFieldValidator>
                            <br />
                        </div>
                        <div class="col-md-4">
                            <label>Type</label>
                            <asp:DropDownList ID="ddType" CssClass="form-select" Height="35px" Width="288px" runat="server">
                                <asp:ListItem Text="-- Select --"></asp:ListItem>
                                <asp:ListItem Text="Sweater" Value="Sweater"></asp:ListItem>
                                <asp:ListItem Text="T-shirt" Value="T-shirt"></asp:ListItem>
                                <asp:ListItem Text="Shorts" Value="Shorts"></asp:ListItem>
                                <asp:ListItem Text="Leather jackets" Value="Leather jackets"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                ControlToValidate="ddType"
                                Text=" This Field Cannot be Empty"
                                ForeColor="red"
                                Font-Size="Small"
                                runat="server"></asp:RequiredFieldValidator>
                            <br />
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-4">
                            <label>Quantity</label>
                            <asp:TextBox ID="txtQty" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                                ControlToValidate="txtQty"
                                Text=" This Field Cannot be Empty"
                                ForeColor="red"
                                Font-Size="Small"
                                runat="server"></asp:RequiredFieldValidator>
                            <br />
                        </div>
                        <div class="col-md-4">
                            <label>ETA Complete Time</label>
                            <asp:TextBox ID="txtETA" TextMode="Date" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                            <br />
                        </div>
                        <div class="col-md-4  mb-2">
                            <div>
                                <label>Status</label>
                                <asp:DropDownList ID="DdStatus" CssClass="form-select" Height="35px" Width="288px" runat="server">
                                    <asp:ListItem Text="-- Select --"></asp:ListItem>
                                    <asp:ListItem Text="Current" Value="Current"></asp:ListItem>
                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                    <asp:ListItem Text="Finished" Value="Finished"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                                    ControlToValidate="DdStatus"
                                    Text=" This Field Cannot be Empty"
                                    ForeColor="red"
                                    Font-Size="Small"
                                    runat="server"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="Button1" runat="server" OnClick="BtnCreate_Click" Text="Update Details" CssClass="btn btn-dark" Width="207px" Height="39px" />
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
