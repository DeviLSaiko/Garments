<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GarmentsPro.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>
    <style>
        label {
            font-size: 9px;
        }

        .viw {
            font-size: 10px;
        }

        .Wid div {
            width: 200px;
            box-shadow: rgba(0,0,0, 4 ) 10px 0 0 0,;
        }

        #Label1 {
        }
    </style>
    <link href="../Html/Dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="container mt-5 mb-3" style="padding-top: 30px;">
            <div class="row mt-5">
                <div class="col-md-2"></div>
                <%--Yarn Formation--%>
                <div class="col-md-2 text-light shadow ms-3 rounded" style="background-color: maroon; display: flex; height: 110px; column-gap: 80px">

                    <div class="d-flex align-items-start flex-column" style="height: 100px;">
                        <div class="mb-auto">
                            <label>Yet</label>
                            <br />
                            <asp:Label ID="YAN1" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                        <div>
                            <label class="mt-4">On Hold</label><br />
                            <asp:Label ID="YAN3" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="d-flex align-items-end flex-column ps-3">
                        <label>InPro </label>
                        <asp:Label ID="YAN2" runat="server" Font-Size="small" Text=""></asp:Label>
                        <br />
                        <div class="ms-3">
                            <label>Finished</label><br />
                            <asp:Label ID="YAN4" runat="server" CssClass="ps-3" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <%-- Fabric Formation--%>
                <div class="col-md-2 text-light shadow ms-3 rounded" style="background-color: darkgrey; display: flex; height: 110px; column-gap: 80px">
                    <div class="d-flex align-items-start flex-column" style="height: 100px;">
                        <div class="mb-auto">
                            <label>Yet</label>
                            <br />
                            <asp:Label ID="FAB1" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                        <div>
                            <label class="mt-4">On Hold</label><br />
                            <asp:Label ID="FAB3" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="d-flex align-items-end flex-column ps-3">

                        <label>InPro </label>
                        <asp:Label ID="FAB2" runat="server" Font-Size="small" Text=""></asp:Label>
                        <br />
                        <div class="ms-3">
                            <label>Finished</label><br />
                            <asp:Label ID="FAB4" runat="server" CssClass="ps-3" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <%-- Wet Processing--%>
                <div class="col-md-2 text-light shadow ms-3 mb-2 rounded" style="background-color: ActiveCaption; display: flex; height: 110px; column-gap: 80px">
                    <div class="d-flex align-items-start flex-column" style="height: 100px;">
                        <div class="mb-auto">
                            <label>Yet</label>
                            <br />
                            <asp:Label ID="Wet1" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                        <div>
                            <label class="mt-4">On Hold</label><br />
                            <asp:Label ID="Wet3" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="d-flex align-items-end flex-column ps-3">

                        <label>InPro </label>
                        <asp:Label ID="Wet2" runat="server" Font-Size="small" Text=""></asp:Label>
                        <br />
                        <div class="ms-3">
                            <label>Finished</label><br />
                            <asp:Label ID="Wet4" runat="server" CssClass="ps-3" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-3"></div>
                <%--Fabrication--%>
                <div class="col-md-2 text-light shadow ms-3 mb-2 rounded" style="background-color: darkcyan; display: flex; height: 110px; column-gap: 80px">
                    <div class="d-flex align-items-start flex-column" style="height: 100px;">
                        <div class="mb-auto">
                            <label>Yet</label>
                            <br />
                            <asp:Label ID="FRC1" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                        <div>
                            <label class="mt-4">On Hold</label><br />
                            <asp:Label ID="FRC3" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="d-flex align-items-end flex-column ps-3">
                        <label>InPro </label>
                        <asp:Label ID="FRC2" runat="server" Font-Size="small" Text=""></asp:Label>
                        <br />
                        <div class="ms-3">
                            <label>Finished</label><br />
                            <asp:Label ID="FRC4" runat="server" CssClass="ps-3" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <%-- Finished Goods--%>
                <div class="col-md-2 text-light shadow ms-3 mb-2 rounded" style="background-color: cadetblue; display: flex; height: 110px; column-gap: 80px">
                    <div class="d-flex align-items-start flex-column" style="height: 100px;">
                        <div class="mb-auto">
                            <label>Yet</label>
                            <br />
                            <asp:Label ID="FG1" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                        <div>
                            <label class="mt-4">On Hold</label><br />
                            <asp:Label ID="FG3" runat="server" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="d-flex align-items-end flex-column ps-3">
                        <label>InPro </label>
                        <asp:Label ID="FG2" runat="server" Font-Size="small" Text=""></asp:Label>
                        <br />
                        <div class="ms-3">
                            <label>Finished</label><br />
                            <asp:Label ID="FG4" runat="server" CssClass="ps-3" Font-Size="small" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
