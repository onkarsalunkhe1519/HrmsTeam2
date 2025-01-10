<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PayslipUser.aspx.cs" Inherits="hrmsTeam2.PayslipUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row {
            margin-left: 17%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4 mt-4">
            <div class="card">
                <div class="card-header pb-0 px-3">
                    <h6 class="mb-0">Payslip And Form16</h6>
                    <br />
                    <asp:DropDownList CssClass="custom-dropdown" ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged" >
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp&nbsp
                    <asp:DropDownList CssClass="custom-dropdown" ID="DropDownList4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged">
                        <asp:ListItem>2024</asp:ListItem>
                        <asp:ListItem>2025</asp:ListItem>
                        <asp:ListItem>2026</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="card-body pt-4 p-3">
                    <ul class="list-group">
                        <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                            <div class="d-flex flex-column">
                                <h6 class="mb-3 text-sm">
                                    <asp:Label ID="Label1" runat="server"></asp:Label></h6>

                            </div>
                            <div class="ms-auto text-end">
                                <asp:Button class="btn btn-link text-info text-gradient px-3 mb-0" ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
                                <asp:Button class="btn btn-link text-success text-gradient px-3 mb-0" ID="Button2" runat="server" Text="Download" OnClick="Button2_Click" />

                            </div>
                        </li>
                        <li class="list-group-item border-0 d-flex p-4 mb-2 mt-3 bg-gray-100 border-radius-lg">
                            <div class="d-flex flex-column">
                                <h6 class="mb-3 text-sm">
                                    <asp:Label ID="Label2" runat="server"></asp:Label></h6>
                                </h6>

                            </div>
                            <div class="ms-auto text-end">
                                <asp:Button class="btn btn-link text-info text-gradient px-3 mb-0" ID="Button3" runat="server" Text="View" OnClick="Button3_Click" />
                                <asp:Button class="btn btn-link text-success text-gradient px-3 mb-0" ID="Button4" runat="server" Text="Download" OnClick="Button4_Click" />
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
