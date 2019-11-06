<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ViewStoreOrders.aspx.cs" Inherits="admin_ViewStoreOrders" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="txt" style="width: 100%;">
                <tr>
                    <td class="header_title" colspan="3">View Store Order Reports</td>
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

                                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
                                        <table width="100%">


                                            <tr>
                                                <td valign="top" bordercolor="#ffffff" align="left">
                                                    <asp:RadioButtonList ID="rbtnSearch" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnSearch_SelectedIndexChanged">
                                                        <asp:ListItem Selected="True" Value="0">Order No.</asp:ListItem>
                                                        <asp:ListItem Value="1">Order Date</asp:ListItem>
                                                        <asp:ListItem Value="2">Email</asp:ListItem>
                                                    </asp:RadioButtonList>

                                                </td>
                                            </tr>



                                            <tr>
                                                <td valign="top" bordercolor="#ffffff" align="left">
                                                    <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0"
                                                        BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                                    <asp:Panel ID="PanelDate" runat="server">
                                    <table class="style5">
                                        <tr>
                                            <td>
                                                From :</td>
                                            <td>
                                                <telerik:RadDatePicker ID="dateFrom" Runat="server" Width="102px">
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                To :</td>
                                            <td>
                                                 <telerik:RadDatePicker ID="dateTo" Runat="server" Width="102px">
                                                </telerik:RadDatePicker>
                                             
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center"> <asp:Button ID="btnSortdateSubmit" runat="server" 
                                                    onclick="btnSortdateSubmit_Click" Text="Submit" CssClass="btn" /></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
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
                    <td align="left" colspan="3">


                        <telerik:RadGrid ID="RadGrid1" runat="server"
                            AllowPaging="True" AllowSorting="True" DataSourceID="dsOrders" GridLines="None"
                            Skin="Default" PageSize="25" CssClass="mainlinks" >
                            <HeaderContextMenu EnableAutoScroll="True">
                            </HeaderContextMenu>
                            <HeaderStyle Font-Bold="True" />
                            <%-- <AlternatingItemStyle BackColor="#E9E0ED" />
                    <PagerStyle BackColor="#E9E0ED" />--%>
                            <MasterTableView AutoGenerateColumns="False" CellSpacing="-1" DataSourceID="dsOrders">
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

                                    <telerik:GridTemplateColumn HeaderText="Order No." SortExpression="OrderNo">
                                        <ItemTemplate>
                                            <a href='OrderDetail.aspx?CartID=<%# Eval("Cart_Id") %>&CustID=<%# Eval("Cust_Id") %>&type=Store'><%# Eval("OrderNo") %></a>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Underline="true" Width="70px" />
                                        <ItemStyle HorizontalAlign="Left" Width="70px" />
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="CreatedOn" AllowFiltering="false" HeaderText="Order Date" SortExpression="CreatedOn" UniqueName="CreatedOn" DataFormatString="{0:dd-MM-yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Underline="true" Width="75px" />
                                        <ItemStyle HorizontalAlign="Left" Width="75px" />
                                    </telerik:GridBoundColumn>


<%--                                    <telerik:GridTemplateColumn HeaderText="Name" SortExpression="Name">
                                        <ItemTemplate>
                                            <a href='OrderDetail.aspx?CartID=<%# Eval("Cart_Id") %>&CustID=<%# Eval("Cust_Id") %>'><%# Eval("Name")%></a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Font-Underline="true" Width="175px" />
                                        <ItemStyle HorizontalAlign="Left" Width="175px" />
                                    </telerik:GridTemplateColumn>--%>

                                      <telerik:GridTemplateColumn HeaderText="Name" SortExpression="Name">
                                        <ItemTemplate>
                                             <a href="javascript:void(0)" onclick="MM_openBrWindow('ViewCustomerDetails.aspx?custID=<%# Eval("Cust_Id") %>','01111','width=650,height=450')"><%# Eval("Name") %></a>                       
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>




                                    <telerik:GridTemplateColumn HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <a href='OrderDetail.aspx?CartID=<%# Eval("Cart_Id") %>&CustID=<%# Eval("Cust_Id") %>&type=Store'><%# Eval("email") %></a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Font-Underline="true" Width="275px" />
                                        <ItemStyle HorizontalAlign="Left" Width="275px" />
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="Mobile" AllowFiltering="false" HeaderText="Mobile" SortExpression="Mobile" UniqueName="Mobile">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Underline="true" Width="85px" />
                                        <ItemStyle HorizontalAlign="Left" Width="85px" />
                                    </telerik:GridBoundColumn>

                                      <telerik:GridBoundColumn DataField="city" AllowFiltering="false" HeaderText="City" SortExpression="city" UniqueName="city">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Underline="true"  />
                                        <ItemStyle HorizontalAlign="Left"  />
                                    </telerik:GridBoundColumn>



                                   <telerik:GridBoundColumn DataField="Status" HeaderText="Status" AllowFiltering="false" HeaderStyle-Font-Underline="true" 
                                        SortExpression="Status" UniqueName="Status">
                                    </telerik:GridBoundColumn>

                               <%--     <telerik:GridTemplateColumn HeaderText="Status" SortExpression="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Cart_Id") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' Visible="false"></asp:Label>

                                            <asp:DropDownList ID="chkActive" runat="server" AutoPostBack="true" CssClass="txt" OnSelectedIndexChanged="chkActive_SelectedIndexChanged" >
                                                <asp:ListItem>Pending</asp:ListItem>                                               
                                                <asp:ListItem>Processing</asp:ListItem>
                                                <asp:ListItem>Completed</asp:ListItem>                                                
                                            </asp:DropDownList>

                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="60px"></ItemStyle>
                                    </telerik:GridTemplateColumn>--%>




                                    <telerik:GridTemplateColumn HeaderText="Total Amounts" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="TotalAmount">
                                        <ItemTemplate>
                                            &#8377;&nbsp;<%# Eval("TotalAmount", "{0:N0}")%>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="115px" />
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Width="115px" Font-Underline="true" />


                                    </telerik:GridTemplateColumn>

                                     <telerik:GridTemplateColumn HeaderText="Print">
                                        <ItemTemplate>
                                            <a href='PrintOrderDetails.aspx?CartID=<%# Eval("Cart_Id") %>&CustID=<%# Eval("Cust_Id") %>&type=Store' target="_blank">Print</a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Right" Font-Underline="true" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridTemplateColumn>





                                </Columns>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                                <PagerStyle PageSizeControlType="RadComboBox" />
                            </MasterTableView>
                            <ItemStyle VerticalAlign="Top" />
                            <PagerStyle PageSizeControlType="RadComboBox" />
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>

                        </telerik:RadGrid>
                        
                        <asp:SqlDataSource ID="dsOrders" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * from View_Orders where OrderFrom='Store' order by CreatedOn desc"></asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

