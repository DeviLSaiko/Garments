<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="GarmentsPro.Admin.OrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <div class="container mt-2">

                <div class="row ">
                     <h4>Current Status</h4>
                    <div class="col-md-6">
                        <div class="table-responsive">

                            <table class="table-hover     ">
                                <asp:GridView ID="GvCutDep" CssClass=" table " HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Teal" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                         <asp:TemplateField HeaderText=" ">   
                                        <ItemTemplate> <%# Container.DataItemIndex + 1 %> </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" />
                                        <asp:BoundField DataField="Current_Department" HeaderText="Department" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                    </Columns>
                                </asp:GridView>
                            </table>

                        </div>

                    </div>

                   
                     <div class="col-sm-8">
                        <div class="table-responsive">

                            <table class="table-hover     ">
                                <asp:GridView ID="gvHistry" CssClass=" table " HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Teal" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                         <asp:TemplateField HeaderText=" ">   
                                        <ItemTemplate> <%# Container.DataItemIndex + 1 %> </ItemTemplate>
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
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
