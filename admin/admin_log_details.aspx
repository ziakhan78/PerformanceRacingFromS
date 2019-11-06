<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="admin_log_details.aspx.cs" Inherits="admin_admin_log_details" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 1015px;" class="txt">
                <tr>
                    <td align="center" colspan="2" class="header_title">View Log Report</td>
                </tr>
                <tr>
                    <td>

                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" Culture="en-IN" Skin="WebBlue" PageSize="25" GridLines="None" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" OnSortCommand="RadGrid1_SortCommand">
                            <MasterTableView DataKeyNames="id">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>



                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                          
                                    <telerik:GridBoundColumn DataField="username" FilterControlAltText="Filter username column" HeaderText="Username" SortExpression="username" UniqueName="username">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                  <%--  <telerik:GridBoundColumn DataField="password" FilterControlAltText="Filter password column" HeaderText="Password" SortExpression="password" UniqueName="password">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>

                                    <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="Email-Id" SortExpression="email" UniqueName="email">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                   <telerik:GridBoundColumn DataField="login_type" FilterControlAltText="Filter login_type column" HeaderText="User Type" SortExpression="login_type" UniqueName="login_type">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>


                                    <telerik:GridBoundColumn DataField="login_date" FilterControlAltText="Filter login_date column" HeaderText="Login Date" SortExpression="login_date" UniqueName="login_date" DataType="System.DateTime" DataFormatString="{0:dd MMM, yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="login_date" FilterControlAltText="Filter login_date column" HeaderText="Login Time" SortExpression="login_date" UniqueName="login_date" DataType="System.DateTime" DataFormatString="{0:hh:mm:ss}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="logout_date" DataType="System.DateTime" FilterControlAltText="Filter logout_date column" HeaderText="Logout Date" SortExpression="logout_date" UniqueName="logout_date" DataFormatString="{0:dd MMM, yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="logout_date" DataType="System.DateTime" FilterControlAltText="Filter logout_date column" HeaderText="Logout Time" SortExpression="logout_date" UniqueName="logout_date" DataFormatString="{0:hh:mm:ss}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="ipaddress" FilterControlAltText="Filter ipaddress column" HeaderText="Ipaddress" SortExpression="ipaddress" UniqueName="ipaddress">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                </Columns>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                                <PagerStyle PageSizeControlType="RadComboBox" />
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                            <AlternatingItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                            <PagerStyle PageSizeControlType="RadComboBox" />
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>

                        <%-- <asp:SqlDataSource ID="DSLog" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [admin_log_tbl] order by id desc"></asp:SqlDataSource>--%>

                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

