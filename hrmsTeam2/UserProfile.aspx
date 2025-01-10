<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="hrmsTeam2.UserProfile" %>
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
            <div>
            <h2>User Profile</h2>
            <table>

                <tr>
                    <td>Username:</td>
                    <td><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><asp:TextBox ID="txtEmail" runat="server" Enabled="false"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Contact No:</td>
                    <td><asp:TextBox ID="txtContact" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
    <td>Emergency Contact:</td>
    <td><asp:TextBox ID="txtEContact" runat="server"></asp:TextBox></td>
</tr>
                
                <tr>
                    <td>Role:</td>
                    <td><asp:TextBox ID="txtRole" runat="server" Enabled="false"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <td><asp:TextBox ID="txtStatus" runat="server" Enabled="false"></asp:TextBox></td>
                </tr>
                <tr>
            <td>Profile Picture:</td>
            <td>
                <asp:Image class="img" ID="imgProfile" runat="server" Width="100px" Height="100px" />
                <br />
                <asp:FileUpload ID="FileUploadProfile" runat="server" />
                <asp:Button ID="btnUploadProfilePic" runat="server" Text="Upload Picture" OnClick="btnUploadProfilePic_Click" />
            </td>
        </tr>
            </table>
            <asp:Button ID="btnUpdate" CssClass="btnbtnbtn" runat="server" Text="Update Profile" OnClick="btnUpdate_Click" />
        </div>
        <div class="mb-3 row align-items-center">
    <div class="col-md-6">
        <label for="DropDownList1" class="form-label">Document Type:</label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
            <asp:ListItem>HSc</asp:ListItem>
            <asp:ListItem>SSc</asp:ListItem>
            <asp:ListItem>Graduate</asp:ListItem>
            <asp:ListItem>Post Graduate</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-6">
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
    </div>
</div>
<div class="d-flex gap-3 mb-4">
    <asp:Button Style="margin-left:50%" ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Upload" />
    <asp:Button ID="Button3" runat="server"  CssClass="btn btn-secondary" OnClick="Button3_Click" Text="View" />
</div>
<div class="table-responsive">
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover"
        AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">
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
            <asp:TemplateField HeaderText="View">
                <ItemTemplate>
                    <asp:HyperLink ID="lnkView" runat="server" NavigateUrl='<%# Eval("FilePath") %>' Text="View"
                        Target="_blank"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm"
                        CommandName="Delete" CommandArgument='<%# Eval("Id") %>' />
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
    
  </div>
</div>
</asp:Content>
