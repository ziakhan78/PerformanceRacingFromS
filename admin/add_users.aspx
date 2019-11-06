<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_users.aspx.cs" Inherits="admin_add_users" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            color: #f00;
        }

        .style2 {
            text-align: right;
        }

        .style4 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="width: 100%;" class="txt" cellpadding="3" cellspacing="5">

                <tr>
                    <td align="center" colspan="2" class="header_title">Add Admin Users</td>
                </tr>

                <tr>
                    <td align="right" colspan="2"><span class="style1">*</span> Denotes Mandatory field.
                    </td>
                </tr>

                <tr>
                    <td class="style2">
                        <span class="style1">*</span>
                        First Name : </td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtFirstName" runat="server" LabelWidth="64px" Width="300px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                            ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Can't be left blank"
                            ValidationGroup="add" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style2">
                        <span class="style1">*</span>
                        Last Name : </td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtLastName" runat="server" LabelWidth="64px" Width="300px" CssClass="txtBox" Skin="Silk" AutoPostBack="True" OnTextChanged="txtLastName_TextChanged">
                        </telerik:RadTextBox><asp:RequiredFieldValidator ID="rfvLastname" runat="server"
                            ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Can't be left blank"
                            ValidationGroup="add" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>



                <tr>
                    <td class="style2">Designation : </td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtDesignation" runat="server" LabelWidth="64px" Width="300px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <span class="style1">*</span>
                        Username : </td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtUsername" runat="server" LabelWidth="64px" Width="300px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                            ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Can't be left blank"
                            ValidationGroup="add" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        &nbsp;<asp:CustomValidator ID="cvUsername" runat="server"
                            ControlToValidate="txtUsername" Display="Dynamic"
                            ErrorMessage="User name allready exists."
                            OnServerValidate="cvuname_ServerValidate" ValidationGroup="add" CssClass="txt_validation"></asp:CustomValidator>
                        <br />
                        <%--   <asp:RegularExpressionValidator ID="revUsername" runat="server" 
                        ControlToValidate="txtUsername" Display="Dynamic" 
                        ErrorMessage="Invalid Username Length must be (5-10) chars." 
                        ValidationExpression="^[a-zA-Z0-9]([a-z\d]){4,9}$" ValidationGroup="add" CssClass="txt_validation"></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <span class="style1">*</span>
                        Password : </td>
                    <td class="style4">
                        <asp:TextBox ID="txtPassword" runat="server"
                            Width="293px" TextMode="Password" CssClass="txtBox" MaxLength="15" />

                        <cc1:PasswordStrength ID="PasswordTextBox_PasswordStrength" runat="server"
                            Enabled="True" TargetControlID="txtPassword">
                        </cc1:PasswordStrength>

                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Can't be left blank"
                            ValidationGroup="add" CssClass="txt_validation"></asp:RequiredFieldValidator>

                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPassword" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Password should be 6-15 characters in length, should have atleast 1 lowercase, 1 uppercase character and 1 no." ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$" ValidationGroup="add"></asp:RegularExpressionValidator>--%>

                        <asp:RegularExpressionValidator ID="revPass" runat="server" ControlToValidate="txtPassword" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Password should be 6-15 characters in length." ValidationExpression="^[\s\S]{6,15}$" ValidationGroup="add"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <span class="style1">*</span>
                        Confirm Password : </td>
                    <td class="style4">
                        <asp:TextBox ID="txtConfirmPassword" runat="server"
                            Text='<%# Bind("Password") %>' TextMode="Password" Width="293px" CssClass="txtBox" MaxLength="15" />
                        <asp:RequiredFieldValidator ID="rfname1" runat="server"
                            ControlToValidate="txtConfirmPassword" Display="Dynamic"
                            ErrorMessage="Can't be left blank" ValidationGroup="add" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                            Display="Dynamic" ErrorMessage="Password doesn't match" ValidationGroup="add" CssClass="txt_validation"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td class="style2">
                        <span class="style1">* </span>Permissions : </td>
                    <td class="style4">
                        <asp:CheckBox ID="UViewCheckBox" runat="server" Checked='True' Text="View" />
                        &nbsp;
                    <asp:CheckBox ID="UAddCheckBox" runat="server" Checked='<%# Bind("UAdd") %>' Text="Add" />
                        &nbsp;
                    <asp:CheckBox ID="UEditCheckBox" runat="server" Checked='<%# Bind("UEdit") %>' Text="Edit" />
                        &nbsp;
                    <asp:CheckBox ID="UDeleteCheckBox" runat="server" Checked='<%# Bind("UDelete") %>' Text="Delete" />
                    </td>
                </tr>

                <tr>
                    <td class="style2">
                        <span class="style1">*</span>
                        Email Address : </td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtEmail" runat="server" LabelWidth="64px" Width="300px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox><asp:RequiredFieldValidator ID="rfemail" runat="server"
                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Can't be left blank"
                            ValidationGroup="add" CssClass="txt_validation"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="revemail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                                ErrorMessage="Invalid email id"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ValidationGroup="add" CssClass="txt_validation"></asp:RegularExpressionValidator><asp:CustomValidator
                                    ID="cvemail" runat="server"
                                    ControlToValidate="txtEmail" Display="Dynamic"
                                    ErrorMessage="Emai id allready exists "
                                    OnServerValidate="cvemail_ServerValidate" ValidationGroup="add" CssClass="txt_validation"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td class="style2">
                        <span class="style1">*</span>
                        Mobile No. : </td>
                    <td class="style4">
                        <span>
                            <telerik:RadTextBox ID="txtMobCC" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>
                            -</span>
                        <telerik:RadNumericTextBox ID="txtMobile" runat="server" MaxLength="10" Width="90px" CssClass="txtBox" Skin="Silk">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                            ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Can't be left blank"
                            ValidationGroup="add" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Phone No. : </td>
                    <td class="style4">
                        <span>
                            <telerik:RadTextBox ID="txtPhCC" runat="server" LabelWidth="64px" Width="40px" MaxLength="3" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>
                            -</span>
                        <span>
                            <telerik:RadTextBox ID="txtPhAC" runat="server" LabelWidth="64px" Width="45px" MaxLength="4" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>
                            &nbsp;-</span>&nbsp;
                    <telerik:RadNumericTextBox ID="txtPhone" runat="server" MaxLength="8" Width="90px" CssClass="txtBox" Skin="Silk">
                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style2">Address Line 1:</td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtAddress1" runat="server" LabelWidth="64px" Width="450px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Address Line 2:</td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtAddress2" runat="server" LabelWidth="64px" Width="450px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style2">City : </td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtCity" runat="server" LabelWidth="64px" Width="250px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Stadte : </td>
                    <td class="style4">
                        <telerik:RadTextBox ID="txtState" runat="server" LabelWidth="64px" Width="250px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox>
                    </td>
                </tr>


                <tr>
                    <td class="style2" width="150"></td>
                    <td class="style4">
                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" Text="Submit" CssClass="btn" ValidationGroup="add" OnClick="btnSubmit_Click" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" Text="Cancel" CssClass="btn" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


