<%@ Page Title="" Language="C#" MasterPageFile="~/Departments/Yarn_Formation/YarnFormation.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GarmentsPro.Departments.Yarn_Formation.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        label{
            color:black;
            font-size:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="container mt-4 mb-3">
     <div class="row mt-4">
           
            <div class="col-md-1">
                
            </div>
             <%--Yet To Start--%>
            <div class="col-md-2 text-light   border shadow-sm  m-2 rounded" style="background-color: #ffffff; height: 100px;">

                <div class="row">
                    <div class="col-md-6">
                        <label>Yet to Start</label>
                        <br />

                        <asp:Label ID="YAN1" runat="server" ForeColor="#996633" Font-Size="20px" CssClass="MyLable" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-6">

                        <i class="fa fa-hourglass-start   mt-4  " style="color: cadetblue; font-size: 33px; padding-left: 24px;"></i>
                    </div>
                </div>

            </div>
            <%-- In Progressing--%>
            <div class="col-md-2 text-light border shadow-sm  m-2 rounded" style="background-color:#ffffff; height: 100px;">

                <div class="row">
                    <div class="col-md-6">
                        <label>In Progress</label>
                        <br />

                        <asp:Label ID="YAN2" runat="server" ForeColor="#996633" Font-Size="20px" CssClass="MyLable" Text="3"></asp:Label>
                    </div>
                    <div class="col-md-6">

                        <i class="fa fa-spinner   mt-4  " style="color:  brown; font-size: 33px; padding-left: 24px;"></i>
                    </div>
                </div>

            </div>
            <%--On Hold--%>
            <div class="col-md-2 text-light border shadow-sm    m-2 rounded" style="background-color: #ffffff; height: 100px;">

                <div class="row">
                    <div class="col-md-6">
                        <label>On Hold</label>
                        <br />

                        <asp:Label ID="YAN3" runat="server" ForeColor="#996633" Font-Size="20px" CssClass="MyLable" Text="4"></asp:Label>
                    </div>
                    <div class="col-md-6">

                        <i class="fa fa-clock-o   mt-4  " style="color: indigo; font-size: 33px; padding-left: 24px;"></i>
                    </div>
                </div>

            </div>
            <%-- Finished --%>
            <div class="col-md-2 text-light border shadow-sm   m-2 rounded" style="background-color: #ffffff; height: 100px;">

   <div class="row">
                    <div class="col-md-6">
                        <label>Finished</label>
                        <br />

                        <asp:Label ID="YAN4" runat="server" ForeColor="#996633" Font-Size="20px" CssClass="MyLable" Text="12"></asp:Label>
                    </div>
                    <div class="col-md-6">

                        <i class="fa fa-flag   mt-4  " style="color: darkmagenta; font-size: 33px; padding-left: 24px;"></i>
                    </div>
                </div>
            </div>
         <div class="col-md-1">
                
            </div>
        </div>
        </div>
</asp:Content>
