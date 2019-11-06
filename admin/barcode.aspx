<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="barcode.aspx.cs" Inherits="admin_barcode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <telerik:RadBarcode ID="RadBarcode1" runat="server" Height="158px" Text="abcd1234" Type="QRCode" Width="201px" ></telerik:RadBarcode>
</asp:Content>

