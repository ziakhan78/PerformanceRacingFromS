<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ViewCustomer.aspx.cs" Inherits="Admin_ViewCustomer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%-- <script type="text/javascript" >
    function open_win(url_add) {
        window.open(url_add, 'welcome', 'width=620,height=450,menubar=no,status=no,location=no,toolbar=no,scrollbars=no');
    }
 </script>--%>

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

        
    <table class="txt" style="width: 100%" cellpadding="3" cellspacing="5">

        <tr>
            <td colspan="3" class="header_title">View Registered Users</td>
        </tr>



        <!-- search and sort start -->

        <tr>
            <td valign="top" class="style5">
                <table>
                    <tr>
                        <td valign="top" align="center" style="width: 195px; BORDER-RIGHT: #f4f4f4 1px solid; BORDER-TOP: #f4f4f4 1px solid; BORDER-LEFT: #f4f4f4 1px solid; BORDER-BOTTOM: #f4f4f4 1px solid" bgcolor="#f4f4f4" height="4">
                            <b>&nbsp; ::&nbsp;Alphabetic Search&nbsp;::</b>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table style="BORDER-COLLAPSE: collapse;" bordercolor="#f4f4f4" cellspacing="0" cellpadding="0" bgcolor="#ffffff" border="1" class="txt">
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
                                        <asp:RadioButtonList ID="rbtnSearch" runat="server"
                                            RepeatDirection="Horizontal" AutoPostBack="false" >
                                            <asp:ListItem Selected="True" Value="0">Name</asp:ListItem>
                                            <asp:ListItem Value="1">Email Id</asp:ListItem>
                                             <asp:ListItem Value="2">Mobile No.</asp:ListItem>                                            
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


<%--        <tr>

            <td width="100%" align="left" colspan="3">
                <asp:Button ID="btnSendLoginPass" runat="server" CssClass="btn"
                    OnClick="btnSendLoginPass_Click" Text="Send Login Id Password" /></td>
        </tr>--%>


        <tr>
            <td align="left" colspan="3">


                <telerik:RadGrid ID="RadGrid1" runat="server"
                    AllowPaging="True" AllowSorting="True" Skin="Default"
                    AutoGenerateColumns="False" OnItemCommand="RadGrid1_ItemCommand"
                    PageSize="25" OnSortCommand="RadGrid1_SortCommand"
                    OnPageIndexChanged="RadGrid1_PageIndexChanged"
                    OnPageSizeChanged="RadGrid1_PageSizeChanged">
                    <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                    <MasterTableView>
                        <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                        <Columns>


                            <telerik:GridTemplateColumn HeaderText="Sr.">
                                <ItemTemplate>
                                    <%# Container.DataSetIndex +1 %>
                                </ItemTemplate>
                                <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridTemplateColumn>


                            <telerik:GridTemplateColumn HeaderText="Name" SortExpression="billFName">
                                <ItemTemplate>
                                    <%-- <asp:Label ID="lblName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>--%>
                                    <a href="javascript:void(0)" onclick="MM_openBrWindow('ViewCustomerDetails.aspx?custID=<%# Eval("id") %>','01111','width=650,height=650')"><%# Eval("billFName") %>&nbsp;<%# Eval("billLName") %></a><%--<a HREF="javascript:void(0)"onclick="window.open('ViewCustomerDetails.aspx?custID=<%# Eval("CustomerID") %>','welcome','width=620')"><%# Eval("FirstName") %></a>--%>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                            </telerik:GridTemplateColumn>




                            <telerik:GridTemplateColumn HeaderText="Email" SortExpression="email">
                                <ItemTemplate>
                                    <a href="mailto:<%# Eval("email") %>"><%# Eval("email") %></a>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Mobile" SortExpression="billMobile">
                                <ItemTemplate>
                                    <%# Eval("billMobileCC")%> <%# Eval("billMobile")%>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Phone" SortExpression="billPhone">
                                <ItemTemplate>
                                    <%# Eval("billPhoneCC")%> <%# Eval("billPhoneAC")%> <%# Eval("billPhone")%>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                            </telerik:GridTemplateColumn>


                            <telerik:GridTemplateColumn HeaderText="State" SortExpression="state_name">
                                <ItemTemplate>
                                    <%# Eval("state_name")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                            </telerik:GridTemplateColumn>

                              <telerik:GridTemplateColumn HeaderText="Country" SortExpression="country_name">
                                <ItemTemplate>
                                    <%# Eval("country_name")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                            </telerik:GridTemplateColumn>



                           <%-- <telerik:GridTemplateColumn HeaderText="Billing Address" SortExpression="BillAddress1">
                                <ItemTemplate>
                                    <%# Eval("BillAddress1")%> <%# Eval("BillAddress2")%>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                            </telerik:GridTemplateColumn>--%>








                            <%-- <telerik:GridCheckBoxColumn DataField="Status" DataType="System.Boolean" AllowFiltering="false" 
            HeaderText="Status" SortExpression="Status" UniqueName="Publish">
            <ItemStyle Width="10%" />
        </telerik:GridCheckBoxColumn>--%>



                            <%--<telerik:GridTemplateColumn  HeaderText="View Details" AllowFiltering="False">

                   <ItemTemplate>               
                <a HREF="javascript:void(0)"onclick="window.open('ViewCustomerDetails.aspx?custID=<%# Eval("CustomerID") %>','welcome','width=620')">View Details</a>
                </ItemTemplate>

 <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
 <HeaderStyle HorizontalAlign="Center" />
</telerik:GridTemplateColumn>--%>

                           


<%--                            <telerik:GridTemplateColumn HeaderText="Send Login Id" FilterControlToolTip="Select for sending mail" >
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblcid" runat="server" Text='<%# Eval("CustomerID") %>' Visible="false"></asp:Label>
                                    <asp:CheckBox ID="chkActive" runat="server" TextAlign="Left"></asp:CheckBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right"  VerticalAlign="Top"></ItemStyle>

                            </telerik:GridTemplateColumn>--%>


                            <%--   <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                <ItemTemplate>
                                    <a href='EditCustomer.aspx?CustID=<%# Eval("CustomerID") %>'>
                                        <img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" />
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
                            </telerik:GridTemplateColumn>--%>

                            <%--  <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                <ItemTemplate>
                                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                    </cc1:ConfirmButtonExtender>
                                    <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                        CommandArgument='<%# Eval("CustomerID") %>' runat="Server"
                                        AlternateText="Delete" ImageUrl="~/admin_icons/delete.gif" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
                            </telerik:GridTemplateColumn>--%>
                        </Columns>

                    </MasterTableView>
                    <HeaderStyle Font-Bold="True" />
                </telerik:RadGrid>


            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblError" runat="server" Text="No records to display" CssClass="txt_validation"
                    Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

