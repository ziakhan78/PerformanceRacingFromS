<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ViewProductBarcode.aspx.cs" Inherits="Admin_ViewProductBarcode"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
                        <td class="header_title" colspan="2">
                            
                           
                            View Products Barcode</td>
                    </tr>                   

                    <tr>
                        <td colspan="2" align="left">
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
                                            </asp:RadioButtonList></b>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="left" colspan="2">
                                            <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" CssClass="txtBox" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlSubcategory" runat="server" AutoPostBack="True" CssClass="txtBox" OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged">
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
                                OnSortCommand="RadGrid1_SortCommand" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" >
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
                                        <ItemStyle  VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle  Font-Underline="true" />
                                    </telerik:GridTemplateColumn>





                                    


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

                                   

                                


                                        <telerik:GridBoundColumn DataField="brand_name"
                                            HeaderText="Brands"
                                            SortExpression="brand_name" UniqueName="brand_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>

                                     
                                        
                                        <telerik:GridBoundColumn DataField="sku" HeaderText="SKU"
                                            SortExpression="sku" UniqueName="sku">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true"  />
                                            <ItemStyle VerticalAlign="Top" Width="100px"  />
                                        </telerik:GridBoundColumn>

                                          <telerik:GridTemplateColumn HeaderText="No. of Label">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("pid") %>' Visible="false"></asp:Label>
                                            <telerik:RadNumericTextBox ID="txtNoOfLabel" runat="server" Width="40" MaxLength="3" NumberFormat-DecimalDigits="0" CssClass="txtBox" ></telerik:RadNumericTextBox></ItemTemplate>
                                            <ItemStyle  VerticalAlign="Top" HorizontalAlign="Right"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Right"   />
                                    </telerik:GridTemplateColumn>



                                     <%--   <telerik:GridTemplateColumn HeaderText="MRP" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="selling_price">
                                            <ItemTemplate>
                                                &#8377;&nbsp;<%# Eval("selling_price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

                                        </telerik:GridTemplateColumn>

                                         <telerik:GridTemplateColumn HeaderText="Dealer Price" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="dealer_price">
                                            <ItemTemplate>
                                                &#8377;&nbsp;<%# Eval("dealer_price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="50px" />

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

                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Generate Label" CssClass="btn" OnClick="btnSubmit_Click" /></td>
                    </tr>
                    <tr>
                    
                        <td align="center" colspan="2">                        


   <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">                               
                            </rsweb:ReportViewer>
                        <%-- <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="gi_PerformanceRacingStoreDataSetTableAdapters.View_ProductsBarcodeTableAdapter"></asp:ObjectDataSource>--%>


                        


                      </td>
                    </tr>
                </table>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

