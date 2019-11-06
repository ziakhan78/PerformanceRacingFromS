<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_sale_promotion_coupon.aspx.cs" Inherits="admin_add_sale_promotion_coupon" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style1 {
            color: red;
        }

        .auto-style1 {
            text-align: right;
            width: 150px;
        }

        .auto-style2 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>


            <table class="txt" style="width: 100%;" align="center" cellpadding="3" cellspacing="5">
                <tr>
                    <td class="header_title" colspan="2">Add Sales & Promotion Discounts</td>
                </tr>

                <tr>
                    <td valign="top" align="right" colspan="2"><span class="style1">* </span>Denotes mandatory fields</td>
                </tr>

                   <tr>
                     <td class="auto-style1">
                        <span class="style1">* </span>Category :</td>
                    <td>
                        <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged" CssClass="txtBox">
                            <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                     <td class="auto-style1">
                        <span class="style1">* </span>Sub Category :</td>

                    <td>
                        <asp:DropDownList ID="ddlSubcategory" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged">
                            <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVsubcat" runat="server" ControlToValidate="ddlSubcategory" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                 <%--  <tr>
                    <td class="auto-style1">
                        <span class="style1">* </span>Sub Sub Category :</td>

                    <td>
                        <asp:DropDownList ID="ddlSubSubcategory" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlSubSubcategory_SelectedIndexChanged" >
                            <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSubSubCat" runat="server" ControlToValidate="ddlSubSubcategory" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </td>
                </tr>--%>


                    <tr>
                    <td class="auto-style1" valign="top"><span class="style1">* </span>Start Date :</td>
                    <td class="auto-style2">
                       

                        <telerik:RadDatePicker ID="startDate" runat="server" Skin="Silk" Width="120px">
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
                        <asp:RequiredFieldValidator ID="rfvDateStart" runat="server" ControlToValidate="startDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="A"></asp:RequiredFieldValidator>
                       

                    </td>
                </tr>


              

                <tr>
                    <td class="auto-style1" valign="top"><span class="style1">* </span>End Date :</td>
                    <td class="auto-style2">
                        <telerik:RadDatePicker ID="endDate" runat="server" Skin="Silk" Width="120px">
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
                        <asp:RequiredFieldValidator ID="rfvDateStart0" runat="server" ControlToValidate="endDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CVDateRange" runat="server" ControlToCompare="startDate" ControlToValidate="endDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="End Date should be greater than Start Date" Operator="GreaterThanEqual" Type="Date" ValidationGroup="A"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" valign="top"><span class="style1">* </span>SKU # :</td>
                    <td class="auto-style2">
                        <asp:CheckBoxList ID="chkSKU" runat="server" AutoPostBack="True" CausesValidation="True" OnSelectedIndexChanged="chkSKU_SelectedIndexChanged" RepeatColumns="5" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </td>
                </tr>


              

<%--                <tr>
                    <td class="auto-style1">Discount Mode By :</td>
                    <td class="auto-style2" align="left">
                        <asp:RadioButtonList ID="rbtnMode" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnMode_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="Percentage" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Amount"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                --%>


                <tr id="TRPercentage" runat="server">
                    <td class="auto-style1"><span class="style1">* </span>Enter Percentage :</td>
                    <td class="auto-style2">
                        <telerik:RadNumericTextBox ID="txtPercentage" runat="server" Width="50px" MaxLength="6" MaxValue="99" CssClass="txtBox" Skin="Silk">
                            <NumberFormat DecimalDigits="2" ZeroPattern="n" />
                        </telerik:RadNumericTextBox>
                        %&nbsp; i.e. 12.25 %
                        <asp:RequiredFieldValidator ID="rfvPercentage" runat="server" ControlToValidate="txtPercentage" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <%--    <tr id="TRPrice" runat="server">
                    <td class="auto-style1">
                        <div align="right"><span class="style1">* </span>Enter Amount (&#8377;) :</div>
                    </td>
                    <td class="auto-style2">
                        <div align="left">
                            <telerik:RadNumericTextBox ID="txtPrice" runat="server" Width="50px" MaxLength="4" CssClass="txtBox" Skin="Silk">
                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                            </telerik:RadNumericTextBox>
                            <asp:RequiredFieldValidator ID="rfvWavPrice" runat="server" ControlToValidate="txtPrice" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>--%>

               

                <tr>
                    <td class="auto-style1" valign="top">
                        <div align="right">Description :</div>
                    </td>
                    <td class="auto-style2">
                        <div align="left">
                            <asp:TextBox ID="txtCouponDesc" runat="server" TextMode="MultiLine" Height="70px" Width="100%" CssClass="txtBox"></asp:TextBox>
                        </div>
                    </td>
                </tr>




                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style2">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" ValidationGroup="A" OnClick="btnSubmit_Click" />
                        <asp:Label ID="lblMsg" runat="server" CssClass="txt_validation" Text="Coupon Already Exist!"></asp:Label>
                    </td>
                </tr>

            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>








