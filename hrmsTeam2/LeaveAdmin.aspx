<%@ Page Title="Leave Management - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="LeaveAdmin.aspx.cs" Inherits="hrmsTeam2.LeaveAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin-top: 50px;
            max-width: 90%;
            margin-left:15%;
        }
        .grid-header {
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .grid-container {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .grid-action-btn {
            margin-right: 5px;
            font-weight: bold;
            border: none;
        }
        .grid-action-btn.approve {
            background-color: #28a745;
            color: white;
        }
        .grid-action-btn.approve:hover {
            background-color: #218838;
        }
        .grid-action-btn.reject {
            background-color: #dc3545;
            color: white;
        }
        .grid-action-btn.reject:hover {
            background-color: #c82333;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="grid-container">
            <h2 class="grid-header">Leave Requests</h2>
            <asp:GridView ID="LeaveRequestsGrid" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" OnRowCommand="LeaveRequestsGrid_RowCommand" OnRowDataBound="LeaveRequestsGrid_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="TotalDays" HeaderText="Total Days" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" />
                    <asp:BoundField DataField="LeaveStatus" HeaderText="Leave Status" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="ApproveButton" runat="server" CommandName="Approve" CommandArgument='<%# Eval("LeaveId") %>' Text="Approve" CssClass="btn grid-action-btn approve" />
                            <asp:Button ID="RejectButton" runat="server" CommandName="Reject" CommandArgument='<%# Eval("LeaveId") %>' Text="Reject" CssClass="btn grid-action-btn reject" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
