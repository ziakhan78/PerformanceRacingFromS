<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_menu_images.aspx.cs" Inherits="admin_add_menu_images" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

     <script type="text/javascript">

         function OnClientValidationFailed(sender, args) {
             var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
             if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                 if (sender.get_allowedFileExtensions().indexOf(fileExtention)) {
                     alert("Wrong file extension!");
                 }
                 else {
                     alert("File size exceeds the maximum allowed size!");
                 }
             }
             else {
                 alert("Not correct extension!");
             }
         }
    </script>

    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }

       

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    v<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">Add Menu Wise Images</td>
                </tr>

                <tr>                  
                   
                    <td colspan="2" style="text-align: right" ><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

             

                   <tr>
                    <td style="text-align: right; width:130px; "><span class="auto-style1">* </span>Select Menu :</td>
                    <td style="text-align: left">
                        
                        <asp:DropDownList ID="ddlMenu" runat="server" CssClass="txt">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Home</asp:ListItem>
                            <asp:ListItem>About Us</asp:ListItem>
                            <asp:ListItem>Kuldevi</asp:ListItem>
                            <asp:ListItem>Native Place</asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ID="rfvFestival" runat="server" ControlToValidate="ddlMenu" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>


              <tr>
                    <td valign="top" style="text-align: right; "><span class="auto-style1">* </span>Upload Image</td>
                  
                    <td  valign="top">
                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" InputSize="69" MaxFileInputsCount="1" OnClientValidationFailed="OnClientValidationFailed" MaxFileSize="307200" AllowedFileExtensions="jpg,jpeg" EnableInlineProgress="true" MultipleFileSelection="Automatic" OnFileUploaded="RadAsyncUpload1_FileUploaded" Skin="Default"  />
                        <span class="auto-style1">Please upload only .jpeg or .jpg file, maximum file size 300 kb.</span>
                    </td>
                </tr>  
                
                
                   <tr>
                    <td style="text-align: right; ">Caption :</td>
                    <td style="text-align: left"><asp:TextBox ID="txtCaption" runat="server" Width="500px"></asp:TextBox>                     
                        
                    </td>
                </tr> 
                
                
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Image ID="imgId" runat="server" BorderWidth="0" Height="166px" Width="140px" />                        
                    </td>
                </tr>        



                <tr>
                    
                   <td></td>
                    <td style="text-align: left" >
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C"  />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Reset"  /></td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


