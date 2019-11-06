<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_user_registration.aspx.cs" Inherits="admin_add_user_registration" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }

        .auto-style2 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <table class="txt" style="width: 1015px;" align="center">

                <tr>
                    <td colspan="4" class="header_title">User Registration</td>
                </tr>


                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right" colspan="2">
                        <span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

                <tr>
                    <td colspan="4" class="header_subtitle">Login Information</td>
                </tr>
                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> First Name</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtFName" runat="server" Width="200px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFname" runat="server" ControlToValidate="txtFName" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> Last Name</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtLName" runat="server" Width="200px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLname" runat="server" ControlToValidate="txtLName" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right">Mobile No.</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <telerik:RadTextBox ID="txtMobCC" Runat="server" LabelWidth="64px" MaxLength="3" Width="35px" Text="+91">
                     </telerik:RadTextBox>
                     &nbsp;-</span>&nbsp;
                     <telerik:RadNumericTextBox ID="txtMobile" Runat="server" MaxLength="10" Width="100px">
<NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator="" GroupSizes="9"></NumberFormat>
                     </telerik:RadNumericTextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> Email Id</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtEmail" runat="server" Width="300px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> Confirm Email Id</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtCEmailId" runat="server" Width="300px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCEmail" runat="server" ControlToValidate="txtCEmailId" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> Username</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtUsername" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div align="right"><span class="auto-style1">*</span> Password</div>
                    </td>
                    <td>:</td>
                    <td colspan="2">
                        <div align="left">
                            <telerik:RadTextBox ID="txtPass" runat="server" MaxLength="12" TextMode="Password" LabelWidth="64px" type="password" Width="180px">
                                <PasswordStrengthSettings ShowIndicator="true" />
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right"><span class="auto-style1">*</span> Confirm Password</div>
                    </td>
                    <td class="auto-style2">:</td>
                    <td class="auto-style2" colspan="2">
                        <div align="left">
                            <div align="left">
                                <telerik:RadTextBox ID="txtCPass" runat="server" MaxLength="12" TextMode="Password" Width="80px" LabelWidth="32px" type="password">
                                </telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="rfvCPass" runat="server" ControlToValidate="txtCPass" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CVPass" runat="server" ControlToCompare="txtPass" ControlToValidate="txtCPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Password Mismatch" ValidationGroup="u"></asp:CompareValidator>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td colspan="4" class="header_subtitle">Billing Information</td>
                </tr>

                <%-- <tr>
                    <td>
                        <div align="right">
                            <span class="auto-style1">*</span> Payment Type
                        </div>
                    </td>
                    <td>:</td>
                    <td class="auto-style2">
                        <asp:RadioButtonList ID="rbtnMode" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" >
                            <asp:ListItem Selected="True" Value="0">Credit / Debit Card</asp:ListItem>
                            <asp:ListItem Value="1">Paypal</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>--%>




                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> Street Address 1</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtAdd1" runat="server" Width="500px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAdd" runat="server" ControlToValidate="txtAdd1" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right">Street Address 2</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtAdd2" runat="server" Width="500px" CssClass="txt"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> City</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtCity" runat="server" Width="200px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> Postal Code</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtPin" runat="server" Width="110px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPin" runat="server" ControlToValidate="txtPin" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <div align="right"><span class="auto-style1">*</span> Country</div>
                    </td>
                    <td valign="top">:</td>
                    <td colspan="2">
                        <div align="left">
                            <asp:TextBox ID="txtCountry" runat="server" Width="200px" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="txtCountry" CssClass="txt_validation" ErrorMessage="Can't Be Left Blank" ValidationGroup="u"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="style3">&nbsp;</td>
                    <td class="style1">&nbsp;</td>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" ValidationGroup="u" OnClick="btnSubmit_Click" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Cancel" />
                    </td>
                </tr>

            </table>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>


