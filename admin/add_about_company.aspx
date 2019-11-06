<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_about_company.aspx.cs" Inherits="admin_add_about_company" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
            width: 1015px;
        }

        .auto-style2 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="txt" style="width: 100%;" align="center" cellpadding="0" cellspacing="5">
                <tr>
                    <td class="header_title">Add About Company
                    </td>
                </tr>

                <tr>
                    <td align="right">
                        <span class="auto-style2">* </span>Denotes mandatory fields</td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <div align="left">
                            <telerik:RadEditor ID="RadEditor1" runat="server" Height="550px" Width="100%" Skin="Default">
                            </telerik:RadEditor>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <div align="left">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Cancel" />
                        </div>
                    </td>
                </tr>

            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

