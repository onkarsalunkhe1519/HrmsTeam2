<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AttendanceAdmin.aspx.cs" Inherits="hrmsTeam2.AttendanceAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        /* Table Styling */
        table {
            border-collapse: collapse;
            width:70%;
            margin-top: 20px;
            margin-left:18%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Employee Name" />
        <asp:BoundField DataField="PresentDays" HeaderText="Present Days" />
        <asp:BoundField DataField="AbsentDays" HeaderText="Absent Days" />
        <asp:BoundField DataField="HalfDays" HeaderText="Half Days" />
    </Columns>
</asp:GridView>
</asp:Content>
