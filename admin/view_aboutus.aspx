<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_aboutus.aspx.cs" Inherits="admin_view_aboutus" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">
                <tr>
                    <td align="center" colspan="2" class="header_title">View About Us</td>
                </tr>

                <tr>
                    <td colspan="2">

                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" Culture="en-IN" PageSize="25" DataSourceID="DSAboutUs" GridLines="None" >
                            <MasterTableView DataKeyNames="Contents" DataSourceID="DSAboutUs">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True" Created="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>

                                   <%-- <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                 --%>

                                                                  

                                  <telerik:GridBoundColumn DataField="contents" FilterControlAltText="Filter contents column" HeaderText="Contents" SortExpression="contents" UniqueName="contents">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>


<%--                                    <telerik:GridTemplateColumn HeaderText="Contents" SortExpression="contents">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("contents") %>'></asp:Label>

                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>--%>



                                     <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_aboutus.aspx?id=1'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /> </a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
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

                        <asp:SqlDataSource ID="DSAboutUs" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [aboutus_tbl]">
                          
                        </asp:SqlDataSource>

                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>







