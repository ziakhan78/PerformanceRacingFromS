<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_newsletter.aspx.cs" Inherits="admin_add_newsletter" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style2 {
            color: #FF0000;
        }



        .auto-style4 {
            text-align: right;
            width: 100px;
        }

        .auto-style6 {
            text-align: left;
           
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
              <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">
                <tr>
                    <td class="header_title" colspan="2">Add Newsletter Subscriptions</td>
                </tr>

                <tr>                    
                    <td align="right" colspan="2"><span class="auto-style2">* </span>Denotes mandatory fields</td>
                </tr>





                <tr>
                    <td class="auto-style4">
                        <div align="right"><span class="auto-style2">* </span>First Name : </div>
                    </td>                   
                    <td class="auto-style6">
                        <div align="left">
                            <asp:TextBox ID="txtFName" runat="server" Width="150px" CssClass="txtBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtFName" CssClass="txt_validation" ErrorMessage="Can't be left blank!" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                 <tr>
                    <td class="auto-style4">
                        <div align="right"><span class="auto-style2">* </span>Last Name : </div>
                    </td>                   
                    <td class="auto-style6">
                        <div align="left">
                            <asp:TextBox ID="txtLName" runat="server" Width="150px" CssClass="txtBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="txtLName" CssClass="txt_validation" ErrorMessage="Can't be left blank!" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>


                <tr >
                    <td class="auto-style4">
                        <div align="right"><span class="auto-style2">* </span>Email-Id : </div>
                    </td>
                   
                    <td class="auto-style6">
                        <div align="left">
                            <asp:TextBox ID="txtEmail" runat="server" Width="300px" CssClass="txtBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" ErrorMessage="Can't be left blank!" ValidationGroup="A" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid Email-Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="A"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                </tr>

              <tr>
                    <td class="auto-style4">
                        <div align="right"><span class="auto-style2">* </span>Mobile No. : </div></td>
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
                            ValidationGroup="A" CssClass="txt_validation"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td ></td>                    
                    <td class="auto-style1">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" ValidationGroup="A" OnClick="btnSubmit_Click" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Cancel" />
                    </td>
                </tr>

            </table>
                  </asp:Panel>

        </ContentTemplate>
          <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

