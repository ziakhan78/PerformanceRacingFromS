<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_faq.aspx.cs" Inherits="admin_add_faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .auto-style2 {
            color: #FF0000;
        }

        .auto-style3 {
            width: 100px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <table class="txt" style="width: 100%;" align="center" cellpadding="0" cellspacing="5">
                <tr>
                    <td class="header_title" colspan="2">Add FAQ&#39;s</td>
                </tr>

                <tr>
                    <td align="right" colspan="2">
                        <span class="auto-style2">* </span>Denotes mandatory fields</td>
                </tr>


                <tr>
                    <td class="auto-style3" valign="top"><span class="auto-style2">* </span>Question : </td>

                    <td class="auto-style2" valign="top">
                        <asp:TextBox ID="txtQues" runat="server" Width="100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtQues" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank" ValidationGroup="T"></asp:RequiredFieldValidator>
                    </td>
                </tr>



                <tr>
                    <td class="auto-style3" valign="top"><span class="auto-style2">* </span>Answer :</td>

                    <td class="auto-style2" valign="top">

                        <asp:TextBox ID="txtAnswer" runat="server" Width="100%" TextMode="MultiLine" Height="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTestimonials" runat="server" ControlToValidate="txtAnswer" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank" ValidationGroup="T"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3" valign="top"></td>

                    <td class="auto-style2" valign="top">
                        <div align="left">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="T" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </td>
                </tr>

            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

