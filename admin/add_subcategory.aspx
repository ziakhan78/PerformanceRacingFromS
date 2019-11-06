<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_subcategory.aspx.cs" Inherits="admin_add_subcategory" %>

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
                    <td colspan="2" class="header_title" align="center">Add Sub Category</td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

                 <tr>
                    <td align="right" valign="top" style="width: 150px;">
                        <span class="auto-style1">* </span>Select Category:</td>

                    <td>
                        <asp:DropDownList ID="ddlCat" runat="server" DataSourceID="dsCat" DataTextField="cat_name" DataValueField="cid" AppendDataBoundItems="true" CssClass="txtBox">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                         </td>
                </tr>


                <tr>
                    <td align="right" valign="top" style="width: 130px;">
                        <span class="auto-style1">* </span>Add Sub Category:</td>

                    <td>
                        <asp:TextBox ID="txtSubCatName" runat="server" Width="250px"
                            TextMode="SingleLine" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVcategory" runat="server"
                            ControlToValidate="txtSubCatName" Display="Dynamic" ErrorMessage="Can't be left blank !"
                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CVsubcategory" runat="server" ControlToValidate="txtSubCatName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVsubcategory_ServerValidate" ValidationGroup="C"></asp:CustomValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top" style="width: 130px;">
                        <span class="auto-style1">* </span>HS Code:</td>

                    <td>
                         <asp:DropDownList ID="ddlHsCode" runat="server" DataSourceID="dsHSCode" DataTextField="HSCode" DataValueField="id" AppendDataBoundItems="true" CssClass="txtBox">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvHSCode" runat="server" ControlToValidate="ddlHsCode" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                         
                      </td>
                </tr>



                



                  <tr>
                    <td align="right"  valign="top" >
                        <span class="auto-style1">* </span>Sub Category Image:</td>

                    <td><telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" InputSize="53"  MaxFileSize="512000" AllowedFileExtensions="jpg,jpeg,png,gif" EnableInlineProgress="true" Skin="Silk" MultipleFileSelection="Disabled" OnFileUploaded="RadAsyncUpload1_FileUploaded" />
                        
                       </td>
                </tr>

                 <tr>
                    <td align="right"  ></td>

                    <td><span class="auto-style1">Please upload .jpg, .jpeg, .gif or .png image. maximum file size limit is 500 kb.</span></td>
                </tr>

                <tr>
                    <td align="right" valign="top" ></td>

                    <td><asp:Image ID="img" runat="server" BorderWidth="0" Height="100px" Width="100px" />
                       </td>
                </tr>
                              


                <tr>
                    <td></td>

                    <td>
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" OnClick="btnAdd_Click" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Reset" />
                        <asp:SqlDataSource ID="dsHSCode" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [hs_code_master_tbl] ORDER BY [HSCode]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsCat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Category_tbl] ORDER BY [cat_name]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
                  </asp:Panel>

        </ContentTemplate>
           <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>



