<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_products_quantity.aspx.cs" Inherits="admin_add_products_quantity" %>

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

        table.gridcss td, th {
            padding: 5px;
        }
        .auto-style2 {
            height: 31px;
        }
        .auto-style3 {
            height: 31px;
            text-align: right;
        }

        .RadInputRTL
        {
            text-align: right;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">

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
                        <td class="RadInputRTL" style="width:130px;" >
                            <span class="auto-style1">* </span>Category :</td>
                        <td>
                            <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged" CssClass="txtBox">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr id="trSubCategory" runat="server">
                        <td class="auto-style3"><span class="auto-style1">* </span>Sub Category :</td>

                        <td class="auto-style2">
                            <asp:DropDownList ID="ddlSubcategory" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVsubcat" runat="server" ControlToValidate="ddlSubcategory" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                       <tr id="trBrand" runat="server">
                        <td class="RadInputRTL" ><span class="auto-style1">* </span>Brand :</td>
                        <td align="left">
                            <asp:DropDownList ID="ddlBrands" runat="server" CssClass="txtBox"  AutoPostBack="True" OnSelectedIndexChanged="ddlBrands_SelectedIndexChanged">
                                <asp:ListItem Text="Select" Value="0">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVbrand" runat="server" ControlToValidate="ddlBrands" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>

                        </td>
                    </tr>

                     <tr>
                        <td class="RadInputRTL" ><span class="auto-style1">* </span>Products :</td>
                        <td align="left">
                            <asp:DropDownList ID="ddlProducts" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged">
                                <asp:ListItem Text="Select" Value="0">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlProducts" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>

                        </td>
                    </tr>

                     <tr>
                        <td class="RadInputRTL" style="vertical-align:top;" >Product Details: </td>
                        <td align="left">
                           
                            SKU#: <asp:Label ID="lblSku" runat="server" ></asp:Label><br />
                            Price: <asp:Label ID="lblPrice" runat="server" ></asp:Label><br />
                            Selling Price: <asp:Label ID="lblSellingPrice" runat="server" ></asp:Label><br />
                            Short Desccription: <asp:Label ID="lblShortDesc" runat="server" ></asp:Label><br /> 
                           
                        </td>
                    </tr>




<%--                    <tr id="trFitment" runat="server">
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
                    </tr>--%>


                 
                  


                    <tr id="trSize" runat="server">
                        <td  valign="top" class="RadInputRTL">Size/Color/Quantity :</td>
                        <td align="left">

                            <div id="dvGrid" style="padding: 10px; width: 500px">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  CssClass="gridcss"
                                            DataKeyNames="id" 
                                             EmptyDataText="No records has been added."
                                            Width="500">
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
                                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("stock_qty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("added_qty") %>' Width="60"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                               
                                               <%-- <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" HeaderText="Action" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-Width="150" />--%>
                                            </Columns>
                                        </asp:GridView>
                                        <table border="1" cellpadding="5" cellspacing="5" style="border-collapse: collapse">
                                            <tr>
                                               <td style="width: 150px" id="tdSize" runat="server">
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
                                                    </asp:DropDownList>
                                                </td>

                                                <td style="width: 150px">
                                                   <%-- <asp:TextBox ID="txtQuantity1" runat="server" Width="60" placeholder="Quantity"  />--%>
                                                     <telerik:RadNumericTextBox ID="txtQuantity1" runat="server" CssClass="txtBox" MaxLength="6" NumberFormat-AllowRounding="false" Skin="Silk" Width="75px" MinValue="1" ></telerik:RadNumericTextBox><br />
                                                     <asp:RequiredFieldValidator ID="rfvQty1" runat="server" ControlToValidate="txtQuantity1" CssClass="txt_validation" Display="Dynamic" ErrorMessage="enter quantity!"  ValidationGroup="q"></asp:RequiredFieldValidator>
                                                </td>                                                
                                            </tr>

                                            <tr><td style="text-align:center" colspan="3">
                                                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Add" OnClick="Insert" ValidationGroup="q" />
                                                </td>

                                            </tr>

                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>


                        </td>
                    </tr>


                  
                 


                    <tr>
                        <td class="RadInputRTL" ></td>
                        <td>
                           
                            <asp:SqlDataSource ID="dsColors" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [color_master_tbl] ORDER BY [color_name]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsCurrency" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [currency_rate_tbl] ORDER BY [currency]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="DSBrands" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [brand_master_tbl] ORDER BY [brand_name]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [cid], [cat_name] FROM [Category_tbl] ORDER BY [cat_name]"></asp:SqlDataSource>

                           

                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Button1" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

