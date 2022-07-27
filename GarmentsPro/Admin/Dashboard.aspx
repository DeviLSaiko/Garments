<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GarmentsPro.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>
    <style>
        label {
            font-size: 10px;
            color: black;
        }

        .auto-style2 {
            padding-left: 22PX;
            margin-left: 22PX;
            margin-right: 33PX;
        }

        header {
            padding-left: 30px;
            font-size: 10px;
            font-family: 'Open Sans';
        }

        hr {
            width: 1000px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row mt-2">
            <header style="padding-left: 22px;">Order Status</header>
            <%-- Yarn Formation--%>
            <div class="col-md-3 text-light border shadow-sm  m-2  rounded" style="background-color: #ffffff; width: 400px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <br />
                        <asp:Label ID="YAN1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <label>Yarn Formation</label>
                    </div>
                    <div class="col-md-4  ">
                        <div class=" ">
                            <label>In Progressing</label>
                            <br />
                            <asp:Label ID="YAN2" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-4  ">
                        <label>On Hold</label>
                        <br />
                        <asp:Label ID="YAN3" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                    </div>
                    <div class="col-md-4  ">
                        <label>Finished</label>
                        <br />
                        <asp:Label ID="YAN4" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                </div>
            </div>
            <%--Fabric Formation--%>
            <div class="col-md-3 text-light border shadow-sm  m-2  rounded" style="background-color: #ffffff; width: 400px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <br />
                        <asp:Label ID="FAB1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <label>Fabric Formation</label>
                    </div>
                    <div class="col-md-4  ">
                        <div class=" ">
                            <label>In Progressing</label>
                            <br />
                            <asp:Label ID="FAB2" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-4  ">
                        <label>On Hold</label>
                        <br />
                        <asp:Label ID="FAB3" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                    </div>
                    <div class="col-md-4  ">
                        <label>Finished</label>
                        <br />
                        <asp:Label ID="FAB4" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                </div>
            </div>
            <%-- Wet Processing--%>
            <div class="col-md-3 text-light border    shadow-sm  m-2  rounded" style="background-color: #ffffff; width: 400px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <br />
                        <asp:Label ID="WET1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <label>Yarn Formation</label>
                    </div>
                    <div class="col-md-4  ">
                        <div class=" ">
                            <label>In Progressing</label>
                            <br />
                            <asp:Label ID="WET2" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-4  ">
                        <label>On Hold</label>
                        <br />
                        <asp:Label ID="WET3" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                    </div>
                    <div class="col-md-4  ">
                        <label>Finished</label>
                        <br />
                        <asp:Label ID="WET4" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-2">
            </div>
            <%-- Fabrication --%>
            <div class="col-md-3 text-light border shadow-sm    m-2  rounded" style="background-color: #ffffff; width: 400px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <br />
                        <asp:Label ID="FR1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <label>Fabrication</label>
                    </div>
                    <div class="col-md-4  ">
                        <div class=" ">
                            <label>In Progressing</label>
                            <br />
                            <asp:Label ID="FR2" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-4  ">
                        <label>On Hold</label>
                        <br />
                        <asp:Label ID="FR3" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                    </div>
                    <div class="col-md-4  ">
                        <label>Finished</label>
                        <br />
                        <asp:Label ID="FR4" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                </div>
            </div>
            <%-- Finished Goods --%>
            <div class="col-md-3 text-light border   shadow-sm  m-2  rounded" style="background-color: #ffffff; width: 400px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <br />
                        <asp:Label ID="FG1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <label>Finished Goods</label>
                    </div>
                    <div class="col-md-4  ">
                        <div class="align-content-center ">
                            <label class="">In Progressing</label>
                            <br />
                            <asp:Label ID="FG2" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-4  ">
                        <label>On Hold</label>
                        <br />
                        <asp:Label ID="FG3" runat="server" CssClass="ms-4" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                    </div>
                    <div class="col-md-4  ">
                        <label>Finished</label>
                        <br />
                        <asp:Label ID="FG4" runat="server" CssClass="" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
