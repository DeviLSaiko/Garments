<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="Garments_Pro.Orders.CreateOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New Order</title>
 
    <script src="../../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />
    <link href="../../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../../Assets/SweetAlert/sweetalert.min.js"></script>


</head>
<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">

            <a class="navbar-brand" href="../Admin.aspx">GarmentPro</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
               <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link " href="../Admin/Admin.aspx">DashBoard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Admin/CreateAccount.aspx">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="../Orders/CreateOrder.aspx"> Create Order</a>
                    </li>

                </ul>

            </div>
        </div>
    </nav>
    <!-- Header -->
    <form id="form1" runat="server">
         <asp:ScriptManager ID="scriptmanager1" runat="server">  
</asp:ScriptManager> 
       <asp:UpdatePanel ID="updatepnl" runat="server">  
<ContentTemplate>  
        <div class="container mt-5">
            <div class="row ">

                <div class="col-md-4">
                    <label>OrderID</label>
                    <asp:TextBox ID="txtOrderID" CssClass="form-control"  runat="server" TextMode="Date" Height="35px" Width="288px"></asp:TextBox>
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
                    <label>ETA Complete Time</label>
                    <asp:TextBox ID="txtETA" TextMode="Date" CssClass="form-control" runat="server" Height="35px" Width="288px"></asp:TextBox>
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
                            <asp:ListItem Text="-- Select --"></asp:ListItem>
                            <asp:ListItem Text="On Progress" Value="Current"></asp:ListItem>
                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                            <asp:ListItem Text="Finished" Value="Finished"></asp:ListItem>
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
                    <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Create New Order" CssClass="btn btn-success " Width="207px" Height="39px" />
                </div>
            </div>
            <center>
            <h4>Orders</h4>

        </center>

            <div class="row">
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
             <asp:TemplateField HeaderText="Modify" ControlStyle-CssClass="btn btn-dark" >
     <ItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/Orders/Modify_Order.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OID").ToString()))%>'>Modify</asp:HyperLink>
     </ItemTemplate>
      </asp:TemplateField>  
                                   
     </Columns>
     </asp:GridView>
                     <asp:Label runat="server" id="txtError" Text=""></asp:Label> 
                </div>
            </div>
        </div>
    </ContentTemplate>  
</asp:UpdatePanel> 
    </form>
</body>
</html>
