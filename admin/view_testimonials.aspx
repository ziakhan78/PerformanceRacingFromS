<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_testimonials.aspx.cs" Inherits="admin_view_testimonials" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">
                <tr>
                    <td align="center" colspan="2" class="header_title">View Testimonials</td>
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
                                    <table width="100%">


                                        <tr>
                                            <td valign="top" bordercolor="#ffffff" align="left">
                                                <asp:RadioButtonList ID="rbtnSearch" runat="server"
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="0">Name</asp:ListItem>
                                                    <asp:ListItem Value="1">Text</asp:ListItem>
                                                   
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
                                   

                                    <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter name column" HeaderText="Name" SortExpression="name" UniqueName="name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="designation" FilterControlAltText="Filter designation column" HeaderText="Designation" SortExpression="designation" UniqueName="designation">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle  VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                       <telerik:GridBoundColumn DataField="brand" FilterControlAltText="Filter brand column" HeaderText="Brand" SortExpression="brand" UniqueName="brand">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                       <telerik:GridBoundColumn DataField="product" FilterControlAltText="Filter product column" HeaderText="Product" SortExpression="product" UniqueName="product">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle  VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>



                                    <telerik:GridBoundColumn DataField="testimonial" FilterControlAltText="Filter testimonial column" HeaderText="Testimonials" SortExpression="testimonial" UniqueName="testimonial">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle  VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                       <telerik:GridTemplateColumn HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                             <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                            <asp:DropDownList ID="chkActive" runat="server" AutoPostBack="true" CssClass="txt" OnSelectedIndexChanged="chkActive_SelectedIndexChanged">                                               
                                                <asp:ListItem>Active</asp:ListItem>
                                                <asp:ListItem>Inactive</asp:ListItem>
                                            </asp:DropDownList>

                                        </ItemTemplate>
                                       <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="60px"></ItemStyle>
                                    </telerik:GridTemplateColumn>


                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_testimonials.aspx?id=<%# Eval("id") %>'>
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




