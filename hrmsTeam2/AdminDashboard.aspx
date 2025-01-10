<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="hrmsTeam2.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #row {
            margin-left: 17%;
            margin-top: 5%;
        }
        .pie{
            max-height:20%;
            max-width:20%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="row" class="row">
        <div class="col-lg-6 col-12">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="card">
                        <span class="mask bg-primary opacity-10 border-radius-lg"></span>
                        <div class="card-body p-3 position-relative">
                            <div class="row">
                                <div class="col-8 text-start">
                                    <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                                        <i class="ni ni-circle-08 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                                    </div>
                                    <h5 class="text-white font-weight-bolder mb-0 mt-3">
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                    </h5>
                                    <span class="text-white text-sm">Users Active</span>
                                </div>
                                <div class="col-4">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
        <div class="card">
            <span class="mask bg-dark opacity-10 border-radius-lg"></span>
            <div class="card-body p-3 position-relative">
                <div class="row">
                    <div class="col-8 text-start">
                        <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                            <i class="ni ni-active-40 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                        </div>
                        <h5 class="text-white font-weight-bolder mb-0 mt-3">
                            <asp:Label ID="PresentDaysLabel" runat="server" Text="Label"></asp:Label>
                </h5>
                        <span class="text-white text-sm">Monthly Present</span>
                    </div>
                    <div class="col-4">
                        <div class="dropstart text-end mb-6">
                            <a href="javascript:;" class="cursor-pointer" id="dropdownUsers2" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa fa-ellipsis-h text-white"></i>
                            </a>
                            <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers2">
                                <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                                <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                                <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
   
    <div class="row mt-4">
        <div class="col-lg-6 col-md-6 col-12">
            <div class="card">
                <span class="mask bg-dark opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                    <div class="row">
                        <div class="col-8 text-start">
                            <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                                <i class="ni ni-cart text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                            <h5 class="text-white font-weight-bolder mb-0 mt-3">
                                                            <asp:Label ID="HalfDaysLabel" runat="server" Text="Label"></asp:Label>

                </h5>
                            <span class="text-white text-sm">Monthly HalfDays</span>
                        </div>
                        <div class="col-4">
                            <div class="dropdown text-end mb-6">
                                <a href="javascript:;" class="cursor-pointer" id="dropdownUsers3" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-ellipsis-h text-white"></i>
                                </a>
                                <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers3">
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
            <div class="card">
                <span class="mask bg-dark opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                    <div class="row">
                        <div class="col-8 text-start">
                            <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                                <i class="ni ni-like-2 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                            <h5 class="text-white font-weight-bolder mb-0 mt-3">
                                                            <asp:Label ID="AbsentDaysLabel" runat="server" Text="Label"></asp:Label>

                </h5>
                            <span class="text-white text-sm">Monthly Absent</span>
                        </div>
                        <div class="col-4">
                            <div class="dropstart text-end mb-6">
                                <a href="javascript:;" class="cursor-pointer" id="dropdownUsers4" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-ellipsis-h text-white"></i>
                                </a>
                                <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers4">
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<div class="pie">
    Leaves Status
    <canvas id="leaveChart" width="100" height="100"></canvas>
</div>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        var ctx = document.getElementById("leaveChart").getContext("2d");
        var chart = new Chart(ctx, {
            type: "pie",
            data: {
                labels: ["Approved", "Rejected"],
                datasets: [{
                    data: [leaveData.approved, leaveData.rejected],
                    backgroundColor: ["#4CAF50", "#FF5722"],
                }]
            },
            options: {
                title: {
                    display: true,
                    text: "Approved vs Rejected Leaves"
                }
            }
        });
    });
    </script>

    </div>
</asp:Content>
