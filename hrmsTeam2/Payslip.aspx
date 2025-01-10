<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Payslip.aspx.cs" Inherits="hrmsTeam2.Payslip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding-left: 13%
        }

        /* General dropdown style */
        select {
            appearance: none; /* Removes default styling */
            -webkit-appearance: none; /* For Safari */
            -moz-appearance: none; /* For Firefox */
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 8px 12px;
            font-size: 14px;
            color: #495057;
            background-color: #fff;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='4' height='5' viewBox='0 0 4 5'%3E%3Cpath fill='%23949494' d='M2 0L0 2h4z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 10px;
            width: 150px; /* Adjust width */
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

            /* Focus and hover state */
            select:focus,
            select:hover {
                border-color: #6c757d;
                outline: none;
                box-shadow: 0 0 4px rgba(108, 117, 125, 0.4);
            }

            /* Disabled state */
            select:disabled {
                background-color: #e9ecef;
                color: #6c757d;
                cursor: not-allowed;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-14 mt-5">
                <div class="card">
                    <div class="card-header pb-0 px-3">
                        <h6 class="mb-0">Payslips Generation</h6>
                    </div>
                    <div class="card-body pt-4 p-3">
                        Enter Email Id :
                        <asp:TextBox ID="TextBox1" class="form-control" runat="server" Style="width: 200px;"></asp:TextBox>
                        <br />
                        <asp:DropDownList CssClass="custom-dropdown" ID="DropDownList3" runat="server">
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
                        <asp:DropDownList CssClass="custom-dropdown" ID="DropDownList4" runat="server">
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                            <asp:ListItem>2026</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button class="btn bg-gradient-dark mb-0" ID="Button1" runat="server" Text="Fetch Details" OnClick="Button1_Click" />
                    </div>
                    <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                        <div class="d-flex flex-column">

                            <h6 class="mb-3 text-sm">Name:<asp:Label ID="Label1" runat="server"></asp:Label>
                            </h6>
                            <h6 class="mb-3 text-sm">Email:<asp:Label ID="Label2" runat="server"></asp:Label>
                            </h6>
                            <h6 class="mb-3 text-sm">Basic Salary:<asp:Label ID="Label3" runat="server"></asp:Label>
                            </h6>
                            <h6 class="mb-3 text-sm">Present Days:<asp:Label ID="Label4" runat="server"></asp:Label>
                            </h6>
                            <h6 class="mb-3 text-sm">Absent Days:<asp:Label ID="Label5" runat="server"></asp:Label>
                            </h6>
                            <h6 class="mb-3 text-sm">Half Days:<asp:Label ID="Label6" runat="server"></asp:Label>
                            </h6>
                            <h6 class="mb-3 text-sm">Net Pay:<asp:Label ID="Label7" runat="server"></asp:Label>
                            </h6>
                            <%--<h6 class="mb-3 text-sm">Select Month and Year: &nbsp&nbsp
                                <asp:DropDownList CssClass="custom-dropdown" ID="DropDownList1" runat="server">
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
                                <asp:DropDownList CssClass="custom-dropdown" ID="DropDownList2" runat="server">
                                    <asp:ListItem>2024</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                    <asp:ListItem>2026</asp:ListItem>
                                </asp:DropDownList>
                            </h6>--%>
                            <asp:Button class="btn bg-gradient-dark mb-0" ID="Button2" runat="server" Text="Generate Payslip" OnClick="Button2_Click" />


                        </div>

                    </li>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
