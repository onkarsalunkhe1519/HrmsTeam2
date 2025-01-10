<%@ Page Title="Form16 Upload" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Form16.aspx.cs" Inherits="hrmsTeam2.Form16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin-left: 16%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-14 mt-5">
                <div class="card">
                    <div class="card-header pb-0 px-3">
                        <h6 class="mb-0">Form16 Upload</h6>
                    </div>

                    <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                        <div class="d-flex flex-column">
                            Select User:
                            <asp:DropDownList ID="DropDownListEmails" runat="server" CssClass="form-control"></asp:DropDownList>
                            <br />
                            Choose Year:
                            <asp:DropDownList CssClass="form-control" ID="DropDownList4" runat="server">
                                <asp:ListItem Value="2024">2024</asp:ListItem>
                                <asp:ListItem Value="2025">2025</asp:ListItem>
                                <asp:ListItem Value="2026">2026</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />
                            <br />
                            <asp:Button class="btn btn-primary mb-0" ID="Button2" runat="server" Text="Upload" OnClick="Button2_Click" />
                        </div>
                    </li>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
