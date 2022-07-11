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

        <div class="col-10">
            <div class="table-responsive">

                 <table class="table-hover     ">
                            <asp:GridView ID="GridView1"    CssClass=" table " HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Teal"  AutoGenerateColumns="true" runat="server">
                            <Columns>
                                    <asp:BoundField DataField="OID"   HeaderText="ID" />
                                    <asp:BoundField DataField="OrderID"   HeaderText="Order ID" />
                                     <asp:BoundField DataField="ClientName"   HeaderText="Client Name" />
                                    <asp:BoundField DataField="OrderType"   HeaderText="Order Type" />
                                     <asp:BoundField DataField="Qty"   HeaderText="Quantity" />
                                    <asp:BoundField DataField="ETA_Time" HeaderText="Deadline On" />
                                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" />
                                     <asp:BoundField DataField="Status" HeaderText="Current Status" />
             <asp:TemplateField HeaderText="Modify" ControlStyle-CssClass="btn btn-outline-secondary  btn-sm " >
     <ItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/Orders/EditOrder.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OID").ToString()))%>'>Modify</asp:HyperLink>
     </ItemTemplate>
      </asp:TemplateField>   
                                        <asp:TemplateField HeaderText="View Status" ControlStyle-CssClass="btn btn-dark btn-sm" >
     <ItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/Orders/EditOrder.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OID").ToString()))%>'>View Status</asp:HyperLink>
     </ItemTemplate>
      </asp:TemplateField>  
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
