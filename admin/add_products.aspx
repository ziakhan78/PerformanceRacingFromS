<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_products.aspx.cs" Inherits="admin_add_products" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../js/scripts.js"></script>
      <link href="../css/font-awesome.min.css" rel="stylesheet" />

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

        table.gridcss td, th {
            padding: 5px;
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
                        <td style="width: 190px;" class="RadUpload_rtl">
                            <span class="auto-style1">* </span>Category :</td>
                        <td>
                            <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged" CssClass="txtBox">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr id="trSubCategory" runat="server">
                        <td class="RadUpload_rtl"><span class="auto-style1">* </span>Sub Category :</td>

                        <td>
                            <asp:DropDownList ID="ddlSubcategory" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVsubcat" runat="server" ControlToValidate="ddlSubcategory" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>




                    <tr id="trFitment" runat="server">
                        <td align="right" valign="middle"><span class="auto-style1">* </span>Fitment :</td>
                        <td>
                            <asp:RadioButtonList ID="rbtnFitment" runat="server" CssClass="txt" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnFitment_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="0" Text="Universal"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Specific"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>


                    <tr id="trManufacturer" runat="server">
                        <td class="RadUpload_rtl">
                            <span class="auto-style1">* </span>Bike Manufacturer :</td>

                        <td>
                            <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="txtBox" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddlManufacturer_SelectedIndexChanged">
                                <asp:ListItem Value="0" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvManufacturer" runat="server" ControlToValidate="ddlManufacturer" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>


                    <tr id="trModel" runat="server">
                        <td align="right" valign="top">Model :</td>
                        <td valign="top">
                            <asp:RadioButtonList ID="rbtnModel" runat="server" CssClass="txt" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnModel_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="0" Text="All"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Specific"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CheckBoxList ID="chkModel" runat="server" CssClass="txt" RepeatDirection="Horizontal" RepeatColumns="5">
                            </asp:CheckBoxList>
                        </td>
                    </tr>


                    <tr id="trBrand" runat="server">
                        <td class="RadUpload_rtl"><span class="auto-style1">* </span>Brand :</td>
                        <td align="left">
                            <asp:DropDownList ID="ddlBrands" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlBrands_SelectedIndexChanged">
                                <asp:ListItem Text="Select" Value="0">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVbrand" runat="server" ControlToValidate="ddlBrands" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>

                        </td>
                    </tr>

                    <tr>
                        <td class="RadUpload_rtl">
                            <span class="auto-style1">* </span>Product Name :</td>
                        <td>
                            <asp:TextBox ID="txtProName" runat="server" Width="400px"
                                TextMode="SingleLine" CssClass="txtBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVcategory" runat="server"
                                ControlToValidate="txtProName" Display="Dynamic" ErrorMessage="Can't be left blank !"
                                ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CVpro" runat="server" ControlToValidate="txtProName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVpro_ServerValidate" ValidationGroup="C"></asp:CustomValidator>
                        </td>
                    </tr>

                   <%--  <tr>
                        <td class="RadUpload_rtl" valign="top"><span class="auto-style1">* </span>Colour :</td>
                        <td align="left">
                            <asp:DropDownList ID="ddlColor" runat="server" AppendDataBoundItems="true" CssClass="txtBox" DataSourceID="dsColors" DataTextField="color_name" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged">
                                <asp:ListItem Text="Select" Value="0">Select</asp:ListItem>
                                <asp:ListItem Text="None" Value="1">None</asp:ListItem>
                            </asp:DropDownList>--%>
                          <%--  <asp:CheckBoxList ID="ddlColor" runat="server" AppendDataBoundItems="true" DataSourceID="dsColors" DataTextField="color_name" DataValueField="id" RepeatDirection="Horizontal" RepeatColumns="8">
                            </asp:CheckBoxList>
                        </td>
                    </tr>--%>

                    <tr id="trImportedDate" runat="server">
                        <td class="RadUpload_rtl">Imported Date :</td>

                        <td align="left">
                            <telerik:RadMonthYearPicker ID="importedDate" runat="server" Skin="Silk" Culture="en-US" HiddenInputTitleAttibute="Visually hidden input created for functionality purposes.">
                                <DateInput DateFormat="MM-yyyy" DisplayDateFormat="MM-yyyy" LabelWidth="40%">
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </DateInput>
                                <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                <MonthYearNavigationSettings DateIsOutOfRangeMessage="Cancel" />
                            </telerik:RadMonthYearPicker>
                        </td>
                    </tr>


                    <tr>
                        <td class="RadUpload_rtl">
                            <span class="auto-style1">* </span>SKU# :</td>

                        <td>
                            <asp:TextBox ID="txtSku" runat="server" Width="200px"
                                TextMode="SingleLine" CssClass="txtBox" MaxLength="25"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSku" runat="server"
                                ControlToValidate="txtSku" Display="Dynamic" ErrorMessage="Can't be left blank !"
                                ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CVsku" runat="server" ControlToValidate="txtSku" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVsku_ServerValidate" ValidationGroup="C"></asp:CustomValidator>

                        </td>
                    </tr>

                    <tr id="trBarcode" runat="server">
                        <td class="RadUpload_rtl" valign="top">Barcode :</td>

                        <td>
                            <asp:Image ID="imgBarcode" runat="server" />
                        </td>
                    </tr>


                    <%--   <tr>
                        <td class="RadUpload_rtl" valign="top">Barcode :</td>
                        <td>
                            <telerik:RadBarcode ID="RadBarcode1" runat="server" Height="65px" Type="EAN13" Width="250px">
                            </telerik:RadBarcode>
                        </td>
                    </tr>--%>


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
                        <td class="RadUpload_rtl" valign="top">Size / Colour / Qty :</td>
                        <td align="left">

                            <div id="dvGrid" style="padding: 10px; width: 650px">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound" CssClass="gridcss"
                                            DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
                                            Width="650">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Size" ItemStyle-Width="150" HeaderStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSize" runat="server" Text='<%# Eval("Size") %>'></asp:Label>
                                                    </ItemTemplate>                                                  
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Color" ItemStyle-Width="200" HeaderStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblColor" runat="server" Text='<%# Eval("Color") %>'></asp:Label>
                                                    </ItemTemplate>                                                   
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="150" HeaderStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("added_qty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("added_qty") %>' Width="60" ></asp:TextBox>
                                                    </EditItemTemplate>
                                                    
                                                </asp:TemplateField>
                                                
                                                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" HeaderText="Action" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="150" />

                                            </Columns>
                                        </asp:GridView>
                                        <table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" width="650px">
                                            <tr>
                                                <td style="width: 150px" id="tdSise" runat="server">
                                                    <asp:DropDownList ID="ddlSize" runat="server" CssClass="txtBox">
                                                        <asp:ListItem Text="Size" Value="0">Size</asp:ListItem>
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
                                                        <asp:ListItem Text="Size" Value="0">Size</asp:ListItem>
                                                        <asp:ListItem Text="39" Value="1">39</asp:ListItem>
                                                        <asp:ListItem Text="40" Value="2">40</asp:ListItem>
                                                        <asp:ListItem Text="41" Value="3">41</asp:ListItem>
                                                        <asp:ListItem Text="42" Value="4">42</asp:ListItem>
                                                        <asp:ListItem Text="43" Value="5">43</asp:ListItem>
                                                        <asp:ListItem Text="44" Value="6">44</asp:ListItem>
                                                        <asp:ListItem Text="45" Value="7">45</asp:ListItem>
                                                        <asp:ListItem Text="46" Value="8">46</asp:ListItem>
                                                         <asp:ListItem Text="47" Value="9">47</asp:ListItem>
                                                         <asp:ListItem Text="48" Value="10">48</asp:ListItem>
                                                    </asp:DropDownList><br />
                                                     <asp:RequiredFieldValidator ID="rfvSize" runat="server" ControlToValidate="ddlSize" CssClass="txt_validation" Display="Dynamic" ErrorMessage="select size!" InitialValue="0" ValidationGroup="q"></asp:RequiredFieldValidator>
                                                     <asp:RequiredFieldValidator ID="rfvSizeBoot" runat="server" ControlToValidate="chkBootSize" CssClass="txt_validation" Display="Dynamic" ErrorMessage="select size!" InitialValue="0" ValidationGroup="q"></asp:RequiredFieldValidator>
                                                </td>

                                                  <td style="width: 200px">
                                                    <asp:DropDownList ID="ddlColor" runat="server" CssClass="txtBox" DataSourceID="dsColors" DataTextField="color_name" DataValueField="id" AppendDataBoundItems="true">
                                                        <asp:ListItem Text="Colour" Value="0">Colour</asp:ListItem>                                                     
                                                    </asp:DropDownList><br />
                                                    <asp:RequiredFieldValidator ID="rfvColor" runat="server" ControlToValidate="ddlColor" InitialValue="0" CssClass="txt_validation" Display="Dynamic" ErrorMessage="select colour!"  ValidationGroup="q"></asp:RequiredFieldValidator>

                                                </td>

                                                <td style="width: 150px">
                                                   <%-- <asp:TextBox ID="txtQuantity1" runat="server" Width="60" placeholder="Quantity"  />--%>
                                                     <telerik:RadNumericTextBox ID="txtQuantity1" runat="server" CssClass="txtBox" MaxLength="6" NumberFormat-AllowRounding="false" Skin="Silk" Width="75px" MinValue="0" placeholder="Quantity" ></telerik:RadNumericTextBox><br />
                                                     <asp:RequiredFieldValidator ID="rfvQty1" runat="server" ControlToValidate="txtQuantity1" CssClass="txt_validation" Display="Dynamic" ErrorMessage="enter quantity!"  ValidationGroup="q"></asp:RequiredFieldValidator>


                                                </td>
                                                <td style="width: 150px">
                                                    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Insert" ValidationGroup="q" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>




                        </td>
                    </tr>


                    <%--<tr>
                        <td class="RadUpload_rtl">Currency :</td>
                        <td align="left">
                            <asp:DropDownList ID="ddlCurrency" runat="server" AppendDataBoundItems="True" CssClass="txtBox" DataSourceID="dsCurrency" DataTextField="currency" DataValueField="rate">
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RFVCurrency" runat="server" ControlToValidate="ddlCurrency" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Currency!" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>

                        </td>
                    </tr>--%>

                    <tr>
                        <td class="RadUpload_rtl"><span class="auto-style1">* </span>Basic Price (<i class="fa fa-inr"></i>) (Excluded GST) :</td>

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

                      <tr>
                        <td class="RadUpload_rtl"><span class="auto-style1">* </span>HSN Code :</td>
                          <td>    <asp:DropDownList ID="ddlHsnCode" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="ddlHsnCode_SelectedIndexChanged" CssClass="txtBox">                                
                            </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="rfvHsnCode" runat="server" ControlToValidate="ddlHsnCode" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                  
                       
                         </td>
                    </tr>

                  

                     <tr>
                        <td class="RadUpload_rtl"><span class="auto-style1">* </span>GST (in %):</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtVat" runat="server" Width="75px" MaxLength="5" CssClass="txtBox" Skin="Silk" MinValue="1" MaxValue="99" AutoPostBack="true" OnTextChanged="txtVat_TextChanged">
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
                            &nbsp;i.e. 12.75 %<asp:RequiredFieldValidator ID="rfvGst" runat="server" ControlToValidate="txtVat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr >
                        <td class="RadUpload_rtl"><span class="auto-style1">* </span>Selling Price (<i class="fa fa-inr"></i>) (Inclusive GST) :</td>

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


                    <tr id="trDealer" runat="server">
                        <td colspan="2" style="width: 100%;">
                            <table style="width: 100%;">



                                <tr>
                                    <td style="width: 232px" class="RadUpload_rtl">Dealer Discount (in %)  :</td>

                                    <td>&nbsp;
                            <telerik:RadNumericTextBox ID="txtDealerDiscount" runat="server" Width="75px" MaxLength="5" CssClass="txtBox" Skin="Silk" MinValue="1" AutoPostBack="True" MaxValue="99" OnTextChanged="txtDealerDiscount_TextChanged">
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
                                    <td class="RadUpload_rtl">Dealer Margin (<i class="fa fa-inr"></i>) :</td>
                                    <td>
                                        <asp:Label ID="lblDealerMargin" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="RadUpload_rtl">Dealer Price (<i class="fa fa-inr"></i>) :</td>

                                    <td>

                                        <asp:Label ID="lblDealerPrice" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                   



<tr id="trQty" runat="server">
                        <td class="RadUpload_rtl">Opening Quantity :</td>
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
                        <td class="RadUpload_rtl">Product Weight (kg) :</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtProductWeight" runat="server" CssClass="txtBox" MaxLength="7" NumberFormat-AllowRounding="false" Skin="Silk" Width="75px" MinValue="0">
                                <NegativeStyle Resize="None" />
                                <NumberFormat AllowRounding="False" DecimalDigits="3" GroupSizes="9" KeepTrailingZerosOnFocus="True" ZeroPattern="n" />
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
                        <td class="RadUpload_rtl">Height (inches) :</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtHeight" runat="server" CssClass="txtBox" MaxLength="5" NumberFormat-AllowRounding="false" Skin="Silk" Width="75px">
                                <NegativeStyle Resize="None" />
                                <NumberFormat AllowRounding="False" GroupSizes="8" ZeroPattern="n" />
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
                        <td class="RadUpload_rtl">Width (inches) :</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtWidth" runat="server" CssClass="txtBox" MaxLength="5" NumberFormat-AllowRounding="false" Skin="Silk" Width="75px">
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>


                    <tr>
                        <td class="RadUpload_rtl">Lenght (inches) :</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtLenght" runat="server" CssClass="txtBox" MaxLength="5" NumberFormat-AllowRounding="false" Skin="Silk" Width="75px">
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>










                    <%--
                <tr>
                    <td align="right" valign="middle">Featured Product :</td>
                    <td align="left">&nbsp;<asp:CheckBox ID="chkFeaturedProduct" runat="server" /> Product will be displayed for 30 days from the date of submission
                    </td>
                </tr>--%>


                    <tr id="trExclusive" runat="server">
                        <td align="right" valign="middle">Exclusive :</td>
                        <td align="left">&nbsp;<asp:CheckBox ID="chkIsExclusive" runat="server" />
                        </td>
                    </tr>

                    <%--  <tr>
                    <td align="right" valign="middle">Latest :</td>
                    <td align="left">&nbsp;<asp:CheckBox ID="chkIsLatest" runat="server" /> Product will be displayed for 15 days from the date of submission
                    </td>
                </tr>--%>




                    <tr id="trStock" runat="server">
                        <td align="right" valign="middle">Stock :</td>
                        <td class="style10">
                            <asp:RadioButtonList ID="rbtnStock" runat="server" CssClass="txt" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtnStock_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="0" Text="Ex-Stock"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Pre Order"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr id="trDeliveryTime" runat="server">
                        <td align="right" valign="middle">Delivery Time :</td>
                        <td class="style10">
                            <asp:DropDownList ID="ddlDeliveryTime" runat="server" CssClass="txtBox">
                                <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                <asp:ListItem Value="9" Text="9"></asp:ListItem>
                                <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                <asp:ListItem Value="11" Text="11"></asp:ListItem>
                                <asp:ListItem Value="12" Text="12"></asp:ListItem>
                            </asp:DropDownList>
                            Week(s)</td>
                    </tr>


                    <tr>
                        <td align="right" valign="top">Product Short Description :</td>
                        <td class="style10">
                            <asp:TextBox ID="txtShortDesc" runat="server" TextMode="MultiLine" Height="60px" MaxLength="180" Width="100%" CssClass="txtBox">
                            </asp:TextBox>
                        </td>
                    </tr>



                    <tr>
                        <td class="RadUpload_rtl" valign="top">Product Long Description :</td>

                        <td>
                            <telerik:RadEditor runat="server" ID="txtDesc" Width="100%" Height="200px" Skin="Silk" EditModes="Design" NewLineMode="Br">
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
                        <td align="right" valign="top">Product Tags :</td>
                        <td class="style10">
                            <asp:TextBox ID="txtProductTags" runat="server" Width="100%" CssClass="txtBox">
                            </asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="RadUpload_rtl" valign="middle">Upload Multiple Images :</td>

                        <td align="left">

                            <telerik:RadAsyncUpload ID="RadAsyncUpload2" runat="server" MultipleFileSelection="Automatic" MaxFileSize="409600" InputSize="53" AllowedFileExtensions="jpg,jpeg,png,gif" MaxFileInputsCount="10" OnClientValidationFailed="OnClientValidationFailed" Skin="Silk"></telerik:RadAsyncUpload>


                        </td>
                    </tr>

                    <tr>
                        <td class="RadUpload_rtl" valign="middle"></td>
                        <td align="left">
                            <span class="auto-style1">Please upload only .jpg or .png file, all files height: 1000px width: 1000px and maximum file size limit is 400 kb. </span>
                        </td>
                    </tr>



                    <tr>
                        <td class="RadUpload_rtl" valign="middle">Enter Video Link :</td>

                        <td align="left">
                            <asp:TextBox ID="txtYoutubeLink" runat="server" CssClass="txtBox" Width="98%"></asp:TextBox>
                        </td>
                    </tr>





                    <tr>
                        <td class="RadUpload_rtl" valign="top">&nbsp;</td>
                        <td align="left">
                            <table cellpadding="5" cellspacing="5">
                                <tr>

                                    <td align="center">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                            <ItemTemplate>
                                                <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                <div style="float: left;">



                                                    <asp:Image ID="img1" runat="server" BorderWidth="0" Height="100px" Width="100px" /><br />
                                                    <br />
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("images") %>' CommandName="Delete" AlternateText="Delete" ToolTip="Delete Image" ImageUrl="~/admin_icons/delete1.gif" />
                                                </div>

                                                <%-- <img src='../ProductsImages/<%# Eval("image_path") %>' alt="" BorderWidth="1" Height="100px" Width="100px"  >--%>
                                            </ItemTemplate>
                                        </asp:Repeater>



                                        <%--    <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [pid], [images] FROM [View_Products] WHERE ([pid] = @pid)">
                                          <SelectParameters>
                                              <asp:QueryStringParameter Name="pid" QueryStringField="pid" Type="Int32" />
                                          </SelectParameters>
                                    </asp:SqlDataSource>--%>


                                                                   
                                    </td>

                                </tr>
                            </table>
                        </td>
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
                          <%--  <asp:SqlDataSource ID="DSBrands" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [brand_master_tbl] ORDER BY [brand_name]"></asp:SqlDataSource>--%>
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
