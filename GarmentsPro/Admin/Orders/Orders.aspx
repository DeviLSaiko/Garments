<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="GarmentsPro.Admin.Orders.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <center>
            <div class="container">
       <div class="row" style="margin-top:100px">
           <div class="col-sm-12" >
        
        <div class="align-content-center">  
            <div>
                 <asp:DropDownList ID="DropDownList1" CssClass="form-select-sm" runat="server"></asp:DropDownList> 
            <asp:TextBox ID="TextBox1" CssClass="form-control-sm" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" CssClass="btn btn-secondary" runat="server" Text="Search"></asp:Button>
            </div>
          
            <br />
             <table class="table-hover     ">
                            <asp:GridView ID="GridView1" CssClass=" table table-hover" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#666633"  AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="OID"   HeaderText="ID" />
                                    <asp:BoundField DataField="OrderID"   HeaderText="Order ID" />
                                     <asp:BoundField DataField="ClientName"   HeaderText="Client Name" />
                                    <asp:BoundField DataField="OrderType"   HeaderText="Order Type" />
                                     <asp:BoundField DataField="Qty"   HeaderText="Quantity" />
                                    <asp:BoundField DataField="ETA_Time" HeaderText="Deadline On" />
                                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" />
                                     <asp:BoundField DataField="Status" HeaderText="Current Status" />
             <asp:TemplateField HeaderText="Modify" ControlStyle-CssClass="btn btn-dark" >
     <ItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/Orders/EditOrder.aspx?ID={0}",
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
