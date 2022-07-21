<%@ Page Title="" Language="C#" MasterPageFile="~/Departments/FabricFormation/FabricFormation.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GarmentsPro.Departments.FabricFormation.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4 mb-3">
        <center>
                 <label> Welcome : </label><asp:Label ID="lblWelcome" runat="server" Font-Size="Large"   Text=" Admin "></asp:Label>
            </center>

        <div class="row mt-5">
             <div class="col-md-2 bg-black  ms-3 text-light" style="height: 100px">
                <center>
                        <label>Yet To Start</label>
                        <br />
                        <asp:Label ID="lblYS" runat="server" Font-Size="XX-Large"  Text=""></asp:Label>
                                </center>
            </div>
            <div class="col-md-2 bg-black  ms-3 text-light" style="height: 100px">
                <center>
                        <label>In Progress</label>
                        <br />
                        <asp:Label ID="lblInProgress" runat="server" Font-Size="XX-Large"  Text=""></asp:Label>
                                </center>
            </div>
            <div class="col-md-2 bg-secondary  ms-3 text-light" style="height: 100px">
                <label>On Hold</label>
                <br />
                <center>

                         <asp:Label ID="lblHold" runat="server"   Font-Size="XX-Large"     Text=""></asp:Label>
                    </center>
                <br />
            </div>
            <div class="col-md-2 bg-info ms-3 text-light" style="height: 100px">

                <label>Finshed</label>

                <br />
                <center>

                         <asp:Label ID="lblFinshedOrds" runat="server"  Font-Size="XX-Large"   Text=""></asp:Label>
                    </center>
            </div>
        
        </div>
        <br />

        <div class="row">
        </div>
        <asp:GridView ID="GridView1" Visible="false" runat="server"></asp:GridView>

    </div>

</asp:Content>
