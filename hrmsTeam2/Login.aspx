<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="hrmsTeam2.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container{
            margin-left:13%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
                            <div class="row">
                                <div class="col-xl-4 col-lg-5 col-md-6 d-flex flex-column mx-auto">
                                    <div class="card card-plain mt-8">
                                        <div class="card-header pb-0 text-left bg-transparent">
                                            <h3 class="font-weight-bolder text-info text-gradient">Welcome back</h3>
                                            <p class="mb-0">Enter your email and password to sign in</p>
                                        </div>
                                        <div class="card-body">
                                            <div role="form">
                                                <label>Email</label>
                                                <div class="mb-3">
                                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Email or Username"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username or Email is Required*" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                                </div>
                                                <label>Password</label>
                                                <div class="mb-3">
                                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter valid Password" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator> 
                                                </div>
                                                
                                                <div class="text-center">
                                                    <asp:Button ID="Button1" runat="server" Text="Sign in" class="btn bg-gradient-info w-100 mt-4 mb-0" OnClick="Button1_Click" />
                                                    <%--<button type="button" >Sign in</button>--%>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="oblique position-absolute top-0 h-100 d-md-block d-none me-n8">
                                        <div class="oblique-image bg-cover position-absolute fixed-top ms-auto h-100 z-index-0 ms-n6" style="background-image: url('../assets/img/curved-images/curved6.jpg')"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
</asp:Content>
