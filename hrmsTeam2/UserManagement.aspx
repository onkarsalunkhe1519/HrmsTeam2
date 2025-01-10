<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="hrmsTeam2.UserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row{
            margin-left:18%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>User Management</h6>
            </div>
              <asp:GridView ID="GridView1" runat="server" CssClass="table align-items-center mb-0" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="UserId">
                  <Columns>
                      <%-- Author Column --%>
                      <asp:TemplateField HeaderText="User">
                          <HeaderStyle CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" />
                          <ItemTemplate>
                              <div class="d-flex px-2 py-1">
                                  <div>
                                      <asp:Image ID="Image1" runat="server" src='<%# Eval("UserImg") %>' class="avatar avatar-sm me-3" alt='<%# Eval("UserName") %>' />
                                  </div>
                                  <div class="d-flex flex-column justify-content-center">
                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("UserName") %>' class="mb-0 text-sm border-0"></asp:TextBox>
                                      <asp:TextBox ID="TextBox2" runat="server" class="text-xs text-secondary mb-0 border-0" Text='<%# Eval("UserEmail") %>'></asp:TextBox>
                                  </div>
                              </div>
                          </ItemTemplate>
                      </asp:TemplateField>

                      <%--Contact Column--%>
                      <asp:TemplateField HeaderText="Contacts">
                          <HeaderStyle CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" />
                          <ItemTemplate>
                              <div class="d-flex flex-column justify-content-center">
                                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("ContactNo") %>' class="text-xs font-weight-bold mb-0 border-0"></asp:TextBox>
                                  <asp:TextBox ID="TextBox4" runat="server" class="text-xs text-secondary mb-0 border-0" Text='<%# Eval("EContact") %>'></asp:TextBox>
                              </div>
                          </ItemTemplate>
                      </asp:TemplateField>

                      <%--Status Column--%>
                      <asp:TemplateField HeaderText="Status">
                          <HeaderStyle CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" />
                          <ItemTemplate>
                              
                                  <span class="badge <%# Eval("UserStatus").ToString() == "Active" ? "bg-success" : "bg-danger" %>">
                                      <%# Eval("UserStatus") %>
                              </span>
                          </ItemTemplate>
                          <EditItemTemplate >
                              <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                  <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                  <asp:ListItem Text="Deactive" Value="Deactive"></asp:ListItem>
                              </asp:DropDownList>
                              
                          </EditItemTemplate>
                      </asp:TemplateField>

                      <asp:CommandField ShowEditButton="True" />

                      <%--Edit Column --%>
                      <%--<asp:TemplateField>
                          <HeaderStyle CssClass="text-secondary opacity-7" />
                          <ItemTemplate>
                              <asp:HyperLink ID="HyperLink1" runat="server" class="text-secondary font-weight-bold text-xs">Edit</asp:HyperLink>
                            
                          </ItemTemplate>
                      </asp:TemplateField>--%>
                  </Columns>
              </asp:GridView>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
