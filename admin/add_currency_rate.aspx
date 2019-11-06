<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_currency_rate.aspx.cs" Inherits="admin_add_currency_rate" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 102px;
        }
        .style2
        {
            width: 130px;
        }
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    
    <ContentTemplate>
     <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center"><asp:Label ID="lblHeading" runat="server" ></asp:Label></td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>
                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>
     
      
          <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Currency : </td>
           
            <td >
                <asp:DropDownList ID="ddlCurrency" runat="server" AppendDataBoundItems="true" CssClass="txtBox" >
                    <asp:ListItem Value="Select" Text="Select"></asp:ListItem>
                     <asp:ListItem Value="Dollar" Text="Dollar"></asp:ListItem>                    
                     <asp:ListItem Value="Euro" Text="Euro"></asp:ListItem>
                     <asp:ListItem Value="Pound" Text="Pound"></asp:ListItem>
                     <asp:ListItem Value="Yen" Text="Yen"></asp:ListItem>
                </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="rfvCurrency" runat="server" 
                    ControlToValidate="ddlCurrency" CssClass="txt_validation" Display="Dynamic" InitialValue="Select" 
                    ErrorMessage="Select Currency!" ValidationGroup="O"></asp:RequiredFieldValidator>
                 <asp:CustomValidator ID="CVCurrency" runat="server" 
                    ControlToValidate="ddlCurrency" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="* Already Exists." 
                    onservervalidate="CVCurrency_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
            </td>
           
        </tr>
      
        <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Rate (&#8377;): </td>
           
            <td >
                <telerik:RadNumericTextBox ID="txtCurrencyRate" runat="server" Skin="Silk" CssClass="txtBox" MaxLength="5" MinValue="0" Width="80px">
                    <NegativeStyle Resize="None"></NegativeStyle>
                    <NumberFormat ZeroPattern="n" DecimalDigits="2" GroupSeparator=""></NumberFormat>                    
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox>
                
                
                
                
                <asp:RequiredFieldValidator ID="RFVDistNo" runat="server" 
                    ControlToValidate="txtCurrencyRate" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
               
            </td>
           
        </tr>

          



        <tr>
            <td class="style2" ></td>
           
            <td align="left">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" 
                    onclick="btnSubmit_Click" ValidationGroup="O"  />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn" 
                    CausesValidation="False" Width="59px" onclick="btnCancel_Click" />
              
            </td>
        </tr>

        
       
    </table>
    </ContentTemplate>
    <Triggers>
    <asp:PostBackTrigger ControlID="btnSubmit"  />
    </Triggers>
    </asp:UpdatePanel>
</asp:Content>

