<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TicketAdmin.aspx.cs" Inherits="hrmsTeam2.TicketAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

           <asp:GridView ID="gvAdminTickets" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="TicketID" HeaderText="TicketID" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="SubjectQuery" HeaderText="Query" />
        <asp:BoundField DataField="Solution" HeaderText="Solution" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
        <asp:BoundField DataField="AssignedBy" HeaderText="AssignedBy" />
        <asp:BoundField DataField="ResolvedBy" HeaderText="ResolvedBy" />
        <asp:BoundField DataField="DateCreated" HeaderText="Date" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnReply" runat="server" Text="Reply" CommandName="Reply" OnClick="btnReply_Click" CommandArgument='<%# Eval("TicketID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        <asp:Panel ID="pnlSolution" runat="server" Visible="false">
            <h3>Reply to Ticket</h3>
            Solution: <asp:TextBox ID="txtSolution" runat="server"></asp:TextBox><br />
            
            <!-- Error message label for solution -->
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label><br />
            
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
            <asp:HiddenField ID="hfTicketID" runat="server" />
        </asp:Panel>
</asp:Content>
