<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_pincode_delivery.aspx.cs" Inherits="Admin_add_pincode_delivery" %>

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

        .auto-style2 {
            width: 130px;
            text-align: left;
        }

        .auto-style3 {
            text-align: right;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">Add Pincode</td>
                </tr>

                <tr>
                    <td valign="top" class="auto-style3">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

                <tr>
                    <td class="auto-style3">Select State :</td>
                    <td align="left">
                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="txtBox" DataSourceID="dsState" DataTextField="state_name" DataValueField="state_name" AutoPostBack="True">
                            <asp:ListItem Text="Select" Value="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3">Select City :</td>
                    <td align="left">
                        <asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" CssClass="txtBox" DataSourceID="dsCity" DataTextField="city_name" DataValueField="city_name">
                            <asp:ListItem Text="Select" Value="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3" valign="top">Pincode :</td>
                    <td align="left">                       
                        <telerik:RadNumericTextBox ID="txtPincode" runat="server" CssClass="txtBox" MaxLength="6" NumberFormat-AllowRounding="false" Skin="Silk" Width="100px">
                            <NegativeStyle Resize="None" />
                            <NumberFormat AllowRounding="False" DecimalDigits="0" GroupSeparator="" GroupSizes="7" ZeroPattern="n" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>

                 <tr>
                    <td align="right" valign="middle">Service Available :</td>
                    <td align="left"><asp:CheckBox ID="chkServiceAvailable" runat="server" />
                    </td>
                </tr>

            <tr>
                    <td align="right" valign="middle">Is COD :</td>
                    <td align="left"><asp:CheckBox ID="chkIsCod" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td align="right" valign="middle">Is Free Shipping :</td>
                    <td align="left"><asp:CheckBox ID="chkFreeDil" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td align="right" valign="middle">Transpotation Time :</td>
                    <td align="left"><telerik:RadNumericTextBox ID="txtTranspotationTime" runat="server" CssClass="txtBox" MaxLength="2" NumberFormat-AllowRounding="false" Skin="Silk" Width="100px">
                            <NegativeStyle Resize="None" />
                            <NumberFormat AllowRounding="False" DecimalDigits="0" GroupSeparator="" GroupSizes="7" ZeroPattern="n" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td>

                    <td align="left">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClick="btnSubmit_Click" ValidationGroup="O" />&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn" CausesValidation="False" OnClick="btnCancel_Click" />
                        <asp:SqlDataSource ID="dsState" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT distinct [state_name] FROM [StateCityPinCode_tbl] ORDER BY [state_name]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsCity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT distinct [city_name] FROM [StateCityPinCode_tbl] WHERE ([state_name] = @state_name)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlState" Name="state_name" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>

            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

