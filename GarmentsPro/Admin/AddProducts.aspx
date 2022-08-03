<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="GarmentsPro.Admin.AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5  ">
        <div class="row mt-6">
            <div class="col-sm-5 ">
                <div class="card shadow-sm  mb-3">
                    <div class="card-body me-5">
                        <div class="card-title"><h5> Add New Product</h5></div>
                        <label>Product Name</label>
                        <asp:TextBox ID="txtClinet" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            ControlToValidate="txtClinet"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                        <label>Product Category</label>
                        <asp:DropDownList ID="ddType" CssClass="form-select" runat="server">
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
                        <label>Product Images</label>
                        <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            ControlToValidate="ddType"
                            Text=" This Field Cannot be Empty"
                            ForeColor="red"
                            Font-Size="Small"
                            runat="server"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Add Product" CssClass="btn btn-success " />
                    </div>
                </div>
            </div>
             <div class="col-sm-5 ">
                <div class="card shadow-sm  mb-3">
                    <div class="card-body me-5">
                       
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
        </div>
        <div class="row mt-5">
            <div class="col-sm-12">
              
            </div>
        </div>
    </div>
</asp:Content>
