<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="GarmentsPro.Admin.OrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <div class="container mt-5">

                <div class="row ">

                    <div class="col-md-6">
                        <div class="table-responsive">

                            <table class="table-hover     ">
                                <asp:GridView ID="GridView1" CssClass=" table " HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Teal" AutoGenerateColumns="false" runat="server">
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




                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
