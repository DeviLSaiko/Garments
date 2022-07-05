<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GarmentsPro.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <div class="container mt-4 mb-3">
                <center>
                 <label> Welcome : </label><asp:Label ID="lblWelcome" runat="server" Font-Size="Large"   Text=" Admin "></asp:Label>
            </center>

                <div class="row mt-5">
                    <div class="col-md-2 bg-black  ms-3 text-light" style="height: 100px">
                        <center>
                            <label>Total Users Accounts:</label>
                            <br />
                            <asp:Label ID="lblTotAccounts" runat="server"   Font-Size="XX-Large"   Text="5"></asp:Label>
                        </center>
                    </div>
                    <div class="col-md-2 bg-black ms-3 text-light" style="height: 100px">
                        <center>
                        <label>Total Orders </label>
                        <br />
                        <asp:Label ID="lblTOrders" runat="server" Font-Size="XX-Large"  Text=""></asp:Label>
                                </center>
                        <br />
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-2 bg-secondary  ms-3 text-light" style="height: 100px">
                        <label>Current Orders  </label>
                        <br />
                        <center>

                         <asp:Label ID="lblCurrentOrders" runat="server"   Font-Size="XX-Large"     Text=""></asp:Label>
                    </center>
                    </div>
                    <div class="col-md-2 bg-danger ms-3 text-light" style="height: 100px">

                        <label>Pending Orders  </label>

                        <br />
                        <center>

                         <asp:Label ID="lblpending" runat="server"  Font-Size="XX-Large" Text="5"></asp:Label>
                    </center>
                    </div>
                    <div class="col-md-2 bg-info ms-3 text-light" style="height: 100px">

                        <label>Finshed Orders  </label>

                        <br />
                        <center>

                         <asp:Label ID="lblFinshedOrds" runat="server"  Font-Size="XX-Large"   Text="20"></asp:Label>
                    </center>
                    </div>
                </div>

                <asp:GridView ID="GridView1" Visible="false" runat="server"></asp:GridView>

            </div>

        </div>
</asp:Content>
