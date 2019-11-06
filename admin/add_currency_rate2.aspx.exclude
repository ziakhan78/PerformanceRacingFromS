<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_currency_rate2.aspx.cs" Inherits="admin_add_currency_rate2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 102px;
        }
        .style2
        {
            width: 130px;
        }
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    
    <ContentTemplate>
     <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center"><asp:Label ID="lblHeading" runat="server" ></asp:Label></td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>
     
      
      
        <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Add Dollor Rate : </td>
           
            <td >
                <telerik:RadNumericTextBox ID="txtDollorRate" runat="server" Skin="Silk" CssClass="txtBox" MaxLength="5" MinValue="0" Width="80px">
                    <NegativeStyle Resize="None"></NegativeStyle>
                    <NumberFormat ZeroPattern="n" DecimalDigits="2" GroupSeparator=""></NumberFormat>                    
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox>
                
                
                
                
                <asp:RequiredFieldValidator ID="RFVDistNo" runat="server" 
                    ControlToValidate="txtDollorRate" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CVDistNo" runat="server" 
                    ControlToValidate="txtDollorRate" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="* Already Exists." 
                    onservervalidate="CVDistNo_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
            </td>
           
        </tr>

           <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Add Pound Rate : </td>
           
            <td >
                <telerik:RadNumericTextBox ID="txtPoundRate" runat="server" Skin="Silk" CssClass="txtBox" MaxLength="5" MinValue="0" Width="80px">
                    <NegativeStyle Resize="None"></NegativeStyle>
                    <NumberFormat ZeroPattern="n" DecimalDigits="2" GroupSeparator=""></NumberFormat>                    
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox>
                
                
                
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtDollorRate" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="txtDollorRate" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="* Already Exists." 
                    onservervalidate="CVDistNo_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
            </td>
           
        </tr>

           <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Add Euro Rate : </td>
           
            <td >
                <telerik:RadNumericTextBox ID="txtEuroRate" runat="server" Skin="Silk" CssClass="txtBox" MaxLength="5" MinValue="0" Width="80px">
                    <NegativeStyle Resize="None"></NegativeStyle>
                    <NumberFormat ZeroPattern="n" DecimalDigits="2" GroupSeparator=""></NumberFormat>                    
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox>
                
                
                
                
                <asp:RequiredFieldValidator ID="rfvEuro" runat="server" 
                    ControlToValidate="txtEuroRate" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvEuro" runat="server" 
                    ControlToValidate="txtEuroRate" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="* Already Exists." 
                    onservervalidate="CVDistNo_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
            </td>
           
        </tr>

          <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" >Add Yen Rate : </td>
           
            <td >
                <telerik:RadNumericTextBox ID="txtYenRate" runat="server" Skin="Silk" CssClass="txtBox" MaxLength="5" MinValue="0" Width="80px">
                    <NegativeStyle Resize="None"></NegativeStyle>
                    <NumberFormat ZeroPattern="n" DecimalDigits="2" GroupSeparator=""></NumberFormat>                    
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox>
                
              
            </td>
           
        </tr>



        <tr>
            <td class="style2" ></td>
           
            <td align="left">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" 
                    onclick="btnSubmit_Click" ValidationGroup="O"  />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn" 
                    CausesValidation="False" Width="59px" onclick="btnCancel_Click" />
              
            </td>
        </tr>

          <tr>
            <td class="style2" ></td>
           
            <td align="left">
               <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" DataSourceID="DSDollor"
                            AllowSorting="True" Skin="Default" PageSize="100" OnItemCommand="RadGrid1_ItemCommand" GridLines="None">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSDollor">
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>

                                <ExpandCollapseColumn>
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

                                    <telerik:GridBoundColumn DataField="dollor_rate" HeaderText="Dollor Rate"
                                        SortExpression="dollor_rate" UniqueName="dollor_rate">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                      <telerik:GridBoundColumn DataField="pound_rate" HeaderText="Pound Rate"
                                        SortExpression="pound_rate" UniqueName="pound_rate">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="euro_rate" HeaderText="Euro Rate"
                                        SortExpression="euro_rate" UniqueName="euro_rate">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                      <telerik:GridBoundColumn DataField="yen_rate" HeaderText="Yen Rate"
                                        SortExpression="yen_rate" UniqueName="yen_rate">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>


                                     <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_currency_rate.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /> </a>
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
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="DSDollor" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM [currency_rate_tbl] order by dollor_rate"></asp:SqlDataSource>
              
            </td>
        </tr>
       
    </table>
    </ContentTemplate>
    <Triggers>
    <asp:PostBackTrigger ControlID="btnSubmit"  />
    </Triggers>
    </asp:UpdatePanel>
</asp:Content>

