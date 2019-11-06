<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_category.aspx.cs" Inherits="admin_add_category" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

             <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAdd">

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">Add Category</td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>


                <tr>
                    <td align="right"  style="width: 150px;">
                        <span class="auto-style1">* </span>Add New Category :</td>

                    <td>
                        <asp:TextBox ID="txtCatName" runat="server" Width="400px"
                            TextMode="SingleLine" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVcategory" runat="server"
                            ControlToValidate="txtCatName" Display="Dynamic" ErrorMessage="Can't be left blank !"
                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CVcategory" runat="server" ControlToValidate="txtCatName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVcategory_ServerValidate" ValidationGroup="C"></asp:CustomValidator>
                    </td>
                </tr>

                   <tr >
                    <td align="right" valign="middle"><span class="auto-style1">* </span>Category Releted to :</td>
                    <td >
                        <asp:RadioButtonList ID="rtnType" runat="server" CssClass="txt" RepeatDirection="Horizontal" >
                            <asp:ListItem Selected="True" Value="0" Text="Bike"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Non Bike"></asp:ListItem>
                             <asp:ListItem Value="2" Text="Riding Gear"></asp:ListItem>                            
                        </asp:RadioButtonList>
                    </td>
                </tr>


               <tr>
                    <td align="right"  >
                        <span class="auto-style1">* </span>Category Image :</td>

                    <td><telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" InputSize="53"  MaxFileSize="512000" AllowedFileExtensions="jpg,jpeg,png,gif" EnableInlineProgress="true" Skin="Silk" MultipleFileSelection="Disabled" OnFileUploaded="RadAsyncUpload1_FileUploaded" />
                        
                       </td>
                </tr>
                <tr>
                    <td align="right"  ></td>

                    <td><span class="auto-style1">Please upload .jpg, .jpeg, .gif or .png image. maximum file size limit is 500 kb.</span></td>
                </tr>

                <tr>
                    <td align="right" valign="top" ></td>

                    <td><asp:Image ID="imgCat" runat="server" BorderWidth="0" Height="100px" Width="100px" />
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
                 </asp:Panel>

        </ContentTemplate>
           <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd"  />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

