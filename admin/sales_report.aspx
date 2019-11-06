<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="sales_report.aspx.cs" Inherits="admin_sales_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="txt">
        <tr>
            <td class="header_title">Export to Excel Sales Report
            </td>
        </tr>

        <tr>
            <td>
                <%--  <div style="overflow-y: scroll; width:100%;">--%>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="treeView"
                    DataSourceID="DSSalesReport" Width="100%" DataKeyNames="Cart_Id">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" SortExpression="OrderNo" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DSSalesReport" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * from View_Orders"></asp:SqlDataSource>
                <%-- </div>--%>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server"
                    OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
                &nbsp;<asp:Button ID="btnPDF" runat="server" CssClass="btn" OnClick="btnPDF_Click" Text="Export to PDF" />
                <%-- &nbsp;<asp:Button ID="btnCSV" runat="server" CssClass="btn" OnClick="btnCSV_Click" Text="Export to CSV" />--%>
&nbsp;<asp:Button ID="btnWord" runat="server" CssClass="btn" OnClick="btnWord_Click" Text="Export to Word" />
                <%--&nbsp;<asp:Button ID="btnExcel2" runat="server" CssClass="btn" OnClick="btnExcel2_Click" Text="Export to Excel-2" />--%>
            </td>
        </tr>
    </table>
</asp:Content>

