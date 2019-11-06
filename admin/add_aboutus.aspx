<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_aboutus.aspx.cs" Inherits="admin_add_aboutus" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .auto-style2 {
            color: #FF0000;
        }

        .auto-style3 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <table class="txt" style="width: 100%;" align="center" cellpadding="0" cellspacing="5">
                <tr>
                    <td class="header_title" colspan="3">Add About Us</td>
                </tr>

                <tr>
                    <td align="right" colspan="3">
                        <span class="auto-style2">* </span>Denotes mandatory fields</td>
                </tr>

                <tr>
                    <td colspan="3" valign="top"><span class="auto-style2">* </span>Enter Aboutus Text : 
                        <asp:RequiredFieldValidator ID="rfvText" runat="server" ControlToValidate="RadEditor1" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" InitialValue="0" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" valign="top">
                        <telerik:RadEditor runat="server" ID="RadEditor1" Width="100%" Height="500px">
                            <CssFiles>
                                <telerik:EditorCssFile Value="../css/editor.css" />
                            </CssFiles>

                            <Tools>
                                <telerik:EditorToolGroup Tag="MainToolbar">
                                    <telerik:EditorTool Name="SpellCheck"></telerik:EditorTool>
                                    <telerik:EditorTool Name="FindAndReplace"></telerik:EditorTool>
                                    <telerik:EditorTool Name="SelectAll"></telerik:EditorTool>
                                    <telerik:EditorSplitButton Name="Undo">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSplitButton Name="Redo">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSeparator />
                                    <telerik:EditorTool Name="Cut" />
                                    <telerik:EditorTool Name="Copy" />
                                    <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                                    <telerik:EditorTool Name="LinkManager" ShortCut="CTRL+K" />
                                    <telerik:EditorTool Name="Unlink" ShortCut="CTRL+SHIFT+K" />
                                </telerik:EditorToolGroup>
                                <telerik:EditorToolGroup Tag="Formatting">
                                    <telerik:EditorTool Name="Bold" />
                                    <telerik:EditorTool Name="Italic" />
                                    <telerik:EditorTool Name="Underline" />
                                    <telerik:EditorSeparator />
                                    <telerik:EditorSplitButton Name="ForeColor">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSplitButton Name="BackColor">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSeparator />
                                    <telerik:EditorDropDown Name="FontName">
                                    </telerik:EditorDropDown>
                                    <telerik:EditorDropDown Name="RealFontSize">
                                    </telerik:EditorDropDown>
                                    <telerik:EditorTool Name="InsertUnorderedList" />
                                    <telerik:EditorTool Name="InsertOrderedList" />
                                </telerik:EditorToolGroup>
                            </Tools>


                        </telerik:RadEditor>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1" colspan="3">
                        <div align="center">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" ValidationGroup="A" OnClick="btnSubmit_Click" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Cancel" />
                        </div>
                    </td>
                </tr>

            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


