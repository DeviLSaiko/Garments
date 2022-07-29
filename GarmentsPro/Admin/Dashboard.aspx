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
            font-size: 12px;
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
            <div class="col-md-3 text-light border shadow-sm  m-2   rounded" style="background-color: #ffffff; width: 350px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <%-- Yet to Start--%>
                        <br />
                        <asp:Label ID="YAN1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <a href="../Departments/Yarn_Formation/Dashboard.aspx">
                            <label class="shadow-sm" style="border-bottom: 1px solid; color: cadetblue; cursor: pointer;">Yarn Formation</label>
                        </a>
                    </div>
                    <div class="col-md-4  ">
                        <div class=" ">
                            <%-- In Progressing--%>
                            <label class="d-flex justify-content-end  ">In Progressing</label>
                        </div>
                        <div>
                            <asp:Label ID="YAN2" runat="server" ForeColor="#996633" CssClass="d-flex justify-content-end me-2" Font-Size="20px" Text="5"></asp:Label>
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
                        <label class="d-flex justify-content-end">Finished</label>
                        <%-- Finished--%>
                        <asp:Label ID="YAN4" runat="server" ForeColor="#996633" CssClass="d-flex justify-content-end me-2" Font-Size="20px" Text="5"></asp:Label>
                        <label style="font-size: 8px;" class="d-flex justify-content-end">in Last 30 Days</label>
                    </div>
                </div>
            </div>
            <%--Fabric Formation--%>
            <div class="col-md-3 text-light border shadow-sm  m-2  rounded" style="background-color: #ffffff; width: 350px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <%-- Yet to Start--%>
                        <br />
                        <asp:Label ID="FAB1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <a href="../Departments/FabricFormation/Dashboard.aspx">
                            <label class="shadow-sm" style="border-bottom: 1px solid; color: darkmagenta; cursor: pointer;">Fabric Formation</label>
                        </a>
                    </div>
                    <div class="col-md-4  ">
                        <div class=" ">
                            <%-- In Progressing--%>
                            <label class="d-flex justify-content-end  ">In Progressing</label>

                            <asp:Label ID="FAB2" runat="server" CssClass="d-flex justify-content-end me-2" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
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
                        <label class="d-flex justify-content-end me-2">Finished</label>
                        <%-- Finished--%>
                        <asp:Label ID="FAB4" runat="server" ForeColor="#996633" CssClass="d-flex justify-content-end me-2" Font-Size="20px" Text="5"></asp:Label>
                        <label style="font-size: 8px;" class="d-flex justify-content-end">in Last 30 Days</label>
                    </div>
                </div>
            </div>
            <%-- Wet Processing--%>
            <div class="col-md-3 text-light border shadow-sm  m-2  rounded" style="background-color: #ffffff; width: 350px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <%-- Yet to Start--%>
                        <br />
                        <asp:Label ID="WET1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <a href="../Departments/Wet_Processing/Dashboard.aspx">
                            <label class="shadow-sm" style="border-bottom: 1px solid; color: darkslateblue; cursor: pointer;">Wet Processing</label>
                        </a>
                    </div>
                    <div class="col-md-4  ">
                        <div class=" ">
                            <%-- In Progressing--%>
                            <label class="d-flex justify-content-end  ">In Progressing</label>
                            <asp:Label ID="WET2" runat="server" CssClass="d-flex justify-content-end me-2" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
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
                        <label class="d-flex justify-content-end">Finished</label>
                        <%-- Finished--%>
                        <asp:Label ID="WET4" runat="server" CssClass="d-flex justify-content-end me-2" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        <label style="font-size: 8px;" class="d-flex justify-content-end">in Last 30 Days</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-2">
            </div>
            <%-- Fabrication --%>
            <div class="col-md-3 text-light border shadow-sm    m-2  rounded" style="background-color: #ffffff; width: 350px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <%-- Yet to Start--%>
                        <br />
                        <asp:Label ID="FR1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <a href="../Departments/Fabrication/Dashboard.aspx">
                            <label style="border-bottom: 1px solid black; color: darkgoldenrod; cursor: pointer;">Fabrication</label>
                        </a>
                    </div>
                    <div class="col-md-4  ">
                        <div class=" ">
                            <%-- In Progressing--%>
                            <label class="d-flex justify-content-end  ">In Progressing</label>
                            <asp:Label ID="FR2" runat="server" CssClass="d-flex justify-content-end me-2" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
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
                        <label class="d-flex justify-content-end">Finished</label>
                        <%-- Finished--%>
                        <asp:Label ID="FR4" runat="server" CssClass="d-flex justify-content-end me-2" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        <label style="font-size: 8px;" class="d-flex justify-content-end">in Last 30 Days</label>
                    </div>
                </div>
            </div>
            <%-- Finished Goods --%>
            <div class="col-md-3 text-light border   shadow-sm  m-2  rounded" style="background-color: #ffffff; width: 350px; height: 142px;">
                <div class="row mb-4  ">
                    <div class="col-md-4  ">
                        <label>Yet to Start</label>
                        <%-- Yet to Start--%>
                        <br />
                        <asp:Label ID="FG1" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                        <a href="../Departments/Finished_Goods/Dashboard.aspx">
                            <label style="border-bottom: 1px solid black; color: darkslateblue; cursor: pointer;">Finished Goods</label>
                        </a>
                    </div>
                    <div class="col-md-4  ">
                        <div class="align-content-center ">
                            <%-- In Progressing--%>
                            <label class="d-flex justify-content-end ">In Progressing</label>
                            <asp:Label ID="FG2" runat="server" CssClass="d-flex justify-content-end me-2" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-4  ">
                        <label>On Hold</label>
                        <br />
                        <asp:Label ID="FG3" runat="server" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                    </div>
                    <div class="col-md-4  ">
                    </div>
                    <div class="col-md-4  ">
                        <%-- Finished--%>
                        <label class="d-flex justify-content-end">Finished</label>
                        <asp:Label ID="FG4" runat="server" CssClass="d-flex justify-content-end me-2" ForeColor="#996633" Font-Size="20px" Text="5"></asp:Label>
                        <label style="font-size: 8px;" class="d-flex justify-content-end ">in Last 30 Days</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
