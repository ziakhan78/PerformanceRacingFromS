<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_pincode.aspx.cs" Inherits="admin_view_pincode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">
                <tr>
                    <td align="center" colspan="2" class="header_title">View Pincode</td>
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
                                    <table width="100%">


                                        <tr>
                                            <td valign="top" bordercolor="#ffffff" align="left">
                                                <asp:RadioButtonList ID="rbtnSearch" runat="server"
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="0">State</asp:ListItem>
                                                    <asp:ListItem Value="1">City</asp:ListItem>
                                                    <asp:ListItem Value="2">Pincode</asp:ListItem>

                                                </asp:RadioButtonList>

                                            </td>
                                        </tr>



                                        <tr>
                                            <td valign="top" bordercolor="#ffffff" align="left">
                                                <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0"
                                                    BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:Button ID="btnSearch" runat="server" CssClass="btn"
                                                    OnClick="btnSearch_Click" Text="Search" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <!-- search and sort end -->

                <tr>
                    <td colspan="2">

                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" Culture="en-IN" PageSize="25" GridLines="None" OnItemCommand="RadGrid1_ItemCommand" Skin="Default" OnItemDataBound="RadGrid1_ItemDataBound" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" OnSortCommand="RadGrid1_SortCommand">
                            <MasterTableView DataKeyNames="id">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True" Created="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>




                                    <telerik:GridBoundColumn DataField="state_name" FilterControlAltText="Filter state_name column" HeaderText="State" SortExpression="state_name" UniqueName="state_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle Width="300px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="city_name" FilterControlAltText="Filter city_name column" HeaderText="City" SortExpression="city_name" UniqueName="city_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle Width="250px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="pincode" FilterControlAltText="Filter pincode column" HeaderText="Pincode" SortExpression="pincode" UniqueName="pincode">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle Width="100px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn HeaderText="Service Available">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                            <asp:DropDownList ID="chkActive" runat="server" AutoPostBack="true" CssClass="txt" OnSelectedIndexChanged="chkActive_SelectedIndexChanged">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>

                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="60px"></ItemStyle>
                                    </telerik:GridTemplateColumn>


                                         <telerik:GridTemplateColumn HeaderText="COD">
                                        <ItemTemplate>
                                            
                                            <asp:Label ID="lblCod" runat="server" Text='<%# Eval("cod") %>' Visible="false"></asp:Label>

                                            <asp:DropDownList ID="chkCod" runat="server" AutoPostBack="true" CssClass="txt" OnSelectedIndexChanged="chkCod_SelectedIndexChanged" >
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>

                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="60px"></ItemStyle>
                                    </telerik:GridTemplateColumn>



                                    
<%--                                         <telerik:GridTemplateColumn HeaderText="Free Shipping">
                                        <ItemTemplate>
                                          
                                            <asp:Label ID="lblFreeShipping" runat="server" Text='<%# Eval("free_shipping") %>' Visible="false"></asp:Label>

                                            <asp:DropDownList ID="chkFreeShipping" runat="server" AutoPostBack="true" CssClass="txt" >
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>

                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="60px"></ItemStyle>
                                    </telerik:GridTemplateColumn>--%>


                                     <telerik:GridTemplateColumn HeaderText="Transportation Time (in Days)">
                                        <ItemTemplate>
                                            
                                            <asp:Label ID="lblDeliveryTime" runat="server" Text='<%# Eval("transportation_time") %>' Visible="false"></asp:Label>

                                            <asp:TextBox ID="txtDeliveryTime" runat="server" Width="30px" Text='<%# Eval("transportation_time") %>'></asp:TextBox>

                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="60px"></ItemStyle>
                                    </telerik:GridTemplateColumn>




                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_pincode_delivery.aspx?id=<%# Eval("id") %>'>
                                                <img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" />
                                            </a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                        <ItemTemplate>
                                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                            </cc1:ConfirmButtonExtender>
                                            <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                CommandArgument='<%# Eval("id") %>' runat="Server"
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
                                <PagerStyle PageSizeControlType="RadComboBox" />
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <PagerStyle PageSizeControlType="RadComboBox" />
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>

                        <%-- <asp:SqlDataSource ID="DSTestimonials" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [testimonials_tbl] order by name asc"></asp:SqlDataSource>--%>

                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lblError" runat="server" Text="No records to display"
                            Visible="false"></asp:Label>
                    </td>
                </tr>



            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>




