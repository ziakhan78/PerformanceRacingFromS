<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ViewProductsCostingDetails.aspx.cs" Inherits="Admin_ViewProductsCostingDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/JavaScript">
<!--
    function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
    }
    //-->
    </script>

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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div align="center" style="vertical-align: top;">

                <table class="txt" style="width: 100%;" align="center" cellpadding="0" cellspacing="5">



                    <tr>
                        <td class="header_title" colspan="2">View Products Costing Details</td>
                    </tr>




                    <!-- search and sort start -->

                    <tr>
                        <td valign="top" class="style5">
                            <table>
                                <tr>
                                    <td valign="top" align="center" style="width: 195px; border-right: #f4f4f4 1px solid; border-top: #f4f4f4 1px solid; border-left: #f4f4f4 1px solid; border-bottom: #f4f4f4 1px solid" bgcolor="#f4f4f4" height="4">
                                        <b>&nbsp; ::&nbsp;Alphabetic Search&nbsp;::</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="border-collapse: collapse;" bordercolor="#f4f4f4" cellspacing="0" cellpadding="0" bgcolor="#ffffff" border="1" class="txt">
                                            <tr>
                                                <td id="TDA" onmouseover="this.style.backgroundColor='#D4D4D2'"
                                                    onmouseout="this.style.backgroundColor='#f9f9f9'" align="center">
                                                    <asp:LinkButton ID="LnkA" runat="server" OnClick="LnkA_Click" CssClass="txtSearch">A</asp:LinkButton></td>
                                                <td id="TD1" onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#f9f9f9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkB" runat="server"
                                                        OnClick="LnkB_Click" CssClass="txtSearch">B</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkC" runat="server"
                                                        OnClick="LnkC_Click" CssClass="txtSearch">C</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkD" runat="server"
                                                        OnClick="LnkD_Click" CssClass="txtSearch">D</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkE" runat="server"
                                                        OnClick="LnkE_Click" CssClass="txtSearch">E</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkF" runat="server"
                                                        OnClick="LnkF_Click" CssClass="txtSearch">F</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkG" runat="server"
                                                        OnClick="LnkG_Click" CssClass="txtSearch">G</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkH" runat="server"
                                                        OnClick="LnkH_Click" CssClass="txtSearch">H</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkI" runat="server"
                                                        OnClick="LnkI_Click" CssClass="txtSearch">I</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkJ" runat="server"
                                                        OnClick="LnkJ_Click" CssClass="txtSearch">J</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkK" runat="server"
                                                        OnClick="LnkK_Click" CssClass="txtSearch">K</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkL" runat="server"
                                                        OnClick="LnkL_Click" CssClass="txtSearch">L</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkM" runat="server"
                                                        OnClick="LnkM_Click" CssClass="txtSearch">M</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkN" runat="server" OnClick="LnkN_Click" CssClass="txtSearch">N</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkO" runat="server"
                                                        OnClick="LnkO_Click" CssClass="txtSearch">O</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkP" runat="server"
                                                        OnClick="LnkP_Click" CssClass="txtSearch">P</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkQ" runat="server"
                                                        OnClick="LnkQ_Click" CssClass="txtSearch">Q</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkR" runat="server"
                                                        OnClick="LnkR_Click" CssClass="txtSearch">R</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkS" runat="server"
                                                        OnClick="LnkS_Click" CssClass="txtSearch">S</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkT" runat="server"
                                                        OnClick="LnkT_Click" CssClass="txtSearch">T</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkU" runat="server"
                                                        OnClick="LnkU_Click" CssClass="txtSearch">U</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkV" runat="server"
                                                        OnClick="LnkV_Click" CssClass="txtSearch">V</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkW" runat="server"
                                                        OnClick="LnkW_Click" CssClass="txtSearch">W</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkX" runat="server"
                                                        OnClick="LnkX_Click" CssClass="txtSearch">X</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkY" runat="server"
                                                        OnClick="LnkY_Click" CssClass="txtSearch">Y</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="LnkZ" runat="server"
                                                        OnClick="LnkZ_Click" CssClass="txtSearch">Z</asp:LinkButton></td>
                                                <td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
                                                    align="center">
                                                    <asp:LinkButton ID="Linkbutton1" runat="server"
                                                        OnClick="Linkbutton1_Click" CssClass="txtSearch">ALL</asp:LinkButton>
                                                </td>

                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" width="300px" align="right">
                            <table style="text-align: right;" width="300px">

                                <tr>
                                    <td valign="top" align="center" style="border: 1px solid #f4f4f4;"
                                        bgcolor="#f4f4f4" class="style1">
                                        <b>&nbsp; ::&nbsp;Search By ::</b>
                                    </td>
                                </tr>
                                <tr>

                                    <td valign="top" align="right" width="100%">
                                        <asp:Panel ID="SearchPanel1" runat="server" DefaultButton="btnSearch">

                                            <table width="100%">

                                                <tr>
                                                    <td valign="top" align="left">
                                                        <asp:RadioButtonList ID="rbtnSearch" runat="server"
                                                            RepeatDirection="Horizontal">
                                                            <asp:ListItem Selected="True" Value="0">Product Name</asp:ListItem>
                                                            <asp:ListItem Value="1">SKU</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td valign="top" align="left">
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="txtBox" Width="300px"></asp:TextBox>


                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Button ID="btnSearch" runat="server" CssClass="btn"
                                                            OnClick="btnSearch_Click" Text="Search" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <!-- search and sort end -->




                    <tr>
                        <td colspan="2" align="left">


                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="dsProduct"
                                Skin="Default" PageSize="25" CssClass="treeView" OnItemCommand="RadGrid1_ItemCommand"
                                OnSortCommand="RadGrid1_SortCommand" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" OnItemDataBound="RadGrid1_ItemDataBound">
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

                                        <telerik:GridTemplateColumn HeaderText="Product Name" SortExpression="product_name">
                                            <ItemTemplate>
                                                <%# Eval("product_name") %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Font-Underline="true" />
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="sku" HeaderText="SKU"
                                            SortExpression="sku" UniqueName="sku">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle />
                                        </telerik:GridBoundColumn>



                                        <telerik:GridBoundColumn DataField="currency_type" FilterControlAltText="Filter currency_type column" HeaderText="Currency" SortExpression="currency_type" UniqueName="currency_type">
                                        </telerik:GridBoundColumn>
                                        <%--<telerik:GridBoundColumn DataField="currency_rate" DataType="System.Decimal" FilterControlAltText="Filter currency_rate column" HeaderText="currency_rate" SortExpression="currency_rate" UniqueName="currency_rate" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn DataField="price" DataType="System.Decimal" FilterControlAltText="Filter price column" HeaderText="Purchase Price" SortExpression="price" UniqueName="price" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>
                                        <%--  <telerik:GridBoundColumn DataField="selling_price" DataType="System.Decimal" FilterControlAltText="Filter selling_price column" HeaderText="MRP" SortExpression="selling_price" UniqueName="selling_price" DataFormatString="{0:n0}">
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn DataField="basic_custom_duty" DataType="System.Decimal" FilterControlAltText="Filter basic_custom_duty column" HeaderText="Basic Custom" SortExpression="basic_custom_duty" UniqueName="basic_custom_duty" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="cvd" DataType="System.Decimal" FilterControlAltText="Filter cvd column" HeaderText="CVD" SortExpression="cvd" UniqueName="CVD" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="sad" DataType="System.Decimal" FilterControlAltText="Filter sad column" HeaderText="SAD" SortExpression="sad" UniqueName="SAD" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="custom_cess" DataType="System.Decimal" FilterControlAltText="Filter custom_cess column" HeaderText="Custom Cess" SortExpression="custom_cess" UniqueName="custom_cess" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="frieght_cha" DataType="System.Decimal" FilterControlAltText="Filter frieght_cha column" HeaderText="Frieght" SortExpression="frieght_cha" UniqueName="frieght_cha" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="octroi" DataType="System.Decimal" FilterControlAltText="Filter octroi column" HeaderText="Octroi" SortExpression="octroi" UniqueName="Octroi" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="vat" DataType="System.Decimal" FilterControlAltText="Filter vat column" HeaderText="Vat" SortExpression="vat" UniqueName="Vat" DataFormatString="{0:n}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="margin_for_dealer" DataType="System.Decimal" FilterControlAltText="Filter margin_for_dealer column" HeaderText="Dealer Margin" SortExpression="margin_for_dealer" UniqueName="margin_for_dealer">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="margin" DataType="System.Decimal" FilterControlAltText="Filter margin column" HeaderText="Margin" SortExpression="margin" UniqueName="margin">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderText="MRP" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="selling_price">
                                            <ItemTemplate>
                                                &#8377;&nbsp;<%# Eval("selling_price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Dealer Price" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="dealer_price">
                                            <ItemTemplate>
                                                &#8377;&nbsp;<%# Eval("dealer_price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />
                                        </telerik:GridTemplateColumn>


                                        <%-- <telerik:GridBoundColumn DataField="dealer_price" DataType="System.Decimal" FilterControlAltText="Filter dealer_price column" HeaderText="Dealer Price" SortExpression="dealer_price" UniqueName="dealer_price">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="dealer_vat" DataType="System.Decimal" FilterControlAltText="Filter dealer_vat column" HeaderText="Dealer Vat" SortExpression="dealer_vat" UniqueName="dealer_vat">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="dealer_discount" DataType="System.Decimal" FilterControlAltText="Filter dealer_discount column" HeaderText="Dealer Discount" SortExpression="dealer_discount" UniqueName="dealer_discount">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="dealer_vat_cst" DataType="System.Decimal" FilterControlAltText="Filter dealer_vat_cst column" HeaderText="Dealer Vat/Cst" SortExpression="dealer_vat_cst" UniqueName="dealer_vat_cst">
                                        </telerik:GridBoundColumn>--%>


                                        <%--                                      

                                         <telerik:GridTemplateColumn HeaderText="Dealer Price" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="dealer_price">
                                            <ItemTemplate>
                                                &#8377;&nbsp;<%# Eval("dealer_price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

                                        </telerik:GridTemplateColumn>--%>


                                        <%-- <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">
                                            <ItemTemplate>
                                                <a href='add_products.aspx?pid=<%# Eval("pid") %>'>
                                                    <img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" />
                                                </a>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                            <ItemTemplate>
                                                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                </cc1:ConfirmButtonExtender>
                                                <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                    CommandArgument='<%# Eval("pid") %>' runat="Server"
                                                    AlternateText="Delete" ImageUrl="~/admin_icons/delete.gif" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                            <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
                                        </telerik:GridTemplateColumn>--%>
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

                            <asp:SqlDataSource ID="dsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="select * from View_Products order by product_name"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsColors" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [color_master_tbl] ORDER BY [color_name]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsProductName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Products_tbl] ORDER BY [product_name]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsSku" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Products_tbl] ORDER BY [sku]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="DSBrands" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [brand_master_tbl] ORDER BY [brand_name]"></asp:SqlDataSource>


                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblmsg" runat="server" Visible="true" CssClass="txt_validation"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Label ID="lblError" runat="server" Text="No records to display"
                                Visible="false" CssClass="txt_validation"></asp:Label>
                        </td>
                    </tr>
                </table>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

