<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="GarmentsPro.Admin.Orders.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <center>
            <div class="container">
       <div class="row">
           <div class="col-sm-12" >
        
        <div class="align-content-center">  
             <table class="table-hover     ">
                            <asp:GridView ID="GridView1" CssClass=" table table-hover"  AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="OID"   HeaderText="ID" />
                                    <asp:BoundField DataField="OrderID"   HeaderText="OrderID" />
                                     <asp:BoundField DataField="ClientName"   HeaderText="ClientName" />
                                    <asp:BoundField DataField="OrderType"   HeaderText="OrderType" />
                                     <asp:BoundField DataField="Qty"   HeaderText="Qty" />
                                    <asp:BoundField DataField="ETA_Time" HeaderText="ETA_Time" />
                                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" />
                                     <asp:BoundField DataField="Status" HeaderText="Status" />
             <asp:TemplateField HeaderText="Modify" ControlStyle-CssClass="btn btn-dark" >
     <ItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Orders/Modify_Order.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OID").ToString()))%>'>Modify</asp:HyperLink>
     </ItemTemplate>
      </asp:TemplateField>   
     </Columns>
     </asp:GridView>
                </table>
            </div>
             
           </div>
            </div>
           </div>
                 
          </center>
        <center>
        <div>
            <asp:Label ID="txtError" runat="server" Text=""></asp:Label>
       </div>
      </center>


</asp:Content>
