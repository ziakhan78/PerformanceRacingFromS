<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_barcode.aspx.cs" Inherits="admin_add_barcode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtCode" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnGenerate" runat="server" Text="Button" OnClick="btnGenerate_Click1" /><br />
    <asp:PlaceHolder ID="plBarCode" runat="server" />
</asp:Content>

