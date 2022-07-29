<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="GarmentsPro.Admin.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Orders</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
           
           
                <div class="container mt-5">
                   
                     <center>

                <div class="row ">
                    <div class="col-md-2">
                        <asp:HyperLink ID="HyperLink1" class="btn btn-secondary   text-sm  btn-sm" NavigateUrl="CreateOrder.aspx"  runat="server">Create Order</asp:HyperLink>
                    </div>
                    <div class="col-md-6">
                     
                         <div>
                 <asp:DropDownList ID="ddSearch" CssClass="form-select-sm"   font-size="14px "   Height="25px"   runat="server">
                      <asp:ListItem  Text="Client Name" Value="1"></asp:ListItem>
                <asp:ListItem Text="Status" Value="2"></asp:ListItem>
                <asp:ListItem Text="OrderType" Value="3"></asp:ListItem>
                 </asp:DropDownList> 
            <asp:TextBox ID="txtSearch"  Height="25px" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" CssClass="btn btn-secondary btn-sm " OnClick="Button1_Click" font-size="small"  runat="server" Text="Search"></asp:Button>
            </div>
                    </div>
                      <div class="col-md-4">
                          <div class="dropdown">
                              <button type="button"     class="btn btn-secondary dropdown-toggle btn-sm  align-items-md-center -end " data-bs-toggle="dropdown">
                                Dropdown button
                              </button>
                              <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Link 1</a></li>
                                <li><a class="dropdown-item" href="#">Link 2</a></li>
                                <li><a class="dropdown-item" href="#">Link 3</a></li>
                              </ul>
                            </div>
                    </div>
                </div>
                  </center>
                </div>
                   

                     <div class="card-body">
                         
                <div class="container rounded pt-3  shadow-sm bg-white p-2 ">
                    <div class="row">
                        <div class="col-sm-12">

                            <div class="align-content-center" style="font-weight: 400;">
                                <div class="p-4   border-5  ">
                                    <div class=" ">
                                        <table>
                                            <asp:GridView ID="GridView1" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                                                 OnRowCommand="GridView1_RowCommand" AllowPaging="true" PageSize="7" CssClass="table   " AutoGenerateColumns="false" runat="server">
                                                <Columns>
                                                    <asp:TemplateField HeaderText=" ">
                                                        <ItemTemplate><%# Container.DataItemIndex + 1 %> </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="OrderID" HeaderText="Order id" />
                                                    <asp:BoundField DataField="ClientName" HeaderText="Customer" />
                                                    <asp:BoundField DataField="OrderType" HeaderText="Product" />
                                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                                    <asp:BoundField DataField="Created_Date" HeaderText="Date" />
                                                    <asp:TemplateField HeaderText="Edit" ControlStyle-CssClass="btn btn-primary  btn-sm ">
                                                        <ItemTemplate>
                                                            <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/EditOrder.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OrderID").ToString()))%>'><i class="fa fa-pencil-square-o" style="font-size:11px;" aria-hidden="true"></i></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View" ControlStyle-CssClass="btn text-light btn-secondary btn-sm">
                                                        <ItemTemplate>
                                                            <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/OrderStatus.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("OrderID").ToString()))%>'><i class="fa fa-history" style="font-size:11px;" ></i></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cancel">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnCancel" CssClass="btn btn-danger btn-sm" runat="server"
                                                                CommandName="OrderCancel" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Cancel"></asp:Button>
                                                            </button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--    <asp:TemplateField HeaderText="Remarks"   >
                                             <ItemTemplate>
                                                 <asp:Button ID="btnRemarks"  CssClass=" dropdown-toggle" runat="server"   data-bs-toggle="modal" data-bs-target="#staticBackdrop" 
                                                       CommandName="Remarks" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  Text="-"></asp:Button>
                                          </button>
                                             </ItemTemplate>
                                              </asp:TemplateField> --%>
                                                </Columns>
                                            </asp:GridView>
                                        </table>
                                    </div>
                                </div>
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
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
