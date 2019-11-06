<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="AddOccasions.aspx.cs" Inherits="Admin_AddOccasions" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 102px;
        }
        .style2
        {
            width: 150px;
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
                    <td colspan="2" class="header_title" align="center">Add Garment Wear Occasions</td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>
     
      
      
        <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Add New Occasions : </td>
           
            <td >
                <telerik:RadTextBox ID="txtOccasion" Runat="server" width="300px" CssClass="txtBox" Skin="Silk" >
                </telerik:RadTextBox>
                
                
                
                
                <asp:RequiredFieldValidator ID="RFVOcc" runat="server" 
                    ControlToValidate="txtOccasion" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CVOccasion" runat="server" 
                    ControlToValidate="txtOccasion" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="* Already Exists." 
                    onservervalidate="CVOccasion_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
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

