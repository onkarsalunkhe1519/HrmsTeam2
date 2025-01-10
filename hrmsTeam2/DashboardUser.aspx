﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="DashboardUser.aspx.cs" Inherits="hrmsTeam2.DashboardUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #row{
            margin-left:17%;
            margin-top:4%;
            max-width:80%
            
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
                  357
                </h5>
                <span class="text-white text-sm">Click Events</span>
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
                <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0">+124%</p>
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
                  2300
                </h5>
                <span class="text-white text-sm">Purchases</span>
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
                <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0">+15%</p>
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
                  940
                </h5>
                <span class="text-white text-sm">Likes</span>
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
                <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0">+90%</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-6 col-12 mt-4 mt-lg-0">
    <div class="card shadow h-100">
      <div class="card-header pb-0 p-3">
        <h6 class="mb-0">Reviews</h6>
      </div>
      <div class="card-body pb-0 p-3">
        <ul class="list-group">
          <li class="list-group-item border-0 d-flex align-items-center px-0 mb-0">
            <div class="w-100">
              <div class="d-flex mb-2">
                <span class="me-2 text-sm font-weight-bold text-dark">Positive Reviews</span>
                <span class="ms-auto text-sm font-weight-bold">80%</span>
              </div>
              <div>
                <div class="progress progress-md">
                  <div class="progress-bar bg-primary w-90" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>
            </div>
          </li>
          <li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
            <div class="w-100">
              <div class="d-flex mb-2">
                <span class="me-2 text-sm font-weight-bold text-dark">Neutral Reviews</span>
                <span class="ms-auto text-sm font-weight-bold">17%</span>
              </div>
              <div>
                <div class="progress progress-md">
                  <div class="progress-bar bg-primary w-10" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>
            </div>
          </li>
          <li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
            <div class="w-100">
              <div class="d-flex mb-2">
                <span class="me-2 text-sm font-weight-bold text-dark">Negative Reviews</span>
                <span class="ms-auto text-sm font-weight-bold">3%</span>
              </div>
              <div>
                <div class="progress progress-md">
                  <div class="progress-bar bg-primary w-5" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <div class="card-footer pt-0 p-3 d-flex align-items-center">
        <div class="w-60">
          <p class="text-sm">
            More than <b>1,500,000</b> developers used Creative Tim's products and over <b>700,000</b> projects were created.
          </p>
        </div>
        <div class="w-40 text-end">
          <a class="btn btn-dark mb-0 text-end" href="javascript:;">View all reviews</a>
        </div>
      </div>
    </div>
  </div>
</div>
</asp:Content>
