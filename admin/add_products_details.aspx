<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_products_details.aspx.cs" Inherits="admin_add_products_details" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../js/scripts.js"></script>

    <script type="text/javascript">

        function OnClientValidationFailed(sender, args) {
            var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
            if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                if (sender.get_allowedFileExtensions().indexOf(fileExtention)) {
                    alert("Wrong file extension!");
                }
                else {
                    alert("File size exceeds the maximum allowed size!");
                }
            }
            else {
                alert("Not correct extension!");
            }
        }
    </script>

    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }

        .auto-style2 {
            text-align: right;
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAdd">

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
                        <td style="width: 190px;" class="auto-style2">
                            <span class="auto-style1">*</span>Category :</td>
                        <td>
                            <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged" CssClass="txtBox">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr id="trSubCategory" runat="server">
                        <td class="auto-style2"><span class="auto-style1">*</span>Sub Category :</td>
                        <td>
                            <asp:DropDownList ID="ddlSubcategory" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVsubcat" runat="server" ControlToValidate="ddlSubcategory" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>



                    <tr>
                        <td class="auto-style2"><span class="auto-style1">*</span>Products :</td>
                        <td>
                            <asp:DropDownList ID="ddlProducts" runat="server" CssClass="txtBox" >
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvProducts" runat="server" ControlToValidate="ddlProducts" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>








                    <tr id="trGender" runat="server">
                        <td align="right" valign="middle">Gender :</td>
                        <td class="style10">
                            <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0" Text="Mens"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Womens"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Unisex"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>


                    <tr id="trSize" runat="server">
                        <td class="auto-style2">Size :</td>
                        <td align="left">


                            <asp:DropDownList ID="ddlSize" runat="server" CssClass="txtBox">
                                <asp:ListItem Text="Small" Value="1">Small</asp:ListItem>
                                <asp:ListItem Text="Medium" Value="2">Medium</asp:ListItem>
                                <asp:ListItem Text="Large" Value="3">Large</asp:ListItem>
                                <asp:ListItem Text="Extra Large" Value="4">Extra Large</asp:ListItem>
                                <asp:ListItem Text="2XL" Value="5">2XL</asp:ListItem>
                                <asp:ListItem Text="3XL" Value="6">3XL</asp:ListItem>
                                <asp:ListItem Text="4XL" Value="7">4XL</asp:ListItem>
                                <asp:ListItem Text="5XL" Value="8">5XL</asp:ListItem>
                                <asp:ListItem Text="6XL" Value="9">6XL</asp:ListItem>
                                <asp:ListItem Text="Free Size" Value="10">Free Size</asp:ListItem>
                            </asp:DropDownList>

                            <asp:DropDownList ID="chkBootSize" runat="server" CssClass="txtBox">
                                <asp:ListItem Text="39" Value="0">39</asp:ListItem>
                                <asp:ListItem Text="40" Value="1">40</asp:ListItem>
                                <asp:ListItem Text="41" Value="2">41</asp:ListItem>
                                <asp:ListItem Text="42" Value="3">42</asp:ListItem>
                                <asp:ListItem Text="43" Value="4">43</asp:ListItem>
                                <asp:ListItem Text="44" Value="5">44</asp:ListItem>
                                <asp:ListItem Text="45" Value="6">45</asp:ListItem>
                                <asp:ListItem Text="46" Value="7">46</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Quantity :</td>
                        <td>
                            <telerik:RadNumericTextBox ID="txtQuantity" runat="server" CssClass="txtBox" MaxLength="6" NumberFormat-AllowRounding="false" Skin="Silk" Value="1" Width="75px" MinValue="0">
                                <NegativeStyle Resize="None" />
                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
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
                        <td class="auto-style2"><span class="auto-style1">* </span>Price (₹) (Excluded GST) :</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtPrice" runat="server" Width="100px" MaxLength="8" CssClass="txtBox" Skin="Silk" MinValue="0">
                                <NegativeStyle Resize="None" />
                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </telerik:RadNumericTextBox>
                            <asp:Label ID="lblCurrency" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr id="trSellingPrice" runat="server">
                        <td class="auto-style2"><span class="auto-style1">* </span>Selling Price (₹) :</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtSellingPrice" runat="server" Width="100px" MaxLength="8" CssClass="txtBox" Skin="Silk" MinValue="0">
                                <NegativeStyle Resize="None" />
                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </telerik:RadNumericTextBox>

                            <asp:RequiredFieldValidator ID="rfvSellingPrice" runat="server" ControlToValidate="txtSellingPrice" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>

                        </td>
                    </tr>






                    <tr>
                        <td class="auto-style2">Dealer Discount (in %)  :</td>

                        <td><telerik:RadNumericTextBox ID="txtDealerDiscount" runat="server" Width="75px" MaxLength="5" CssClass="txtBox" Skin="Silk" MinValue="1" AutoPostBack="True" MaxValue="99" OnTextChanged="txtDealerDiscount_TextChanged">
                                <NegativeStyle Resize="None" />
                                <NumberFormat DecimalDigits="2" ZeroPattern="n" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </telerik:RadNumericTextBox>
                            &nbsp;i.e. 12.75 %</td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Dealer Margin (&#8377;) :</td>

                        <td>

                            <asp:Label ID="lblDealerMargin" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style2">Dealer Price (&#8377;) :</td>

                        <td>

                            <asp:Label ID="lblDealerPrice" runat="server"></asp:Label>
                        </td>
                    </tr>


                    <tr>
                        <td class="auto-style2">GST (in %):</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtVat" runat="server" Width="75px" MaxLength="5" CssClass="txtBox" Skin="Silk" MinValue="1" MaxValue="99">
                                <NegativeStyle Resize="None" />
                                <NumberFormat DecimalDigits="2" ZeroPattern="n" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </telerik:RadNumericTextBox>
                            &nbsp;i.e. 12.75 %</td>
                    </tr>
















                    <tr>
                        <td class="RadUpload_rtl"></td>
                        <td>
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit" ValidationGroup="C" OnClick="btnAdd_Click" />
                            &nbsp;&nbsp;<%--<asp:SqlDataSource ID="dsPurity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Purity_Master_tbl] ORDER BY [purity_name]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsPurity1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Purity_Master_tbl] WHERE ([metal_id] = @metal_id) ORDER BY [purity_name]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlMetal" Name="metal_id" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsMetal" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Metal_Master_tbl] ORDER BY [metal_name]"></asp:SqlDataSource>--%><asp:SqlDataSource ID="dsColors" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [color_master_tbl] ORDER BY [color_name]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsCurrency" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [currency_rate_tbl] ORDER BY [currency]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="DSBrands" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [brand_master_tbl] ORDER BY [brand_name]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [cid], [cat_name] FROM [Category_tbl] ORDER BY [cat_name]"></asp:SqlDataSource>

                            <%--  <asp:SqlDataSource ID="dsManufacturer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [manufacturer_name] FROM [manufacturer_master_tbl] ORDER BY [manufacturer_name]"></asp:SqlDataSource>

                        <asp:SqlDataSource ID="dsModel" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [model] FROM [manufacturer_model_tbl] WHERE ([manufacturer_id] = @manufacturer_id) ORDER BY [model]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlManufacturer" Name="manufacturer_id" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>

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

