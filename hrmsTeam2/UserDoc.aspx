<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserDoc.aspx.cs" Inherits="hrmsTeam2.UserDoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        /* General Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    color: #333;
    margin: 0;
    padding: 0;
}
#table{
    margin-left:17%;
}

h2 {
    text-align: center;
    color: #4CAF50;
    margin-bottom: 20px;
}

/* Centering the form */
.row {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 5%;
}
.btnbtnbtn{
    margin-left:50%;
}
/* Styling the table */
table {
    margin: 0 auto;
    border-spacing: 10px;
}

td {
    padding: 10px;
    vertical-align: middle;
    font-size: 16px;
}

table input[type="text"], 
table input[type="password"], 
table select, 
table .form-control {
    width: 300px;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

table td:first-child {
    text-align: right;
    font-weight: bold;
}

table td:last-child {
    text-align: left;
}

/* Styling the buttons */
button, input[type="button"], input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

button:hover, input[type="button"]:hover, input[type="submit"]:hover {
    background-color: #45a049;
}

/* File upload styling */
input[type="file"] {
    border: none;
    font-size: 14px;
}

/* Image styling */
.img {
    border-radius: 50%;
    border: 2px solid #4CAF50;
    width: 120px;
    height: 120px;
    object-fit: cover;
    margin-top: 10px;
}

/* GridView styling */
.table-responsive {
    margin-top: 20px;
    padding: 0 15px;
}

.table-bordered {
    width: 90%;
    margin: 0 auto;
    border: 1px solid #ddd;
    border-collapse: collapse;
}

.table-bordered th, 
.table-bordered td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

.table-hover tr:hover {
    background-color: #f1f1f1;
}

.table-hover th {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    font-size: 16px;
}

.btn {
    display: inline-block;
    margin: 5px;
}

.btn-primary {
    background-color: #007BFF;
    color: white;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.btn-secondary {
    background-color: #6c757d;
    color: white;
}

.btn-secondary:hover {
    background-color: #5a6268;
}

.btn-danger {
    background-color: #dc3545;
    color: white;
}

.btn-danger:hover {
    background-color: #c82333;
}

.btn-success {
    background-color: #28a745;
    color: white;
}

.btn-success:hover {
    background-color: #218838;
}

/* Responsive Design */
@media (max-width: 768px) {
    .row {
        margin-left: 5%;
        margin-right: 5%;
        margin-top: 10%;
    }

    table input[type="text"], 
    table input[type="password"], 
    table select, 
    table .form-control {
        width: 90%;
    }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive" id="table">
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover"
    AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:TemplateField HeaderText="Id">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Id") %>' CssClass="fw-bold"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Document Type">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("DocumentType") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="File Name">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("FileName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Uploaded By">
            <ItemTemplate>
                <asp:Label ID="LabelEmail" runat="server" Text='<%# Eval("Email") %>' CssClass="fw-bold"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="View">
            <ItemTemplate>
                <asp:HyperLink ID="lnkView" runat="server" NavigateUrl='<%# Eval("FilePath") %>' Text="View"
                    Target="_blank"></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Download">
            <ItemTemplate>
                <asp:Button ID="Button4" runat="server" Text="Download" CssClass="btn btn-success btn-sm"
                    CommandName="Download" CommandArgument='<%# Eval("Id") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        
    </Columns>
</asp:GridView>

</div>
</asp:Content>
