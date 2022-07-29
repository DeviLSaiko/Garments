<%@ Page Title="" Language="C#" MasterPageFile="~/Departments/Yarn_Formation/YarnFormation.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Garments_Pro.Yarn_Formation.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Yarn Formation</title>

    <script src="../../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />

    <link href="../../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../../Assets/SweetAlert/sweetalert.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    
    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <div class="container" style="padding-top: 50px; font-size: small;">
                <div class="row">
                    <center >
            <div class="col-md-12 align-content-center">
                <asp:GridView ID="GridView1" CssClass=" table"  HeaderStyle-CssClass="align-content-center " OnRowDataBound="GridView1_RowDataBound" OnRowCommand= "GridView1_RowCommand1" AutoGenerateColumns="False" runat="server">
                    <Columns>
                          
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="ClientName" HeaderText="Client " />
                        <asp:BoundField DataField="OrderType" HeaderText="Order Type" />
                         <asp:BoundField DataField="Deadline" HeaderText="DeadLine" />
                         <asp:BoundField   DataField="Status" HeaderText="Order Status" />
                        <asp:TemplateField HeaderText="Set Start" HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnstart" CommandName="Start"  ControlStyle-Font-Size="Small"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-primary mb-3 mb-lg-0 " Width="100px" runat="server" Text="Start" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Put on Hold"   HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnhold"  CommandName="Hold" ControlStyle-Font-Size="Small" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-warning btn-sm "   Width="100px" runat="server"  Text="Hold" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Completed" ControlStyle-Font-Size="Small" HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnfinish"  CommandName="Finish"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-primary btn-sm" Width="100px" runat="server"  Text="Finish" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label runat="server" ID="txtError"  Text=""></asp:Label>
            </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
