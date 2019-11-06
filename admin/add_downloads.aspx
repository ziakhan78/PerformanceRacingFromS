<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_downloads.aspx.cs" Inherits="admin_add_downloads" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }

        .auto-style2 {
            text-align: right;
            width: 100px;
        }

        .auto-style3 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">Add Downloads</td>
                </tr>

                <tr>
                    <td class="auto-style2" valign="top">&nbsp;</td>
                    <td class="style2" align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>


                <tr>
                    <td valign="top" class="auto-style2">
                        <span class="style1"><span class="auto-style1">* </span></span>Name :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtCompany" runat="server" Width="350px"
                            TextMode="SingleLine" CssClass="txt" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                            ControlToValidate="txtCompany" Display="Dynamic" ErrorMessage="Can't left blank !"
                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CVComp" runat="server" ControlToValidate="txtCompany" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVComp_ServerValidate" ValidationGroup="C"></asp:CustomValidator>
                    </td>
                </tr>

                <tr>
                    <td valign="top" class="auto-style2">
                        <span class="style1"><span class="auto-style1">* </span></span>File :</td>
                    <td class="auto-style3">

                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" MultipleFileSelection="Disabled" ChunkSize="0" InputSize="56" MaxFileInputsCount="5" MaxFileSize="307200000" AllowedFileExtensions="jpg,jpeg,png,pdf,doc,docx," EnableInlineProgress="true" Skin="Default" TargetFolder="../Downloads" OnFileUploaded="RadAsyncUpload1_FileUploaded">
                        </telerik:RadAsyncUpload>

                    </td>
                </tr>



                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Image ID="imgLogo" runat="server" AlternateText="Logo" Height="110px" Width="100px" />
                    </td>
                </tr>



                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" OnClick="btnSubmit_Click" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Reset" OnClick="btnCancel_Click" /></td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


