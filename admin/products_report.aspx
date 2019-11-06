<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="products_report.aspx.cs" Inherits="admin_products_report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function SelectAllCheckboxes(spanChk) {

            // Added as ASPX uses SPAN for checkbox
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;

            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    //elm[i].click();
                    if (elm[i].checked != xState)
                        elm[i].click();
                    //elm[i].checked=xState;
                }
        }

    </script>
    <script type="text/javascript">

        function confirm_delete() {
            if (confirm("Are you sure you want to delete?") == true)
                return true;
            else
                return false;
        }

    </script>



    <style type="text/css">
        .style1 {
            width: 116%;
        }

        .mainlinks {
            background-color: #C1A9DB;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div align="center" style="vertical-align: top;">

                <table class="txt" style="width: 100%;" align="center" cellpadding="0" cellspacing="5">
                    
                    <tr>
                        <td class="header_title">Export to Excel Products Report</td>
                    </tr>


                    <tr>
                        <td align="left">
                            <asp:Panel ID="Pid" runat="server" GroupingText="Sorting Products">
                                <table>
                                    <tr>
                                        <td align="right" valign="middle"><b>Sort By :</b></td>
                                        <td width="310"><b>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                                                RepeatDirection="Horizontal" AutoPostBack="True"
                                                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                                                <asp:ListItem Value="1">Category</asp:ListItem>
                                                <asp:ListItem Value="2">Price</asp:ListItem>


                                            </asp:RadioButtonList></b>
                                        </td>
                                        <td align="left">

                                            <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" CssClass="txt" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlSubcategory" runat="server" AutoPostBack="True" CssClass="txt" OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged">
                                            </asp:DropDownList>



                                            <asp:DropDownList ID="DDLPrice" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="DDLPrice_SelectedIndexChanged" CssClass="txt">

                                                <asp:ListItem>Select Price Range</asp:ListItem>
                                                <asp:ListItem Text="Below &#8377; 25,000" Value="0 - 25000"></asp:ListItem>
                                                <asp:ListItem Text="&#8377; 25,000 - &#8377; 50,000" Value="25000 - 50000"></asp:ListItem>
                                                <asp:ListItem Text="&#8377; 50,000 - &#8377; 75,000" Value="50000 - 75000"></asp:ListItem>
                                                <asp:ListItem Text="&#8377; 75,000 - &#8377; 1,00,000" Value="75000 - 100000"></asp:ListItem>
                                                <asp:ListItem Text="&#8377; 1,00,000 and Above" Value="100000 - 10000000"></asp:ListItem>

                                            </asp:DropDownList>


                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>


                    <tr>
                        <td align="left">


                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="dsProduct" OnItemDataBound="RadGrid1_ItemDataBound"
                                Skin="Default" PageSize="25" CssClass="treeView" OnItemCommand="RadGrid1_ItemCommand" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated"
                                OnHTMLExporting="RadGrid1_HtmlExporting"
                                OnBiffExporting="RadGrid1_BiffExporting"
                                OnSortCommand="RadGrid1_SortCommand" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged">
                                <HeaderContextMenu EnableAutoScroll="True">
                                </HeaderContextMenu>
                                <HeaderStyle Font-Bold="True" />
                               
                                <MasterTableView AutoGenerateColumns="False" CellSpacing="-1" DataSourceID="dsProduct">
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Created="True">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                    <Columns>

                                        <telerik:GridTemplateColumn HeaderText="Sr.">
                                            <ItemTemplate>
                                                <%# Container.DataSetIndex +1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Thumbnail">
                                            <ItemTemplate>                                             
                                                 <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>                                             
                                                <asp:Image ID="img1" runat="server" BorderWidth="0" Height="50px" Width="50px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>


                                        <telerik:GridBoundColumn DataField="product_name"
                                            HeaderText="Product Name"
                                            SortExpression="product_name" UniqueName="product_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" HorizontalAlign="Left" />
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="sku" HeaderText="SKU"
                                            SortExpression="sku" UniqueName="sku">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" Width="90px" HorizontalAlign="Left" />
                                            <ItemStyle VerticalAlign="Top" Width="90px" HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>



                                        <telerik:GridBoundColumn DataField="cat_name"
                                            HeaderText="Category"
                                            SortExpression="cat_name" UniqueName="cat_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" HorizontalAlign="Left" />
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="subcat_name"
                                            HeaderText="Subcategory"
                                            SortExpression="subcat_name" UniqueName="subcat_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" HorizontalAlign="Left" />
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                     

                                        <telerik:GridTemplateColumn HeaderText="Price" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="price">
                                            <ItemTemplate>
                                                <%# Eval("price", "{0:N0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

                                        </telerik:GridTemplateColumn>


                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                        </EditColumn>
                                    </EditFormSettings>
                                    <ItemStyle CssClass="treeView" />
                                    <AlternatingItemStyle CssClass="treeView" />
                                    <PagerStyle PageSizeControlType="RadComboBox" />
                                </MasterTableView>
                                <PagerStyle PageSizeControlType="RadComboBox" />
                                <FilterMenu EnableImageSprites="False">
                                </FilterMenu>
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="dsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="select * from View_Products "></asp:SqlDataSource>
                           

                            <asp:SqlDataSource ID="dsProductName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Products_tbl] ORDER BY [productName]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsSku" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Products_tbl] ORDER BY [sku]"></asp:SqlDataSource>


                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblmsg" runat="server" BorderColor="#808080" BorderStyle="Solid"
                                BorderWidth="3px" Visible="true" Font-Bold="True" Width="250px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblError" runat="server" Text="No records to display"
                                Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <div>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/Excel_HTML.png"
                                    OnClick="ImageButton_Click" AlternateText="Html" Visible="false" />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="Images/Excel_ExcelML.png"
                                    OnClick="ImageButton_Click" AlternateText="ExcelML" Visible="false" />
                                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/admin_icons/exl.gif"
                                    OnClick="ImageButton_Click" AlternateText="Biff" />

                            </div>
                        </td>
                    </tr>
                </table>

            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageButton3" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
