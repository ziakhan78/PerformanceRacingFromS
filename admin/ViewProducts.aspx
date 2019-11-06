<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ViewProducts.aspx.cs" Inherits="Admin_ViewProducts" %>

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
                        <td class="header_title" colspan="2">View Products</td>
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
                                                            RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnSearch_SelectedIndexChanged">
                                                            <asp:ListItem Selected="True" Value="0">Product Name</asp:ListItem>
                                                            <asp:ListItem Value="1">SKU</asp:ListItem>
                                                            <%--<asp:ListItem Value="2">GST</asp:ListItem>
                                                            <asp:ListItem Value="3">HC Code</asp:ListItem>--%>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td valign="top" align="left">
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="txtBox" Width="300px"></asp:TextBox>
                                                         <%--<asp:DropDownList ID="ddlGST" runat="server" CssClass="txtBox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                <asp:ListItem Text="28" Value="28"></asp:ListItem>
                            </asp:DropDownList>--%>
                                                     
                                    
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
                        <td colspan="3" align="left">
                            <asp:Panel ID="Pid" runat="server" GroupingText="Sort Products">
                                <table>
                                    <tr>
                                        <td align="right" valign="middle"><b>Sort By :</b></td>
                                        <td align="left"><b>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                                                RepeatDirection="Horizontal" AutoPostBack="True"
                                                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                                                <asp:ListItem Value="1">Category</asp:ListItem>
                                                <%--  <asp:ListItem Value="2">Price</asp:ListItem>
                                                <asp:ListItem Value="3">Colors</asp:ListItem>--%>
                                                <asp:ListItem Value="6">Fitment</asp:ListItem>
                                                <asp:ListItem Value="4">Brands</asp:ListItem>
                                                <asp:ListItem Value="5">Exclusive</asp:ListItem>
                                            </asp:RadioButtonList></b>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="left" colspan="2">
                                            <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" CssClass="txtBox" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlSubcategory" runat="server" AutoPostBack="True" CssClass="txtBox" OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:DropDownList ID="DDLColors" runat="server" DataSourceID="dsColors" DataTextField="color_name" DataValueField="id" AppendDataBoundItems="true" AutoPostBack="True" CssClass="txtBox" OnSelectedIndexChanged="DDLColors_SelectedIndexChanged">
                                                <asp:ListItem>Select</asp:ListItem>
                                            </asp:DropDownList>


                                            <asp:DropDownList ID="DDLPrice" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="DDLPrice_SelectedIndexChanged" CssClass="txtBox">

                                                <asp:ListItem>Select Price Range</asp:ListItem>
                                                <asp:ListItem Text="Below &#8377; 25,000" Value="0 - 25000"></asp:ListItem>
                                                <asp:ListItem Text="&#8377; 25,000 - &#8377; 50,000" Value="25000 - 50000"></asp:ListItem>
                                                <asp:ListItem Text="&#8377; 50,000 - &#8377; 75,000" Value="50000 - 75000"></asp:ListItem>
                                                <asp:ListItem Text="&#8377; 75,000 - &#8377; 1,00,000" Value="75000 - 100000"></asp:ListItem>
                                                <asp:ListItem Text="&#8377; 1,00,000 and Above" Value="100000 - 10000000"></asp:ListItem>

                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlBrands" runat="server" AppendDataBoundItems="True" CssClass="txtBox" DataSourceID="DSBrands" DataTextField="brand_name" DataValueField="id" OnSelectedIndexChanged="ddlBrands_SelectedIndexChanged" AutoPostBack="True">
                                                <asp:ListItem Text="Select" Value="Select">Select</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RadioButtonList ID="rbtnFitment" runat="server" CssClass="txt" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnFitment_SelectedIndexChanged">
                                                <asp:ListItem Value="0" Text="Universal"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Bike Specific"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="txtBox" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddlManufacturer_SelectedIndexChanged">
                                                <asp:ListItem Value="Select" Text="Select">Select Manufacturer</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlModel" runat="server" CssClass="txtBox" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddlModel_SelectedIndexChanged">
                                                <asp:ListItem Value="Select" Text="Select">Select Model</asp:ListItem>
                                            </asp:DropDownList>

                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>


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

                                        <%--     <telerik:GridTemplateColumn HeaderText="Thumbnail">
                                            <ItemTemplate>
                                                <img src='../ProductsImages/<%#Eval("images") %>' alt="" style="border-width: 0px; height: 50px; width: 50px;" />
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>--%>


                                        <telerik:GridTemplateColumn HeaderText="Thumbnail">
                                            <ItemTemplate>
                                                <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                <%-- <img src='../CategoryImages/<%#Eval("cat_image") %>' alt="" style="border-width: 0px; height: 50px; width: 50px;" />--%>
                                                <%-- <img src='../ProductsImages/<%#Eval("images") %>' alt="" style="border-width: 0px; height: 50px; width: 50px;" />--%>
                                                <asp:Image ID="img1" runat="server" BorderWidth="0" Height="50px" Width="50px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>


                                        <%--  <telerik:GridBoundColumn DataField="product_name"
                                            HeaderText="Product Name"
                                            SortExpression="product_name" UniqueName="product_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>--%>

                                        <telerik:GridTemplateColumn HeaderText="Product Name" SortExpression="product_name">
                                            <ItemTemplate>
                                                <a href="javascript:void(0)" onclick="MM_openBrWindow('ViewProductDetails.aspx?id=<%# Eval("pid") %>','01111','width=760, height=670, scrollbars=1')"><u><%# Eval("product_name") %></u></a>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Font-Underline="true" />
                                        </telerik:GridTemplateColumn>



                                        <telerik:GridBoundColumn DataField="sku" HeaderText="SKU"
                                            SortExpression="sku" UniqueName="sku">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>






                                        <%--   <telerik:GridBoundColumn DataField="color"
                                            HeaderText="Color"
                                            SortExpression="color" UniqueName="color">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>--%>


                                        <telerik:GridBoundColumn DataField="cat_name"
                                            HeaderText="Category"
                                            SortExpression="cat_name" UniqueName="cat_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="subcat_name"
                                            HeaderText="Subcategory"
                                            SortExpression="subcat_name" UniqueName="subcat_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="fitment"
                                            HeaderText="Fitment"
                                            SortExpression="fitment" UniqueName="fitment">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="manufacturer_name"
                                            HeaderText="Mfg"
                                            SortExpression="manufacturer_name" UniqueName="manufacturer_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="model_name"
                                            HeaderText="Model"
                                            SortExpression="model_name" UniqueName="model_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>


                                        <telerik:GridBoundColumn DataField="brand_name"
                                            HeaderText="Brands"
                                            SortExpression="brand_name" UniqueName="brand_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderText="Weight (kg)" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="weight">
                                            <ItemTemplate>
                                                <%# Eval("weight", "{0:n3}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

                                        </telerik:GridTemplateColumn>




                                        <telerik:GridTemplateColumn HeaderText="Basic Price" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="price">
                                            <ItemTemplate>
                                                &#8377;&nbsp;<%# Eval("price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Selling Price" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="price">
                                            <ItemTemplate>
                                                &#8377;&nbsp;<%# Eval("selling_price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

                                        </telerik:GridTemplateColumn>

                                      <%--  <telerik:GridTemplateColumn HeaderText="Dealer Price" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="dealer_price">
                                            <ItemTemplate>
                                                &#8377;&nbsp;<%# Eval("dealer_price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

                                        </telerik:GridTemplateColumn>--%>

                                        <telerik:GridTemplateColumn HeaderText="GST(%)" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="vat">
                                            <ItemTemplate>
                                                <%# Eval("vat") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

                                        </telerik:GridTemplateColumn>


                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">
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

