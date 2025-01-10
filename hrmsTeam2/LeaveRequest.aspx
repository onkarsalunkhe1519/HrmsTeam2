<%@ Page Title="Leave Management" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="LeaveRequest.aspx.cs" Inherits="hrmsTeam2.LeaveRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin-top: 50px;
            max-width: 800px;
        }
        .card-header h6 {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-control {
            font-size: 1rem;
        }
        .btn-submit {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border: none;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .info-label {
            font-weight: bold;
            margin-right: 10px;
        }
        .leave-status {
            font-weight: bold;
            color: #28a745;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card shadow-lg">
                    <div class="card-header bg-primary text-white text-center pb-2">
                        <h6>Leave Management</h6>
                    </div>
                    <div class="card-body">
                        <!-- Leave Type -->
                        <div class="form-group">
                            <label for="LeaveTypeDropDown" class="form-label">Leave Type:</label>
                            <asp:DropDownList ID="LeaveTypeDropDown" runat="server" CssClass="form-control">
                                <asp:ListItem Text="CL" Value="CL"></asp:ListItem>
                                <asp:ListItem Text="PL" Value="PL"></asp:ListItem>
                                <asp:ListItem Text="ML" Value="ML"></asp:ListItem>
                                <asp:ListItem Text="SL" Value="SL"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Dates -->
                        <div class="form-group">
                            <label for="StartDateTextBox" class="form-label">From:</label>
                            <asp:TextBox ID="StartDateTextBox" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Start Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="EndDateTextBox" class="form-label">To:</label>
                            <asp:TextBox ID="EndDateTextBox" runat="server" CssClass="form-control" TextMode="Date" Placeholder="End Date"></asp:TextBox>
                        </div>

                        <!-- Reason -->
                        <div class="form-group">
                            <label for="ReasonTextBox" class="form-label">Reason:</label>
                            <asp:TextBox ID="ReasonTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Reason"></asp:TextBox>
                        </div>

                        <!-- Submit Button -->
                        <div class="form-group text-center">
                            <asp:Button ID="SubmitLeaveButton" runat="server" CssClass="btn btn-submit" Text="Submit Leave" OnClick="SubmitLeaveButton_Click" />
                        </div>

                        <!-- Status -->
                        <asp:Label ID="LeaveStatusLabel" CssClass="leave-status d-block text-center" runat="server"></asp:Label>

                        <!-- Leave Balances -->
                        <div class="mt-4">
                            <p class="text-center mb-2 font-weight-bold">Available Leave Balances:</p>
                            <div class="d-flex justify-content-center">
                                <span class="info-label">CL:</span>
                                <asp:Label ID="Label2" runat="server" Text="0" CssClass="info-label"></asp:Label>
                                <span class="info-label">PL:</span>
                                <asp:Label ID="Label3" runat="server" Text="0" CssClass="info-label"></asp:Label>
                                <span class="info-label">ML:</span>
                                <asp:Label ID="Label4" runat="server" Text="0" CssClass="info-label"></asp:Label>
                                <span class="info-label">SL:</span>
                                <asp:Label ID="Label5" runat="server" Text="0" CssClass="info-label"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
