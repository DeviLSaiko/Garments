<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="GarmentsPro.Admin.Orders.CreateOrder" %>
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

   
        <div class="container mt-5">
             <h2>Create New Order</h2>
            <div class="row ">

                <div class="col-md-4">
                    <label>OrderID</label>
                    <asp:TextBox ID="txtOrderID" CssClass="form-control"  runat="server" TextMode="DateTimeLocal"   Height="35px" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        ControlToValidate="txtOrderID"
                        Text=" This Field Cannot be Empty"
                        ForeColor="red"
                        Font-Size="Small"
                        runat="server"></asp:RequiredFieldValidator>
                    <br />
                </div>
                <div class="col-md-4">
                    <label>Clinet Name</label>
                    <asp:TextBox ID="txtClinet" CssClass="form-control" runat="server"  Height="35px" Width="288px"></asp:TextBox>
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
                    <asp:DropDownList ID="ddType" CssClass="form-select" Height="35px" Width="288px" runat="server">
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
                        Font-Size="Small"
                        runat="server"></asp:RequiredFieldValidator>
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <label>Quantity</label>
                    <asp:TextBox ID="txtQty" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlToValidate="txtQty"
                        Text=" This Field Cannot be Empty"
                        ForeColor="red"
                        Font-Size="Small"
                        runat="server"></asp:RequiredFieldValidator>
                    <br />
                </div>
                <div class="col-md-4">
                    <label> Deadline Time</label>
                    <asp:TextBox ID="txtETA" TextMode="DateTimeLocal" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        ControlToValidate="txtETA"
                        Text=" This Field Cannot be Empty"
                        ForeColor="red"
                        Font-Size="Small"
                        runat="server"></asp:RequiredFieldValidator>
                    <br />
                </div>
                <div class="col-md-4  mb-2">
                    <div>

                        <label>Status</label>
                        <asp:DropDownList ID="DdStatus" CssClass="form-select" Height="35px" Width="288px" runat="server">
                            <asp:ListItem Text="Created"></asp:ListItem>
                            
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
                    <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click1" Text="Create New Order" CssClass="btn btn-success " Width="207px" Height="39px" />
                </div>
            </div>
            <center>
            <h3>Privious Orders</h3>

        </center>

            <div class="row mt-5">
                <div class="col-sm-12">
                   <asp:GridView ID="GridView1" CssClass=" table table-hover"  AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="OID"   HeaderText="ID" />
                                    <asp:BoundField DataField="OrderID"   HeaderText="OrderID" />
                                     <asp:BoundField DataField="ClientName"   HeaderText="ClientName" />
                                    <asp:BoundField DataField="OrderType"   HeaderText="OrderType" />
                                     <asp:BoundField DataField="Qty"   HeaderText="Qty" />
                                    <asp:BoundField DataField="ETA_Time" HeaderText="ETA_Time" />
                                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" />
                                     <asp:BoundField DataField="Status" HeaderText="Status" />
            
                                   
     </Columns>
     </asp:GridView>
                     <asp:Label runat="server" id="txtError" Text=""></asp:Label> 
                </div>
            </div>
        </div>
    </ContentTemplate>  
</asp:UpdatePanel> 



</asp:Content>
