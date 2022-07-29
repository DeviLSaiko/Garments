<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="GarmentsPro.Admin.OrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <div class="container mt-3">
                <div class="row ">
                    
                    <div class="col-md-4 bg-white shadow-sm p-2">
                        <h6 style="border-bottom: 1px solid  ;   width:auto ">Current Status</h6>
                        <div class="table-responsive">

                            <table class="table-hover     ">
                                <asp:GridView ID="GvCutDep" CssClass=" table " HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#808080" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:TemplateField HeaderText=" ">
                                            <ItemTemplate><%# Container.DataItemIndex + 1 %> </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                                        <asp:BoundField DataField="Current_Department" HeaderText="Department" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                    </Columns>
                                </asp:GridView>
                            </table>

                        </div>

                    </div>
                </div>
                <div class="container mt-3">
                <div class="row">
                    <div class="col-md-12 bg-white shadow-sm p-2 mt-3">
                        <h6>Order History</h6>
                        <div class="table">
                            <table class="table-hover     ">
                                <asp:GridView ID="GridView1" AllowPaging="true" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass=" table " HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#808080" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:TemplateField HeaderText=" ">
                                            <ItemTemplate><%# Container.DataItemIndex + 1 %> </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" />
                                        <asp:BoundField DataField="Current_Department" HeaderText="Department" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                        <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" />
                                    </Columns>
                                </asp:GridView>
                            </table>
                        </div>
                    </div>
                </div>
                </center>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
