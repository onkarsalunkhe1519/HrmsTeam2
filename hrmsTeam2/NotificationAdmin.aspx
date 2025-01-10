<%@ Page Title="Notification Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="NotificationAdmin.aspx.cs" Inherits="hrmsTeam2.NotificationAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin-left: 17%;
            margin-top: 50px;
            max-width: 70%;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Send Notification</h2>
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br /><br />

        <!-- Select All Checkbox -->
        <label>
            <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectAll_CheckedChanged" />
            Select All Users
        </label>
        <br /><br />

        <!-- CheckBoxList for Users -->
        <label for="chkUsers" class="form-label">Select Users to Notify:</label>
        <asp:CheckBoxList ID="chkUsers" runat="server" RepeatColumns="3" />
        <br /><br />

        <!-- Notification Message -->
        <label for="txtNotification" class="form-label">Notification Message:</label>
        <asp:TextBox ID="txtNotification" runat="server" TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
        <br /><br />

        <!-- Send Button -->
        <asp:Button ID="btnSend" runat="server" Text="Send Notification" OnClick="btnSend_Click" />
    </div>
</asp:Content>
