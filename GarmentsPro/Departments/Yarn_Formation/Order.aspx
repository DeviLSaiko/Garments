<%@ Page Title="" Language="C#" MasterPageFile="~/Departments/Yarn_Formation/YarnFormation.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Garments_Pro.Yarn_Formation.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../Assets/Bootstrap/bootstrap.bundle.min5.js"></script>
    <link href="../../Assets/Bootstrap/bootstrap.min5.css" rel="stylesheet" />
    <link href="../../Assets/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../../Assets/SweetAlert/sweetalert.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="container" style="padding-top:250px">
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" CssClass="table table-responsive" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" runat="server">
                    <Columns>
                        <asp:BoundField DataField="OID" HeaderText="ID" />
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="ClientName" HeaderText="Client " />
                        <asp:BoundField DataField="OrderType" HeaderText="Order Type" />
                         <asp:BoundField DataField="DeadLine" HeaderText="DeadLine" />
                        <asp:TemplateField HeaderText="Order Status" HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Start" HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnstart" CommandName="Start"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-success btn-sm " runat="server" Text="Start" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hold"   HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnhold"  CommandName="Hold"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-warning btn-sm" runat="server"  Text="Hold" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Finish" HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnfinish"  CommandName="Finish"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-primary btn-sm" runat="server"  Text="Finish" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label runat="server" ID="txtError" Text=""></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
