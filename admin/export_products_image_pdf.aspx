<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="export_products_image_pdf.aspx.cs" Inherits="admin_export_products_image_pdf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns = "false" Font-Names = "Arial" >
            <Columns>
               <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                <asp:BoundField DataField="sku" HeaderText="sku" SortExpression="sku" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:TemplateField  ItemStyle-Height = "100" ItemStyle-Width = "100">
                    <ItemTemplate>
                       <asp:Image ID="Image1" runat="server" ImageUrl = '<%# Eval("images", GetUrl("{0}")) %>' Height="100px" Width="100px" />
                    </ItemTemplate> 
                </asp:TemplateField> 
            </Columns> 
        </asp:GridView>
        <%--<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="pid" HeaderText="pid" ReadOnly="True" SortExpression="pid" />
                <asp:BoundField DataField="cid" HeaderText="cid" SortExpression="cid" />
                <asp:BoundField DataField="sid" HeaderText="sid" SortExpression="sid" />
                <asp:BoundField DataField="ssid" HeaderText="ssid" SortExpression="ssid" />
                <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                <asp:BoundField DataField="sku" HeaderText="sku" SortExpression="sku" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
                <asp:BoundField DataField="height" HeaderText="height" SortExpression="height" />
                <asp:BoundField DataField="width" HeaderText="width" SortExpression="width" />
                <asp:BoundField DataField="length" HeaderText="length" SortExpression="length" />
                <asp:BoundField DataField="depth" HeaderText="depth" SortExpression="depth" />
                <asp:BoundField DataField="production_time" HeaderText="production_time" SortExpression="production_time" />
                <asp:BoundField DataField="delivery_time" HeaderText="delivery_time" SortExpression="delivery_time" />
                <asp:BoundField DataField="product_desc" HeaderText="product_desc" SortExpression="product_desc" />
                <asp:BoundField DataField="material" HeaderText="material" SortExpression="material" />
                <asp:BoundField DataField="colors" HeaderText="colors" SortExpression="colors" />
                <asp:BoundField DataField="style" HeaderText="style" SortExpression="style" />
                <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                <asp:BoundField DataField="assembly_type" HeaderText="assembly_type" SortExpression="assembly_type" />
                <asp:BoundField DataField="room_type" HeaderText="room_type" SortExpression="room_type" />
                <asp:BoundField DataField="product_tag" HeaderText="product_tag" SortExpression="product_tag" />
                <asp:BoundField DataField="video_link" HeaderText="video_link" SortExpression="video_link" />
                <asp:BoundField DataField="images" HeaderText="images" SortExpression="images" />
                <asp:BoundField DataField="displayOrder" HeaderText="displayOrder" SortExpression="displayOrder" />
                <asp:CheckBoxField DataField="isLatestProduct" HeaderText="isLatestProduct" SortExpression="isLatestProduct" />
                <asp:CheckBoxField DataField="isExclusive" HeaderText="isExclusive" SortExpression="isExclusive" />
                <asp:CheckBoxField DataField="isCOD" HeaderText="isCOD" SortExpression="isCOD" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                <asp:BoundField DataField="addedDate" HeaderText="addedDate" SortExpression="addedDate" />
                <asp:CheckBoxField DataField="deleted" HeaderText="deleted" SortExpression="deleted" />
                <asp:BoundField DataField="cat_name" HeaderText="cat_name" SortExpression="cat_name" />
                <asp:BoundField DataField="cat_image" HeaderText="cat_image" SortExpression="cat_image" />
                <asp:BoundField DataField="subcat_name" HeaderText="subcat_name" SortExpression="subcat_name" />
                <asp:BoundField DataField="subsubcat_name" HeaderText="subsubcat_name" SortExpression="subsubcat_name" />
            </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [View_Products]"></asp:SqlDataSource>--%>
        <br />
        <asp:Button ID="btnExportWord" CommandArgument = "Word" runat="server" Text="Export-Word" OnClick = "Export_Grid" />
        <asp:Button ID="btnExportExcel" CommandArgument = "Excel" runat="server" Text="Export-Excel" OnClick = "Export_Grid" />
        <asp:Button ID="btnExportPDF" CommandArgument = "PDF" runat="server" Text="Export-PDF" OnClick = "Export_Grid" />
</asp:Content>

