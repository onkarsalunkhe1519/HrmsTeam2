<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AttendanceUser.aspx.cs" Inherits="hrmsTeam2.AttendanceUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* General Styling */
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

p {
    margin-top: 20px;
    text-align: center;
}

/* Button Styling */
.btn {
    padding: 10px 20px;
    margin: 5px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #0056b3;
}

/* Textbox Styling */
.textbox {
    width: 200px;
    padding: 10px;
    margin: 0 5px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    font-size: 14px;
}

/* GridView Styling */
table {
    margin: 20px auto;
    border-collapse: collapse;
    width: 90%;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

th {
    background-color: #007bff;
    color: #fff;
    padding: 10px;
    text-align: center;
}

td {
    padding: 10px;
    text-align: center;
    border: 1px solid #dee2e6;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f1f1f1;
}
.container{
    margin-left:13%;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

   
        <p>
    <asp:Button ID="Button1"  runat="server" OnClick="Button1_Click" Text="Check IN" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Check Out" OnClick="Button2_Click" />
</p>
<p>
    From
    <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; To&nbsp;
    <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" Text="Search" OnClick="Button3_Click" />
</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="PID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Checkin">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("CheckIn") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CheckOut">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("CheckOut") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total Hours">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("TotalHours") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
    </p>
         </div>
</asp:Content>
