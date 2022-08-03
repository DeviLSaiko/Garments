<%@ Page Title="" Language="C#" MasterPageFile="~/Departments/Fabrication/Fabrication.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Garments_Pro.Departments.Fabrication.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Fabrication</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

   <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <div class="container" >
                 <div class="card-body mt-4  rounded  shadow-sm bg-white p-3 " >

                         <div class="row">
                    <center>
            <div class="col-md-12 align-content-center">
                <asp:GridView ID="GridView1" CssClass=" table table-responsive "  HeaderStyle-CssClass="align-content-center" OnRowDataBound="GridView1_RowDataBound" OnRowCommand= "GridView1_RowCommand1" AutoGenerateColumns="False" runat="server">
                    <Columns>
                        
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="ClientName" HeaderText="Client " />
                        <asp:BoundField DataField="OrderType" HeaderText="Order Type" />
                         <asp:BoundField DataField="Deadline" HeaderText="DeadLine" />
                         <asp:BoundField   DataField="Status" HeaderText="Order Status" />
                        <asp:TemplateField HeaderText="Set Start" HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnstart" CommandName="Start"   ControlStyle-Font-Size="Small"    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-success btn-sm " Width="100px" runat="server" Text="Start" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Put on Hold"   HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnhold"  CommandName="Hold"  ControlStyle-Font-Size="Small"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-warning btn-sm" Width="100px" runat="server"  Text="Hold" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Completed" HeaderStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btnfinish"  CommandName="Finish"   ControlStyle-Font-Size="Small"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CssClass="btn btn-primary btn-sm" Width="100px" runat="server"  Text="Finish" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label runat="server" ID="txtError" Text=""></asp:Label>
            </div>
                </div>

                 </div>
            
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
