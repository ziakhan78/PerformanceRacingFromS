<%@ Page Title="" Language="C#" MasterPageFile="../masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_testimonials.aspx.cs" Inherits="admin_add_testimonials" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style type="text/css">
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
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsubmit">

                <table class="txt" style="width: 100%;" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                        <td class="header_title" colspan="2">
                            <asp:Label ID="lblHeading" runat="server" ></asp:Label></td>
                    </tr>

                    <tr>
                        <td align="right" colspan="2">
                            <span class="auto-style2">* </span>Denotes mandatory fields</td>
                    </tr>


                    <tr>
                        <td class="auto-style3" valign="top"><span class="auto-style2">* </span>Name : </td>

                        <td class="auto-style2" valign="top">
                            <asp:TextBox ID="txtName" runat="server" Width="250px" CssClass="txtBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank" ValidationGroup="T"></asp:RequiredFieldValidator>
                        </td>
                    </tr>


                    <tr>
                        <td class="auto-style3" valign="top">Designation : </td>

                        <td class="auto-style2" valign="top">
                            <asp:TextBox ID="txtDesig" runat="server" Width="250px" CssClass="txtBox"></asp:TextBox>
                        </td>
                    </tr>

                       <tr>
                        <td class="auto-style3" valign="top"><span class="auto-style2">* </span>Brand : </td>

                        <td class="auto-style2" valign="top">
                             <asp:DropDownList ID="DDLBrandName" runat="server" CssClass="txtBox" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="brand_name" DataValueField="brand_name" AutoPostBack="True" >
                            <asp:ListItem Value="Select" Text="Select"></asp:ListItem>
                        </asp:DropDownList>
                            </td>
                    </tr>

                        <tr>
                        <td class="auto-style3" valign="top">Product : </td>

                        <td class="auto-style2" valign="top">
                             <asp:DropDownList ID="ddlProduct" runat="server" CssClass="txtBox" DataSourceID="SqlDataSource3" DataTextField="product_name" DataValueField="product_name" >                            
                        </asp:DropDownList>
                            </td>
                    </tr>


                    <tr>
                        <td class="auto-style3" valign="top"><span class="auto-style2">* </span>Testimonial : </td>
                        <td class="auto-style2" valign="top">
                              <telerik:RadEditor runat="server" ID="txtTestimonials" Width="100%" Height="300px" EditModes="Design" Skin="Silk">                             
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

                            <asp:RequiredFieldValidator ID="rfvTestimonials" runat="server" ControlToValidate="txtTestimonials" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank" ValidationGroup="T"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                     <tr>
                        <td class="auto-style3" valign="top">Image : </td>

                        <td class="auto-style2" valign="top">
                    <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" InputSize="53"  MaxFileSize="512000" AllowedFileExtensions="jpg,jpeg,png,gif" EnableInlineProgress="true" Skin="Silk" MultipleFileSelection="Disabled" OnFileUploaded="RadAsyncUpload1_FileUploaded" />
                        <span class="auto-style1">Please upload only .gif or .png transparent image. maximum file size limit is 500 kb.</span>
                                </td>
                    </tr>

                     <tr>
                    <td align="right" valign="top" ></td>

                    <td><asp:Image ID="img" runat="server" BorderWidth="0" Height="100px" Width="100px" />
                       </td>
                </tr>



                    <tr>
                        <td class="auto-style3" valign="top"></td>
                        <td class="auto-style2" valign="top">
                            <div align="left">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="T" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Cancel" OnClick="btnCancel_Click" />
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [brand_name], [id] FROM [brand_master_tbl] ORDER BY [brand_name]"></asp:SqlDataSource>
                               
            
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [pid], [product_name], [brand_name] FROM [View_Products] WHERE ([brand_name] = @brand_name) ORDER BY [product_name]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DDLBrandName" Name="brand_name" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
            
                            </div>
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

