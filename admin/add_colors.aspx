<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_colors.aspx.cs" Inherits="Admin_AddOccasions" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 102px;
        }
        .style2
        {
            width: 130px;
            text-align:right;
        }
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    
    <ContentTemplate>

          <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
     <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center"><asp:Label ID="lblHeading" runat="server" ></asp:Label></td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>
     
      
      
        <tr>
            <td class="style2" align="right" valign="top"><span class="auto-style1">*</span>Colour Name : </td>
           
            <td valign="top">
                
                <telerik:RadTextBox ID="txtColor" Runat="server" width="250px" CssClass="txtBox" Skin="Silk">
                </telerik:RadTextBox>
                 
                <asp:RequiredFieldValidator ID="RFVColor" runat="server" 
                    ControlToValidate="txtColor" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CVColor" runat="server" 
                    ControlToValidate="txtColor" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="* Already Exists." 
                    onservervalidate="CVColor_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
            </td>
           
        </tr>

          <tr>
            <td class="style2" align="right" valign="top" >Hex Colour Code : </td>
           
            <td valign="top">
                <telerik:RadTextBox ID="txtColorCode" Runat="server" width="100px" MaxLength="7" CssClass="txtBox" Skin="Silk" AutoPostBack="true" OnTextChanged="txtColorCode_TextChanged">
                </telerik:RadTextBox>
            </td>
           
        </tr>
          <tr>
            <td class="style2" align="right" valign="top" ></td>
           
            <td valign="top">
                <asp:Label ID="lblColorCode" runat="server" Height="20px" Width="20px" ></asp:Label>
            </td>
           
        </tr>
        <tr>
            <td class="style2" ></td>
           
            <td align="left">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" 
                    onclick="btnSubmit_Click" ValidationGroup="O"  />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn" 
                    CausesValidation="False" onclick="btnCancel_Click" />
              
            </td>
        </tr>
       
    </table>
              </asp:Panel>
    </ContentTemplate>
    <Triggers>
    <asp:PostBackTrigger ControlID="btnSubmit"  />
    </Triggers>
    </asp:UpdatePanel>
</asp:Content>

