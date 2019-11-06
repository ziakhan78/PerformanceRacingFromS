<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" Title="Administration Change Password" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            color: red;
        }

        .auto-style1 {
            text-align: right;
            width: 150px;
        }

        .auto-style2 {
            text-align: left;
            width: 750px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table class="txt" style="width: 100%;" align="center" cellpadding="3" cellspacing="5">
                <tr>
                    <td class="header_title" colspan="2">Change Admin Password
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="auto-style1"></td>
                    <td align="right"><span class="style1">* </span>Denotes mandatory fields</td>
                </tr>

                 <tr>
            
            <td  colspan="2" align="center" style="border:solid thin">
               <asp:Label ID="Label1" runat="server" 
                    Text="Note: Password has to be between 8 to 12 characters, it should be alphanumeric, case sensitive and should have one numeric field." ForeColor="Red"></asp:Label>
            </td>
        </tr>

                <tr>
                    <td class="auto-style1"><span class="style1">* </span>Current Password :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtOldPass" runat="server" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOldPass" runat="server" ControlToValidate="txtOldPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't Be Left Blank" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1"><span class="style1">* </span>New Password :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPass" runat="server" CssClass="txtBox" MaxLength="12" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't Be Left Blank" ValidationGroup="C"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,12}$" ValidationGroup="C"></asp:RegularExpressionValidator>
                        &nbsp;<asp:Button ID="btnGenPassword" runat="server" CssClass="btn" OnClick="btnGenPassword_Click" Text="Generate New Password" />
                        <br />
                        <%--<asp:RegularExpressionValidator ID="revPass" runat="server" ControlToValidate="txtPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Password has to be between 8 to 12 characters. It should be alphanumeric, case sensitive and should have one special character and one numeric field." ValidationExpression="(?=^.{8,12}$)(?=.*\d)(?=.*\W+)(?![.\n])(?=.*[a-zA-Z]).*$" ValidationGroup="C"></asp:RegularExpressionValidator>--%>
                        <telerik:RadInputManager ID="RadInputManager1" runat="server">
                            <telerik:TextBoxSetting>
                                <TargetControls>
                                    <telerik:TargetInput ControlID="txtPass" />
                                </TargetControls>
                                <PasswordStrengthSettings ShowIndicator="true" />
                                <Validation ValidationGroup="C" />
                            </telerik:TextBoxSetting>
                        </telerik:RadInputManager>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1"><span class="style1">* </span>Confirm Password :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtCPass" runat="server" CssClass="txtBox" MaxLength="12" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCPass" runat="server" ControlToValidate="txtCPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't Be Left Blank" ValidationGroup="C"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CVPass" runat="server" ControlToCompare="txtPass" ControlToValidate="txtCPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Password Mismatch" ValidationGroup="C"></asp:CompareValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style2">
                        <div align="left">
                            <div align="left">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" ValidationGroup="C" OnClick="btnSubmit_Click" />
                                &nbsp;</div>
                        </div>
                    </td>
                </tr>

            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

