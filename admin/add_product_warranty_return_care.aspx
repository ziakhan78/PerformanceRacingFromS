<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_product_warranty_return_care.aspx.cs" Inherits="admin_add_product_warranty_return_care" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">



    <style type="text/css">
        .auto-style1 {
            text-align: left;
            width: 1015px;
        }

        .auto-style2 {
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
                    <td class="header_title">Edit Product&#39;s Warranty Return &amp; Care Text
                    </td>
                </tr>

                <tr>
                    <td align="right">
                        <span class="auto-style2">* </span>Denotes mandatory fields</td>
                </tr>

            

                <tr>
                    <td class="auto-style1">
                        <div align="left">
                            <span class="auto-style2">* </span>Warranty Text :
                        </div>
                    </td>
                </tr>


              <tr>
                    <td class="auto-style1">
                        <div align="left">

                            <telerik:RadEditor runat="server" ID="txtWarranty" Width="98%" Height="150px" Skin="Silk" EditModes="Design">
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
                        </div>
                        <asp:RequiredFieldValidator ID="rfvWarranty" runat="server" ControlToValidate="txtWarranty" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="N"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style1">Return Text :</td>
                </tr>
               <tr>
                    <td class="auto-style1">
                        <div align="left">

                            <telerik:RadEditor runat="server" ID="txtReturn" Width="98%" Height="150px" Skin="Silk" EditModes="Design">
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
                        </div>
                          </td>
                </tr>
                <tr>
                    <td class="auto-style1">Care Text :
                    </td>
                </tr>


                <tr>
                    <td class="auto-style1">
                        <div align="left">

                            <telerik:RadEditor runat="server" ID="txtCare" Width="98%" Height="150px" Skin="Silk" EditModes="Design">
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
                        </div>
                           </td>
                </tr>

                
                <tr>
                    <td class="auto-style1">
                        <div align="left">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="N" />
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



