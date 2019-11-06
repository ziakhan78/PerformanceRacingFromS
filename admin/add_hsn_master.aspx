<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_hsn_master.aspx.cs" Inherits="Admin_add_hsn_master" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 102px;
        }

        .style2 {
            width: 160px;
            text-align: right;
        }

        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
                <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                    <tr>
                        <td colspan="2" class="header_title" align="center">
                            <asp:Label ID="lblHeading" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td align="right" valign="top">&nbsp;</td>
                        <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                    </tr>

                      <tr>
                        <td class="style2" align="right" valign="top"><span class="auto-style1">*</span>HS Code : </td>
                        <td valign="top">
                            <asp:TextBox ID="txtHSCode" runat="server" CssClass="txtBox" Width="200"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVHSCode" runat="server" ControlToValidate="txtHSCode" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CVHScode" runat="server" ControlToValidate="txtHSCode" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVcategory_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
                        </td>
                    </tr>

                   

                 

                    <tr>
                        <td class="style2" align="right" valign="top"><span class="auto-style1">*</span>GST : </td>
                        <td valign="top">
                            <asp:DropDownList ID="ddlGST" runat="server" CssClass="txtBox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                 <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                <asp:ListItem Text="28" Value="28"></asp:ListItem>
                            </asp:DropDownList>
                           <%-- <telerik:RadNumericTextBox ID="txtVat" runat="server" CssClass="txtBox" MaxLength="5" MinValue="0" Skin="Silk" Width="80px" MaxValue="100">
                                <NegativeStyle Resize="None" />
                                <NumberFormat DecimalDigits="2" GroupSeparator="" ZeroPattern="n" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </telerik:RadNumericTextBox>--%>
                            %<asp:RequiredFieldValidator ID="RFVVat" runat="server" ControlToValidate="ddlGST" InitialValue="0" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select GST!" ValidationGroup="O"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                  

                     <tr>
                        <td class="style2" align="right" valign="top">Custom Duty : </td>

                        <td valign="top">

                            <telerik:RadNumericTextBox ID="txtCustomDuty" runat="server" CssClass="txtBox" MaxLength="5" MinValue="0" Skin="Silk" Width="80px" MaxValue="100">
                                <NegativeStyle Resize="None" />
                                <NumberFormat DecimalDigits="2" GroupSeparator="" ZeroPattern="n" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </telerik:RadNumericTextBox>

                            %<%--<asp:RequiredFieldValidator ID="RFVCustomDuty" runat="server"
                                ControlToValidate="txtCustomDuty" CssClass="txt_validation" Display="Dynamic"
                                ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>--%></td>

                    </tr>



                    <tr>
                        <td class="style2"></td>

                        <td align="left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn"
                                OnClick="btnSubmit_Click" ValidationGroup="O" />
                            &nbsp;</td>
                    </tr>

                </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

