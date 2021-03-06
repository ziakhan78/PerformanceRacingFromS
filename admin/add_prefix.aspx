﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_prefix.aspx.cs" Inherits="admin_add_prefix" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">Add Prefix</td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

                <tr>
                    <td align="right" valign="top" style="width: 100px;">
                        <span class="auto-style1">* </span>Prefix :</td>

                    <td>
                        <asp:TextBox ID="txtPrefix" runat="server" Width="200px"
                            TextMode="SingleLine" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVtxtPrefix" runat="server"
                            ControlToValidate="txtPrefix" Display="Dynamic" ErrorMessage="Can't left blank !"
                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CVprefix" runat="server" ControlToValidate="txtPrefix" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVprefix_ServerValidate" ValidationGroup="C"></asp:CustomValidator>
                    </td>
                </tr>

                <tr>
                    <td></td>

                    <td>
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" OnClick="btnAdd_Click" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Reset" /></td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

