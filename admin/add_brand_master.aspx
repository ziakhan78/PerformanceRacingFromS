<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_brand_master.aspx.cs" Inherits="Admin_add_brand_master" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 102px;
        }

        .style2 {
            width: 130px;
        }

        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
                <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                    <tr>
                        <td colspan="2" class="header_title" align="center">
                            <asp:Label ID="lblHeading" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td align="right" valign="top">&nbsp;</td>

                        <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                    </tr>


                    <tr>
                        <td style="width: 190px;" class="RadUpload_rtl">
                            <span class="auto-style1">* </span>Category :</td>
                        <td>
                            <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" AppendDataBoundItems="true"  CssClass="txtBox">
                                <asp:ListItem Value="0" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td class="RadUpload_rtl">
                            <span class="auto-style1">* </span>Sub Category :</td>
                        <td>
                           <%-- <asp:DropDownList ID="ddlSubcategory" runat="server" CssClass="txtBox">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVsubcat" runat="server" ControlToValidate="ddlSubcategory" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="B"></asp:RequiredFieldValidator>--%>
                            <asp:CheckBoxList ID="chkSubCategory" runat="server"  RepeatColumns="5" DataSourceID="SqlDataSource1" DataTextField="subcat_name" DataValueField="sid">
                            </asp:CheckBoxList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [sid], [subcat_name], [cid] FROM [Subcategory_tbl] WHERE ([cid] = @cid) ORDER BY [subcat_name]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCat" Name="cid" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>


                    <tr>
                        <td align="right" valign="top" style="text-align: right; vertical-align: top;"
                            class="style2"><span class="auto-style1">*</span>Brand Name : </td>

                        <td>
                            <telerik:RadTextBox ID="txtBrandName" runat="server" Width="400px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RFVBrand" runat="server" ControlToValidate="txtBrandName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>

                    </tr>



                    <tr>
                        <td align="right" valign="top" style="text-align: right; vertical-align: top;"
                            class="style2"></td>

                        <td>
                            &nbsp;</td>

                    </tr>



                    <tr>
                        <td align="right" valign="top" style="text-align: right; vertical-align: top;"
                            class="style2">Website Url : </td>

                        <td>
                            <telerik:RadTextBox ID="txtWebsite" runat="server" Width="400px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>

                        </td>

                    </tr>





                    <tr>
                        <td align="right" valign="top" style="text-align: right; vertical-align: top;"
                            class="style2">Notes : </td>

                        <td>
                            <telerik:RadEditor runat="server" ID="txtNotes" Width="100%" Height="200px" Skin="Silk" EditModes="Design">
                                <CssFiles>
                                    <telerik:EditorCssFile Value="../css/editor.css" />
                                </CssFiles>

                                <Tools>

                                    <telerik:EditorToolGroup>
                                        <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                        <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                        <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                        <telerik:EditorTool Name="LinkManager"></telerik:EditorTool>
                                        <telerik:EditorTool Name="Unlink"></telerik:EditorTool>
                                        <telerik:EditorTool Name="JustifyFull"></telerik:EditorTool>
                                        <telerik:EditorTool Name="JustifyCenter"></telerik:EditorTool>
                                        <telerik:EditorTool Name="JustifyLeft"></telerik:EditorTool>
                                        <telerik:EditorTool Name="JustifyRight"></telerik:EditorTool>
                                        <telerik:EditorTool Name="InsertUnorderedList" />
                                        <telerik:EditorTool Name="InsertOrderedList" />
                                    </telerik:EditorToolGroup>
                                </Tools>

                            </telerik:RadEditor>

                        </td>

                    </tr>

                    <tr>
                        <td align="right" valign="top" style="text-align: right; vertical-align: top;"
                            class="style2">Logo : </td>

                        <td>
                            <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" InputSize="51" MaxFileSize="512000" AllowedFileExtensions="jpg,jpeg,png,gif" EnableInlineProgress="true" Skin="Silk" MultipleFileSelection="Disabled" OnFileUploaded="RadAsyncUpload1_FileUploaded" />
                            <span class="auto-style1">Please upload only .jpeg, .jpg, .gif or .png image. maximum file size limit is 500 kb.</span>

                        </td>

                    </tr>
                    <tr>
                        <td align="right" valign="top"></td>

                        <td>
                            <asp:Image ID="imgBrand" runat="server" BorderWidth="0" Height="100px" Width="100px" />
                        </td>
                    </tr>





                    <tr>
                        <td class="style2"></td>

                        <td align="left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn"
                                OnClick="btnSubmit_Click" ValidationGroup="B" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn"
                                CausesValidation="False" OnClick="btnCancel_Click" />

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

