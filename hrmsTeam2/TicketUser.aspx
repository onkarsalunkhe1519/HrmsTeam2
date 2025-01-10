<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TicketUser.aspx.cs" Inherits="hrmsTeam2.TicketUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 600px; margin: auto; padding: 20px; border: 1px solid #ccc;">
    <h2>Raise a Ticket</h2>
    
    <!-- Display User Email -->
    <p>
        Email: 
        <asp:Label ID="lblEmail" runat="server" Font-Bold="true"></asp:Label>
    </p>
    
    <!-- Subject Query TextBox -->
    <p>
        Subject Query: 
        <asp:TextBox ID="txtQuery" runat="server" Width="100%"></asp:TextBox>
    </p>

    <!-- Error Message Label -->
    <p>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </p>
    
    <!-- Submit Button -->
    <p>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </p>

    <!-- Display Ticket Details -->
    <h2>Ticket Details</h2>
    <asp:GridView ID="gvTickets" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" Width="100%">
        <Columns>
            <asp:BoundField DataField="TicketID" HeaderText="Ticket ID" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="SubjectQuery" HeaderText="Query" />
            <asp:BoundField DataField="DateCreated" HeaderText="Date Created" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
        </Columns>
    </asp:GridView>
</div>
</asp:Content>
