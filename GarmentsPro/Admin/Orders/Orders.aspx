<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="GarmentsPro.Admin.Orders.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Orders</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <center>
            <div class="container">
       <div class="row" style="margin-top:50px">
           <div class="col-sm-12" >
        
        <div class="align-content-center" style="font-weight:400;">  
            <div>
                 <asp:DropDownList ID="ddSearch" CssClass="form-select-sm" runat="server">
                      <asp:ListItem Text="Client Name" Value="1"></asp:ListItem>
                <asp:ListItem Text="Status" Value="2"></asp:ListItem>
                <asp:ListItem Text="OrderType" Value="3"></asp:ListItem>
                 </asp:DropDownList> 
            <asp:TextBox ID="txtSearch" CssClass="form-control-sm" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" CssClass="btn btn-secondary btn-sm" OnClick="Button1_Click" runat="server" Text="Search"></asp:Button>
            </div>
          
            <br />
            <div class="table-responsive">

                 <table class="table-hover     ">
                            <asp:GridView ID="GridView1"  OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand"  AllowPaging="true"  PageSize="5"  CssClass=" table " HeaderStyle-ForeColor="White"  HeaderStyle-BackColor="#999999"  AutoGenerateColumns="false" runat="server">
                                <Columns>

                                    <asp:TemplateField HeaderText=" ">   
                                        <ItemTemplate> <%# Container.DataItemIndex + 1 %> </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                    <asp:BoundField DataField="OrderID"   HeaderText="Order ID" />
                                     <asp:BoundField DataField="ClientName"   HeaderText="Client Name" />
                                    <asp:BoundField DataField="OrderType"   HeaderText="Order Type" />
                                     <asp:BoundField DataField="Status" HeaderText="Current Status" />
                                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" />
             <asp:TemplateField HeaderText="Modify" ControlStyle-CssClass="btn btn-secondary  btn-sm " >
     <ItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/Orders/EditOrder.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OrderID").ToString()))%>'>Modify</asp:HyperLink>
     </ItemTemplate>
      </asp:TemplateField>   
                                    <asp:TemplateField HeaderText="View" ControlStyle-CssClass="btn text-light btn-info btn-sm" >
     <ItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/Orders/OrderStatus.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OrderID").ToString()))%>'>View</asp:HyperLink>
     </ItemTemplate>
      </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="Cancel"   >
     <ItemTemplate>
         <asp:Button ID="btnCancel"  CssClass="btn btn-danger btn-sm "  runat="server"  CommandName="OrderCancel" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  Text="Cancel"></asp:Button>
  </button>
                 
     </ItemTemplate>
      </asp:TemplateField> 
       <asp:TemplateField HeaderText="Remarks"   >
     <ItemTemplate>
         <asp:Button ID="btnRemarks"  CssClass="btn" runat="server"  data-bs-toggle="modal" data-bs-target="#myModal"   CommandName="Remarks" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  Text="-"></asp:Button>

 
    
     
  </button>
                 
     </ItemTemplate>
      </asp:TemplateField> 
                                    
     </Columns>
     </asp:GridView>
                </table>

            </div>
            
            </div>
             
           </div>
            </div>
           </div>
                 
          </center>
            <center>
        <!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
        <div>
            <asp:Label ID="txtError" runat="server" Text=""></asp:Label>
       </div>
      </center>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
