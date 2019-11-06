<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_event_registration.aspx.cs" Inherits="admin_view_event_registration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
     <table style="width:100%;" class="txt" >

        <tr>
            <td colspan="3" class="header_title">View Events Registration Master</td>
        </tr>

        <tr>
            <td>
                <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                                 AllowSorting="True" DataSourceID="SqlDataSource1" GridLines="None" 
                                 Skin="WebBlue"  PageSize="50" CellSpacing="0">                    

                    <MasterTableView autogeneratecolumns="False" datasourceid="SqlDataSource1" DataKeyNames="id">
                       
                        <CommandItemSettings ExportToPdfText="Export to PDF" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                        </ExpandCollapseColumn>
                       
                        <Columns>

                             <telerik:GridTemplateColumn HeaderText="Sr.">
        <ItemTemplate>
        <%# Container.DataSetIndex +1 %>
        </ItemTemplate>
        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
        </telerik:GridTemplateColumn>

                           <%-- <telerik:GridBoundColumn DataField="id" HeaderText="id" HeaderStyle-Font-Underline="true"
                                                     SortExpression="id" UniqueName="id" DataType="System.Int32" FilterControlAltText="Filter id column" ReadOnly="True">
                            </telerik:GridBoundColumn>--%>

                            <telerik:GridBoundColumn DataField="event_title" HeaderText="Event Title" SortExpression="event_title" UniqueName="event_title" FilterControlAltText="Filter event_title column">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="event_date" DataType="System.DateTime" FilterControlAltText="Filter event_date column" HeaderText="Event Date" SortExpression="event_date" UniqueName="event_date" DataFormatString="{0:dd/MM/yyyy}">
                                <ItemStyle Width="80px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="event_time" DataType="System.DateTime" FilterControlAltText="Filter event_time column" HeaderText="Event Time" SortExpression="event_time" UniqueName="event_time" DataFormatString="{0:hh:mm tt}">
                                <ItemStyle Width="80px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="venue" FilterControlAltText="Filter venue column" HeaderText="Venue" SortExpression="venue" UniqueName="venue">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="host_club" FilterControlAltText="Filter host_club column" HeaderText="Host Club" SortExpression="host_club" UniqueName="host_club">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orgnized_by" FilterControlAltText="Filter orgnized_by column" HeaderText="Orgnized By" SortExpression="orgnized_by" UniqueName="orgnized_by">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="event_charge" DataType="System.Decimal" FilterControlAltText="Filter event_charge column" HeaderText="Charge" SortExpression="event_charge" UniqueName="event_charge" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:n}">
                            </telerik:GridBoundColumn>
                             <%-- <telerik:GridBoundColumn DataField="event_closing_date" DataType="System.DateTime" FilterControlAltText="Filter event_closing_date column" HeaderText="Closing Date" SortExpression="event_closing_date" UniqueName="event_closing_date" DataFormatString="{0:dd/MM/yyyy}">
                                <ItemStyle Width="80px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="event_closing_time" DataType="System.DateTime" FilterControlAltText="Filter event_closing_time column" HeaderText="Closing Time" SortExpression="event_closing_time" UniqueName="event_closing_time" DataFormatString="{0:HH:mm:ss tt}">
                                <ItemStyle Width="80px" />
                            </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="cheque_drawn_on" FilterControlAltText="Filter cheque_drawn_on column" HeaderText="cheque_drawn_on" SortExpression="cheque_drawn_on" UniqueName="cheque_drawn_on">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="cheque_receiver_name" FilterControlAltText="Filter cheque_receiver_name column" HeaderText="cheque_receiver_name" SortExpression="cheque_receiver_name" UniqueName="cheque_receiver_name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="address" FilterControlAltText="Filter address column" HeaderText="Address" SortExpression="address" UniqueName="address">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="mobile" FilterControlAltText="Filter mobile column" HeaderText="Mobile" SortExpression="mobile" UniqueName="mobile">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="emailId" FilterControlAltText="Filter emailId column" HeaderText="Email-Id" SortExpression="emailId" UniqueName="emailId">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="emailTo" FilterControlAltText="Filter emailTo column" HeaderText="Email-To" SortExpression="emailTo" UniqueName="emailTo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="emailCC" FilterControlAltText="Filter emailCC column" HeaderText="Email-CC" SortExpression="emailCC" UniqueName="emailCC">
                            </telerik:GridBoundColumn>
                           <telerik:GridCheckBoxColumn DataField="status" DataType="System.Boolean" FilterControlAltText="Filter status column" HeaderText="status" SortExpression="status" UniqueName="status">
                            </telerik:GridCheckBoxColumn>
                            <telerik:GridBoundColumn DataField="added_date" DataType="System.DateTime" FilterControlAltText="Filter added_date column" HeaderText="added_date" SortExpression="added_date" UniqueName="added_date">
                            </telerik:GridBoundColumn>--%>

                             <telerik:GridTemplateColumn  HeaderText="Edit" AllowFiltering="False"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top" 
                           ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                     <ItemTemplate>
                             <a href='add_event_registration.aspx?id=<%# Eval("id") %>'>Edit</a>
                         </ItemTemplate>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></HeaderStyle>

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
                    </MasterTableView>
                    <HeaderStyle Font-Bold="True" /><AlternatingItemStyle CssClass="treeView" /><ItemStyle CssClass="treeView" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Dist_Event_Reg_Master_tbl] order by event_date desc"></asp:SqlDataSource>
               
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



