<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="Garments_Pro.Orders.OrderList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders</title>
    <script src="../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />

    <link href="../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../Assets/SweetAlert/sweetalert.min.js"></script>
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
                        <a class="nav-link  " href="../Admin/Admin.aspx">DashBoard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CreateAccount.aspx"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  " href="CreateOrder.aspx">Create New Order </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active " href="OrderList.aspx">Orders</a>
                    </li>

                </ul>

            </div>
        </div>
    </nav>
    <!-- Header -->

    <div class="container mt-3">
        <h3>Manage Orders</h3>
    </div>
    <br />
    <form id="form2" runat="server">
        <center>
            <div class="container">
       <div class="row">
           <div class="col-sm-12" >
        
        <div class="align-content-center">  
             <table class="table-hover     ">
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
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Orders/Modify_Order.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OID").ToString()))%>'>Modify</asp:HyperLink>
     </ItemTemplate>
      </asp:TemplateField>   
     </Columns>
     </asp:GridView>
                </table>
            </div>
             
           </div>
            </div>
           </div>
                 
          </center>
        <center>
        <div>
            <asp:Label ID="txtError" runat="server" Text=""></asp:Label>
       </div>
      </center>

        <div>
        </div>

    </form>
</body>
</html>
