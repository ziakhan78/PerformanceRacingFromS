<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_store_sales_report.aspx.cs" Inherits="admin_view_store_sales_report" %>

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
                        <td class="header_title">Export to Excel Store Sales Report</td>
                    </tr>



                     <tr>
                        <td align="left">
                            <asp:Panel ID="Pid" runat="server" GroupingText="Sort By">
                                <table>
                                    <tr>                                      
                                        <td width="310"><b>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                                                RepeatDirection="Horizontal" AutoPostBack="True"
                                                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                                                <asp:ListItem Value="1">Pending</asp:ListItem>
                                                <asp:ListItem Value="2">Processing</asp:ListItem>
                                                 <asp:ListItem Value="3">Completed</asp:ListItem>

                                            </asp:RadioButtonList></b>                                        </td>
                                      
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>


                    <tr>
                        <td align="left">


                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="DSSalesReport"
                                Skin="Default" PageSize="25" CssClass="treeView" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated"
                                OnHTMLExporting="RadGrid1_HtmlExporting"
                                OnBiffExporting="RadGrid1_BiffExporting"  >
                                <HeaderContextMenu EnableAutoScroll="True">
                                </HeaderContextMenu>
                                <HeaderStyle Font-Bold="True" />
                             
                                <MasterTableView AutoGenerateColumns="False" CellSpacing="-1" DataSourceID="DSSalesReport">
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


                                        <telerik:GridBoundColumn DataField="OrderNo"
                                            HeaderText="Order No."
                                            SortExpression="OrderNo" UniqueName="OrderNo">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" HorizontalAlign="Left" Width="60px" />
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="60px" />
                                        </telerik:GridBoundColumn>

                                        
                                    <telerik:GridBoundColumn DataField="CreatedOn" AllowFiltering="false" HeaderText="Order Date" SortExpression="CreatedOn" UniqueName="CreatedOn" DataFormatString="{0:dd-MM-yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Underline="true" Width="75px" />
                                        <ItemStyle HorizontalAlign="Left" Width="75px" />
                                    </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Name" HeaderText="Name"
                                            SortExpression="Name" UniqueName="Name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" HorizontalAlign="Left" />
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>



                                        <telerik:GridBoundColumn DataField="email"
                                            HeaderText="Email"
                                            SortExpression="email" UniqueName="email">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" HorizontalAlign="Left" />
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Mobile"
                                            HeaderText="Mobile"
                                            SortExpression="Mobile" UniqueName="Mobile">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" HorizontalAlign="Left" Width="70px" />
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="70px" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Status"
                                            HeaderText="Status"
                                            SortExpression="Status" UniqueName="Status">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" HorizontalAlign="Left" Width="70px" />
                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" Width="70px" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderText="Total Amount" SortExpression="TotalAmount">
                                            <ItemTemplate>
                                                <%# Eval("TotalAmount", "{0:N0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="80px" HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" Font-Underline="true" Width="80px" />

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

                            <asp:SqlDataSource ID="DSSalesReport" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * from View_Orders where OrderFrom='Store' order by CreatedOn desc"></asp:SqlDataSource>

                        </td>
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
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/Excel_HTML.png" ToolTip="Export to Excel"
                                    OnClick="ImageButton_Click" AlternateText="Html" Visible="false" />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="Images/Excel_ExcelML.png" ToolTip="Export to Excel"
                                    OnClick="ImageButton_Click" AlternateText="ExcelML" Visible="false" />
                                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/admin_icons/exl.gif" ToolTip="Export to Excel"
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
