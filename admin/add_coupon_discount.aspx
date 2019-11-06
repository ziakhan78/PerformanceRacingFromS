<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_coupon_discount.aspx.cs" Inherits="admin_add_coupon_discount" %>

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


            <table class="txt" style="width: 100%;" align="center" cellpadding="5" cellspacing="5">
                <tr>
                    <td class="header_title" colspan="2">Add Discount Coupons</td>
                </tr>

                <tr>
                    <td valign="top" align="right" colspan="2"><span class="style1">* </span>Denotes mandatory fields</td>
                </tr>

                   <tr>
                    <td class="auto-style1"><span class="style1">* </span>Product Category :</td>
                    <td class="auto-style2">
                         <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" DataSourceID="dsCat" AppendDataBoundItems="true" CssClass="txtBox" DataTextField="cat_name" DataValueField="cid" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged">
                            <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                 <%--  <tr>
                    <td class="auto-style1"><span class="style1">* </span>Promotion :</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlPromotion" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlPromotion_SelectedIndexChanged" CssClass="txtBox" DataSourceID="dsPromotion" DataTextField="occasion_name" DataValueField="id">
                            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RFVPromo" runat="server" ControlToValidate="ddlPromotion" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="A"></asp:RequiredFieldValidator>

                    </td>
                </tr>--%>



             <%--   <tr>
                    <td class="auto-style1">Coupon Code :</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtCouponCode" runat="server" ReadOnly="true"></asp:TextBox>
                        <asp:CustomValidator ID="CVCoupon" runat="server" ControlToValidate="txtCouponCode" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Coupon No. Already Exist!" OnServerValidate="CVCoupon_ServerValidate" ValidationGroup="A"></asp:CustomValidator>
                        &nbsp;<asp:Button ID="btnNewCoupon" runat="server" CausesValidation="False" CssClass="btn" OnClick="btnNewCoupon_Click" Text="Generate New Coupon" />
                    </td>
                </tr>--%>

                <tr>
                    <td class="auto-style1"><span class="style1">* </span>Start Date :</td>
                    <td class="auto-style2" align="left">
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
                    <td class="auto-style1"><span class="style1">* </span>End Date :</td>
                    <td align="left" class="auto-style2">
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
                        <asp:CompareValidator ID="CVDateRange" runat="server" ControlToCompare="startDate" ControlToValidate="endDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Start Date should be greater than End Date" Operator="GreaterThanEqual" Type="Date" ValidationGroup="A"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><span class="style1">* </span>Discount Mode By :</td>
                    <td align="left" class="auto-style2">
                        <asp:RadioButtonList ID="rbtnMode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbtnMode_SelectedIndexChanged" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Text="Percentage" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Amount" Value="1"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                


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

                <tr id="TRPrice" runat="server">
                    <td class="auto-style1">
                        <div align="right"><span class="style1">* </span>Enter Amount ($) :</div>
                    </td>
                    <td class="auto-style2">
                        <div align="left">
                            <telerik:RadNumericTextBox ID="txtPrice" runat="server" Width="50px" MaxLength="4" CssClass="txtBox" Skin="Silk">
                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                            </telerik:RadNumericTextBox>
                            <asp:RequiredFieldValidator ID="rfvWavPrice" runat="server" ControlToValidate="txtPrice" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>

                  <tr>
                    <td class="auto-style1" valign="top">
                        <div align="right">Discount Coupon Code :</div>
                    </td>
                    <td class="auto-style2">
                        <div align="left">
                          <asp:Label ID="lblCouponCode" runat="server" style="font-weight: 700" ></asp:Label>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1" valign="top">
                        <div align="right">Coupon Description :</div>
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
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Create Coupon" ValidationGroup="A" OnClick="btnSubmit_Click" />
                        <asp:Label ID="lblMsg" runat="server" CssClass="txt_validation" Text="Coupon Already Exist!"></asp:Label>
                        <asp:SqlDataSource ID="dsCat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [cid], [cat_name] FROM [Category_tbl] ORDER BY [cat_name]"></asp:SqlDataSource>
                        
                    </td>
                </tr>

            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>







