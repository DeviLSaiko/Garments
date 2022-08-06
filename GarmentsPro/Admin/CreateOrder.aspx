<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="GarmentsPro.Admin.CreateOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Create New Order</title>
    <script>
        $(document).ready(function () {
            var url = window.location;
            $('.navbar .nav').find('.active').removeClass('active');
            $('.navbar collapse li a').each(function () {
                if (this.href == url) {
                    $(this).parent().addClass('active');
                }
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <div class="container mt-3 bg-white p-3 rounded-3   shadow-sm" style="font-size: small">
                <div class="pagetitle">
                    <h4>Create New Order</h4>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a style="text-decoration: none;" href="Orders.aspx">Orders</a></li>
                            <li class="breadcrumb-item active">CreateOrder</li>
                        </ol>
                    </nav>
                </div>
                <div class="row ">
                    <div class="col-md-4">
                        <label>Clinet Name</label>
                        <asp:TextBox ID="txtClinet" CssClass="form-control" Font-Size="Small" runat="server" Height="34px" Width="270px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            ControlToValidate="txtClinet"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-4">
                        <label>Type</label>
                        <asp:DropDownList ID="ddType" Font-Size="Small" CssClass="form-select" Height="34px" Width="270px" runat="server">
                            <asp:ListItem Text="-- Select --"></asp:ListItem>
                            <asp:ListItem Text="Sweater" Value="Sweater"></asp:ListItem>
                            <asp:ListItem Text="T-shirt" Value="T-shirt"></asp:ListItem>
                            <asp:ListItem Text="Shorts" Value="Shorts"></asp:ListItem>
                            <asp:ListItem Text="Leather jackets" Value="Leather jackets"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            ControlToValidate="ddType"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="10px"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-4">
                        <label>Quantity</label>
                        <asp:TextBox ID="txtQty" CssClass="form-control" runat="server" Font-Size="Small" Height="34px" Width="270px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            ControlToValidate="txtQty"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label>Deadline Time</label>
                        <asp:TextBox ID="txtETA" TextMode="Date" CssClass="form-control" Font-Size="Small" runat="server" Height="34px" Width="270px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            ControlToValidate="txtETA"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-4  mb-1">
                        <div>
                            <label>Status</label>
                            <asp:DropDownList ID="DdStatus" CssClass="form-select" Font-Size="Small" Height="34px" Width="270px" runat="server">
                                <asp:ListItem Text="Created" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                ControlToValidate="DdStatus"
                                Text=" This Field Cannot be Empty"
                                ForeColor="red"
                                Font-Size="Small"
                                runat="server"></asp:RequiredFieldValidator>
                            <br />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click1" Font-Size="Small" Text="Create New Order" CssClass="btn btn-dark mb-4 " Width="207px" Height="39px" />
                    </div>
                </div>
            </div>
            <div class="container bg-white ps-4 pe-4 pb-3 rounded-3 pt-3  mt-3  shadow-sm">
                <h6>Recent Orders</h6>
                <div class="row mt-3">
                    <div class="col-sm-12">
                        <asp:GridView ID="GridView1" CssClass=" table mt-1" AutoGenerateColumns="false" runat="server">
                            <Columns>
                                <asp:BoundField DataField="OID" HeaderText="ID" />
                                <asp:BoundField DataField="OrderID" HeaderText="OrderID" />
                                <asp:BoundField DataField="ClientName" HeaderText="ClientName" />
                                <asp:BoundField DataField="OrderType" HeaderText="OrderType" />
                                <asp:BoundField DataField="Qty" HeaderText="Qty" />
                                <asp:BoundField DataField="ETA_Time" HeaderText="ETA_Time" />
                                <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                        <asp:Label runat="server" ID="txtError" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
