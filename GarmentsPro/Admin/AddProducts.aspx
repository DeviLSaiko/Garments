<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="GarmentsPro.Admin.AddProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container mt-3">
                <h2>Add New Product</h2>
            
                    <div class="card   mb-3" style="max-width: 22rem;">



  
  <div class="card-body ">
      <div class="card-title bg-transparent">Order Summary</div>
   
          <div class="row">
                    <div class="col-md-4">
                        <label>Product Name</label>
                        <asp:TextBox ID="txtClinet" CssClass="form-control" runat="server"    ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            ControlToValidate="txtClinet"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                         <label>Product Category</label>
                        <asp:DropDownList ID="ddType" CssClass="form-select"  runat="server">
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
                        <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Create New Order" CssClass="btn btn-success "   />
                    </div>

  </div>
  <div class="card-footer bg-transparent  ">Footer</div>
</div>
                     
                       
                <div class="row mt-5">
                    <div class="col-sm-12">
                        <div style="text-align: right; font-size: smaller;">
                            <asp:HyperLink ID="viewAll" NavigateUrl="~/Admin/Orders/Orders.aspx" runat="server">View All Orders</asp:HyperLink>

                        </div>
                        <asp:GridView ID="GridView1" CssClass=" table  " HeaderStyle-BackColor="#808080" HeaderStyle-ForeColor="White" AutoGenerateColumns="false" runat="server">
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

</asp:Content>
