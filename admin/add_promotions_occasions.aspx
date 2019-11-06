<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_promotions_occasions.aspx.cs" Inherits="admin_add_promotions_occasions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="5" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">Add Promotion Events</td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

                <tr>
                    <td align="right" valign="top" style="width: 110px;">
                        <span class="auto-style1">* </span>Event Name :</td>

                    <td>
                        <asp:TextBox ID="txtName" runat="server" Width="300px"
                            TextMode="SingleLine" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVtxtName" runat="server"
                            ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Can't left blank !"
                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CVProOcc" runat="server" ControlToValidate="txtName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVProOcc_ServerValidate" ValidationGroup="C"></asp:CustomValidator>
                    </td>
                </tr>

                 <tr>
                    <td align="right" valign="top" style="width: 100px;">
                        <span class="auto-style1">* </span>Abbreviation :</td>

                    <td>
                        <asp:TextBox ID="txtAbbri" runat="server" Width="50px"
                            TextMode="SingleLine" CssClass="txtBox" MaxLength="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAbbri" runat="server"
                            ControlToValidate="txtAbbri" Display="Dynamic" ErrorMessage="Can't left blank !"
                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        
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
            <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


