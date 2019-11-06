<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_manufacturer_master.aspx.cs" Inherits="Admin_add_manufacturer_master" %>

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
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Manufacturer : </td>
           
            <td >
                <telerik:RadTextBox ID="txtManufacturer" Runat="server" width="398px" CssClass="txtBox" Skin="Silk">
                </telerik:RadTextBox>
                
                
                
                
                <asp:RequiredFieldValidator ID="RFVManufacturer" runat="server" 
                    ControlToValidate="txtManufacturer" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CVManufacturer" runat="server" 
                    ControlToValidate="txtManufacturer" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="* Already Exists." 
                    onservervalidate="CVManufacturer_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
            </td>
           
        </tr>

         

          <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Logo : </td>
           
            <td >
               <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" InputSize="51"  MaxFileSize="512000" AllowedFileExtensions="jpg,jpeg,png,gif" EnableInlineProgress="true" Skin="Silk" MultipleFileSelection="Disabled" OnFileUploaded="RadAsyncUpload1_FileUploaded" />
                <span class="auto-style1">Please upload only .jpeg, .jpg, .gif or .png image. maximum file size limit is 500 kb.</span>
                             
            </td>
           
        </tr>

          <tr>
                    <td align="right" valign="top" ></td>

                    <td><asp:Image ID="imgManufacturer" runat="server" BorderWidth="0" Height="100px" Width="100px" />
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

