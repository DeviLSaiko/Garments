<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GarmentsPro.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>
    <style>
        body {
            background-color: ghostwhite;
        }

      label {
            font-size: 9px;
            color: black;
        }
       .MyLable {
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

        .auto-style1 {
            width: 58%;
            height: 0.3px;
        }
    </style>
    <link href="../Html/Dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container ">
        <div class="row mt-4">
            <%-- Fabric Formation--%>
            <div class="col-md-1">
                <label>Yarn Formation</label>

            </div>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>Yet to Start</label>
                <br />

                 <asp:Label ID="Label1" runat="server" Font-Size="Small" CssClass="MyLable" Text="Label"></asp:Label>

            </div>
            <%-- Wet Processing--%>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>In Progress</label>
                <br />

                <label>34</label>

            </div>
            <%--Fabrication--%>
            <div class="col-md-2 text-light shadow    m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>On Hold</label>
                <br />

                <label>34</label>

            </div>
            <%-- Finished Goods--%>

            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>Finished</label>
                <br />

                <label>34</label>
            </div>
        </div>
        <div class="row mt-4">
            <%-- Fabric Formation--%>
            <div class="col-md-1">
                <label>Yarn Formation</label>

            </div>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>Yet to Start</label>
                <br />

                <label>34</label>

            </div>
            <%-- Wet Processing--%>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>In Progress</label>
                <br />

                <label>34</label>

            </div>
            <%--Fabrication--%>
            <div class="col-md-2 text-light shadow    m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>On Hold</label>
                <br />

                <label>34</label>

            </div>
            <%-- Finished Goods--%>

            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>Finished</label>
                <br />

                <label>34</label>
            </div>
        </div>
        <div class="row mt-4">
            <%-- Fabric Formation--%>
            <div class="col-md-1">
                <label>Yarn Formation</label>

            </div>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>Yet to Start</label>
                <br />

                <label>34</label>

            </div>
            <%-- Wet Processing--%>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>In Progress</label>
                <br />

                <label>34</label>

            </div>
            <%--Fabrication--%>
            <div class="col-md-2 text-light shadow    m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>On Hold</label>
                <br />

                <label>34</label>

            </div>
            <%-- Finished Goods--%>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">

                <label>Finished</label>
                <br />
                <label>34</label>
            </div>
        </div>
        <div class="row mt-3">
            <%-- Fabric Formation--%>
            <div class="col-md-1">
                <label>Yarn Formation</label>
            </div>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">
                <label>Yet to Start</label>
                <br />
                <label>34</label>
            </div>
            <%-- Wet Processing--%>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">
                <label>In Progress</label>
                <br />

                <label>34</label>
            </div>
            <%--Fabrication--%>
            <div class="col-md-2 text-light shadow    m-2 rounded" style="background-color: ghostwhite; height: 80px;">
                <label>On Hold</label>
                <br />
                <label>34</label>
            </div>
            <%-- Finished Goods--%>

            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">


                <label>Finished</label>
                <br />

                <label>34</label>
            </div>
        </div>
        <div class="row mt-4">
            <%-- Fabric Formation--%>
            <div class="col-md-1">
                <label>Yarn Formation</label>
            </div>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">
                <label>Yet to Start</label>
                <br />
                <label>34</label>
            </div>
            <%-- Wet Processing--%>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">
                <label>In Progress</label>
                <br />
                <label>34</label>
            </div>
            <%--Fabrication--%>
            <div class="col-md-2 text-light shadow    m-2 rounded" style="background-color: ghostwhite; height: 80px;">
                <label>On Hold</label>
                <br />
                <label>34</label>
            </div>
            <%-- Finished Goods--%>
            <div class="col-md-2 text-light shadow   m-2 rounded" style="background-color: ghostwhite; height: 80px;">
                <label>Finished</label>
                <br />
                <label>34</label>
            </div>
        </div>
    </div>
</asp:Content>
