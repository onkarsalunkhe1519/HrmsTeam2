<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="NotificationUser.aspx.cs" Inherits="hrmsTeam2.NotificationUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* General Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin-left:18%;
    margin-top:10%;
    padding: 0;
    color: #333;

}

/* Notification Container */


/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px 15px;
    text-align: left;
}

th {
    background-color: #4CAF50;
    color: white;
    font-size: 16px;
    text-transform: uppercase;
    border-bottom: 2px solid #ddd;
}

td {
    border-bottom: 1px solid #ddd;
    font-size: 14px;
    color: #555;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #e9f5e9;
}

/* Mobile Responsive */
@media (max-width: 768px) {
    div {
        width: 100%;
    }

    table, tr, td, th {
        font-size: 12px;
    }

    th, td {
        padding: 8px 10px;
    }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <asp:Repeater ID="notificationRepeater" runat="server">
    <HeaderTemplate>
        <table>
            <tr>
                <th>Message</th>
                <th>Date</th>
                <th>Time</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("NotificationMessage") %></td>
            <td><%# Eval("NotificationDate", "{0:yyyy-MM-dd}") %></td>
            <td><%# Eval("NotificationTime", "{0:hh\\:mm\\:ss}") %></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
        </div>
</asp:Content>
