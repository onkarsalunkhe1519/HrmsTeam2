<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="hrmsTeam2.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container{
            margin-top:16%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
                        <div class="row mt-lg-n10 mt-md-n11 mt-n10">
                            <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
                                <div class="card z-index-0">
                                    <div class="card-header text-center pt-4">
                                        <h5>Register User</h5>
                                    </div>
                                    
                                    <div class="card-body">
                                        <div role="form text-left">
                                            <%--Name--%>
                                            <div class="mb-3">
                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the Name" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                            </div>
                                            <%--Email--%>
                                            <div class="mb-3">
                                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address." ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                            <%--Image--%>
                                            <div class="mb-3">
                                                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" placeholder="Upload Image"/>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Upload your Profile photo" ForeColor="Red" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="mb-3">
                                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Contact"></asp:TextBox>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Enter Valid Contact No." MinimumValue="7000000000" MaximumValue="9999999999" ControlToValidate="TextBox3" ForeColor="Red"></asp:RangeValidator>
                                            </div>
                                            <div class="mb-3">
                                                <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                            </div>
                                            <div class="mb-3">
                                                <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password do not match" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ForeColor="Red"></asp:CompareValidator>
                                            </div>
                                            
                                            <div class="text-center">
                                                <asp:Button ID="Button1" runat="server" Text="Register User" class="btn bg-gradient-dark w-100 my-4 mb-2" OnClick="Button1_Click" />
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
</asp:Content>
