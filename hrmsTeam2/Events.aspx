<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="hrmsTeam2.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container{
            margin-left:16%;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
    <div class="row">
        <div class="col-md-14 mt-5">
            <div class="card">
                <div class="card-header pb-0 px-3">
                    <h6 class="mb-0">Add Events</h6>
                </div>
                <div class="card-body pt-4 p-3">
                    Enter Event Name :
                    <asp:TextBox ID="TextBox1" class="form-control" runat="server" Style="width: 200px;"></asp:TextBox>
                    <br />
                    Event Type :
                       <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                           <asp:ListItem>Holiday</asp:ListItem>
                           <asp:ListItem>Birthday</asp:ListItem>
                    </asp:DropDownList>  
                     <br /> <br />
                    Enter Employee Name :
                    <asp:TextBox ID="TextBox2" class="form-control" runat="server" Style="width: 200px;"></asp:TextBox>
                     <br /> 
                    Enter Employee Email :
                    <asp:TextBox ID="TextBox3" class="form-control" runat="server" Style="width: 200px;"></asp:TextBox>
                     <br /> 
                    From :
<asp:TextBox ID="TextBox4" runat="server" class="form-control" Style="width: 200px;" TextMode="Date"></asp:TextBox>
To :
<asp:TextBox ID="TextBox5" runat="server" class="form-control" Style="width: 200px;" TextMode="Date"></asp:TextBox>
                     <br />
                    &nbsp;<asp:Button class="btn bg-gradient-dark mb-0" ID="Button1" runat="server" Text="Add Event" OnClick="Button1_Click"/>
                </div>
                <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                    <div class="d-flex flex-column">

                        

                    </div>

                </li>
            </div>
        </div>

    </div>

</div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-bordered" DataKeyNames="Eid">
    <Columns>
        <asp:BoundField DataField="EventName" HeaderText="Event Name" />
        <asp:BoundField DataField="EventType" HeaderText="Event Type" />
        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:CommandField ShowDeleteButton="True" />
    </Columns>
</asp:GridView>


</asp:Content>
