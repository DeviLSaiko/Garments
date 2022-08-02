<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="GarmentsPro.Admin.EditOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />
    <link href="../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../Assets/SweetAlert/sweetalert.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .modal {
            text-align: center;
            padding: 0 !important;
        }

            .modal:before {
                vertical-align: middle;
            }

        body {
            background-color: #f4f4f4;
            font-size: small;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
             <div class="pagetitle mt-1">
              <h4>Edit Order</h4
            <nav>
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a  style="text-decoration:none;"  href="Orders.aspx">Home</a></li>
                  <li class="breadcrumb-item "><a  style="text-decoration:none;"  href="Orders.aspx">Orders</a></li>
                   <li class="breadcrumb-item active">Edit Order</li>
                    <li class="breadcrumb-item active">  <asp:Label ID="lblWelcome" ForeColor="Black" runat="server" Text=""></asp:Label>  </li>
               </ol>
            </nav>
         </div>
            <div class="container mt-3 bg-white card-body shadow-sm border-5">
                <h2>Update</h2>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <label>OrderID</label>
                        <asp:TextBox ID="txtOrderID" CssClass="form-control  " disabled="true" runat="server" Height="35px" Width="288px"></asp:TextBox>

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
                        <label>Deadline Date</label>
                        <asp:TextBox ID="txtETA" TextMode="Date" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                        <br />
                    </div>
                    <div class="col-md-4  mb-2">
                        <div>
                            <label>Status</label>
                            <asp:DropDownList ID="DdStatus" CssClass="form-select" Height="35px" Width="288px" runat="server">
                                <asp:ListItem Text="-- Select --"></asp:ListItem>
                                <asp:ListItem Text="Created" Value="1"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Cancelled" Value="5"></asp:ListItem>
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
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div style="margin-left: 20px">
                        <asp:Button ID="Button1" runat="server" OnClick="BtnCreate_Click" Text="Update Details" CssClass="btn btn-sm btn-secondary " />
                        <button type="button" class="btn btn-danger btn-sm" runat="server" id="btnModal" data-bs-toggle="modal" data-bs-target="#myModal">Delete</button>
                    </div>
                </div>
                <br />
            </div>
            <div class="container bg-white mt-3 border-5 shadow-sm">
                <div class="row p-2">
                    <div class="col-md-10">
                        <h5>Order Info</h5>
                        <center>

                                <div class="align-content-center">
                                <table>
                                    <asp:GridView ID="GridView1" CssClass="table ps-4 ms-5"   AutoGenerateColumns="false" runat="server">
                                        <Columns>
                                            <asp:BoundField DataField="OrderID"  HeaderText="Order ID"  />
                                            <asp:BoundField DataField="ClientName"  HeaderText="Client Name"  />
                                            <asp:BoundField DataField="OrderType" HeaderText="Order Type"  />
                                            <asp:BoundField DataField="Qty" HeaderText="Qty"  />
                                            <asp:BoundField DataField="ETA_Time" HeaderText="Deadline"  />
                                            <asp:BoundField DataField="Status" HeaderText="Status"  />
                                            <asp:BoundField DataField="Created_Date" HeaderText="Created On"  />
                                            
                                        </Columns>
                                    </asp:GridView>
                                </table>
                            </div>
                            </center>

                        <span>
                            <tr>
                                <td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <!-- The Modal  Start-->

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
                                                        <asp:Button ID="BtnDel" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="BtnDel_Click1" Width="79px"></asp:Button>
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
