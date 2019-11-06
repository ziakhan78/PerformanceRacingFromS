<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_news.aspx.cs" Inherits="admin_add_news" %>

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
                    <td class="header_title">Add News
                    </td>
                </tr>

                <tr>
                    <td align="right">
                        <span class="auto-style2">* </span>Denotes mandatory fields</td>
                </tr>

            

                <tr>
                    <td class="auto-style1">
                        <div align="left">
                            <span class="auto-style2">* </span>Date :
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="auto-style1">
                        <telerik:RadDatePicker ID="startDate" runat="server" Skin="Silk">
                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Silk" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                            </Calendar>
                            <DateInput DateFormat="dd-MM-yyyy" DisplayDateFormat="dd-MM-yyyy" LabelWidth="40%">
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="rfvDateStart" runat="server" ControlToValidate="startDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="N"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style1"><span class="auto-style2">* </span>End Date :</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <telerik:RadDatePicker ID="endDate" Runat="server" Skin="Silk">
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="rfvDateStart0" runat="server" ControlToValidate="endDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't Be Left Blank" ValidationGroup="N"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CVDateRange" runat="server" ControlToCompare="startDate" ControlToValidate="endDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Start Date should be greater than End Date" Operator="GreaterThanEqual" Type="Date" ValidationGroup="N"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><span class="auto-style2">* </span>News :
                    </td>
                </tr>


                <tr>
                    <td class="auto-style1">
                        <div align="left">

                            <telerik:RadEditor runat="server" ID="txtNews" Width="910px" Height="200px" Skin="Silk" EditModes="Design">
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
                        <asp:RequiredFieldValidator ID="rfvDateStart1" runat="server" ControlToValidate="txtNews" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="N"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td class="auto-style1">&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <div align="left">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="N" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" OnClick="btnCancel_Click" Text="Cancel" />
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



