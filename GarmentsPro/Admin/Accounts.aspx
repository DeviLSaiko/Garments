<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="GarmentsPro.Admin.Users.Accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="pagetitle mt-1">
            <h4>Accounts</h4>
            <nav>
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a  style="text-decoration:none;"  href="Dashboard.aspx">Home</a></li>
                  <li class="breadcrumb-item active">Accounts</li>
               </ol>
            </nav>
         </div>
     <div class="container mt-1">
                   
                     <center>

                <div class="row ">
                    <div class="col-md-2">
                     <asp:HyperLink ID="HyperLink1" class="btn btn-secondary   text-sm  btn-sm" NavigateUrl="CreateAccount.aspx"  runat="server">Create New Account</asp:HyperLink>

                    </div>
                    <div class="col-md-6">
               
                    </div>
                      <div class="col-md-4">

                    </div>
                </div>
                  </center>
                </div>


    <div class="card-body">
        <div class="container rounded pb-4 shadow-sm bg-white p-4 ">
            <div class="row">
                <div class="col-sm-12">
                    <table class="table-hover     ">
                        <asp:GridView ID="GridView1"  
                            CssClass=" table  " AutoGenerateColumns="false" runat="server">
                            <Columns>
                                <asp:BoundField DataField="UID" HeaderText="ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Username" HeaderText="Username" />
                                <asp:BoundField DataField="Password" HeaderText="Password" />
                                <asp:BoundField DataField="Department" HeaderText="Department" />
                                <asp:TemplateField HeaderText="Edit" ControlStyle-CssClass="btn btn-dark btn-sm">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("/Admin/EditAccount.aspx?ID={0}",
                    HttpUtility.HtmlEncode (Eval("UID").ToString()))%>'><i class="fa fa-pencil-square-o" style="font-size:11px;" aria-hidden="true"></i></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
