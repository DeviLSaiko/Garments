<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="GarmentsPro.WebForm1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <style>
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .modalPopup {
            background-color: #FFD9D5;
            border-width: 3px;
            border-style: solid;
            border-color: Gray;
            padding: 3px;
            width: 250px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="StuID">
            <Columns>
                <asp:BoundField DataField="StuID" HeaderText="EmployeeID" InsertVisible="False"
                    ReadOnly="True" SortExpression="StuID" ItemStyle-Width="0" />
                <asp:BoundField DataField="Name" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Email" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Mobile" HeaderText="Title" SortExpression="Title" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkAddNew" runat="server" Text="Add Record" CssClass="inline cboxElement button" OnClick="lnkAddNew_Click1">Cancel</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div>
            <div class="modal fade" id="addModalDates" tabindex="-1" role="dialog" aria-labelledby="addModalDates">
                <div class="modal-dialog" role="document" style="width: 600px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div style="margin-top: 10px;">
                                <label style="font-weight: bold; display: block;">Notes <span style="color: red;">*</span></label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtLName"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <asp:Button runat="server" ID="Button2" class="btn btn-success" Text="Save"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
