<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_bargain_product.aspx.cs" Inherits="Admin_add_bargain_product" %>

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
    </style>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
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
                        <td class="RadUpload_rtl"><span class="auto-style1">*</span>Product Name : </td>

                        <td>
                            <telerik:RadTextBox ID="txtName" runat="server" Width="400px" CssClass="txtBox" Skin="Silk">
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>

                    </tr>

                      <tr>
                    <td class="RadUpload_rtl">
                        <span class="auto-style1">* </span>SKU No. :</td>

                    <td>
                        <asp:TextBox ID="txtSku" runat="server" Width="200px"
                            TextMode="SingleLine" CssClass="txtBox" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSku" runat="server"
                            ControlToValidate="txtSku" Display="Dynamic" ErrorMessage="Can't be left blank !"
                            ValidationGroup="B" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CVsku" runat="server" ControlToValidate="txtSku" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVsku_ServerValidate" ValidationGroup="B"></asp:CustomValidator>
                    </td>
                </tr>

                    <tr>
                        <td align="right" valign="top" style="text-align: right; vertical-align: top;"
                            class="style2">Description : </td>

                        <td>
                            <telerik:RadEditor runat="server" ID="txtDesc" Width="100%" Height="200px" Skin="Silk" EditModes="Design">
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
                        <td class="RadUpload_rtl"><span class="auto-style1">*</span>Quantity : </td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtQuantity" runat="server" CssClass="txtBox" MaxLength="6" NumberFormat-AllowRounding="false" Skin="Silk" Value="1" Width="80px" MinValue="1">
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
                            <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="txtQuantity" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>

                    </tr>

                    <tr>
                        <td class="RadUpload_rtl"><span class="auto-style1">*</span>Weight (kg) :</td>

                        <td>
                            <telerik:RadNumericTextBox ID="txtProductWeight" runat="server" CssClass="txtBox" MaxLength="6" NumberFormat-AllowRounding="false" Skin="Silk" Width="80px" MinValue="0">
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
                            <asp:RequiredFieldValidator ID="rfvProduct" runat="server" ControlToValidate="txtProductWeight" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    </tr>


          <tr>
              <td class="RadUpload_rtl"><span class="auto-style1">*</span>Purchase Price : </td>

              <td>
                  <telerik:RadNumericTextBox ID="txtPurchasePrice" runat="server" CssClass="txtBox" MaxLength="6" Skin="Silk" Width="80px" MinValue="0">
                  </telerik:RadNumericTextBox>
                  <asp:RequiredFieldValidator ID="rfvPurchasePrice" runat="server" ControlToValidate="txtPurchasePrice" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="B"></asp:RequiredFieldValidator>

              </td>
          </tr>

                    
          <tr>
              <td class="RadUpload_rtl"><span class="auto-style1">*</span>Selling Price : </td>

              <td>
                  <telerik:RadNumericTextBox ID="txtSellingPrice" runat="server" CssClass="txtBox" MaxLength="6" Skin="Silk" Width="80px" MinValue="0">
                  </telerik:RadNumericTextBox>
                  <asp:RequiredFieldValidator ID="rfvSellingPrice" runat="server" ControlToValidate="txtSellingPrice" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="B"></asp:RequiredFieldValidator>

              </td>
          </tr>

                      <tr>
                    <td class="RadUpload_rtl" >Colour :</td>

                    <td align="left">
                        <asp:DropDownList ID="ddlColor" runat="server" AppendDataBoundItems="true" CssClass="txtBox" DataSourceID="dsColors" DataTextField="color_name" DataValueField="id" >
                             <asp:ListItem Text="Select" Value="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>


                    <tr>
                        <td align="right" class="style2" style="text-align: right; vertical-align: top;" valign="top">Notes : </td>
                        <td>
                            <telerik:RadEditor ID="txtNotes" runat="server" EditModes="Design" Height="200px" Skin="Silk" Width="100%">
                                <CssFiles>
                                    <telerik:EditorCssFile Value="../css/editor.css" />
                                </CssFiles>
                                <Tools>
                                    <telerik:EditorToolGroup>
                                        <telerik:EditorTool Name="Bold" />
                                        <telerik:EditorTool Name="Italic" />
                                        <telerik:EditorTool Name="Underline" />
                                        <telerik:EditorTool Name="LinkManager" />
                                        <telerik:EditorTool Name="Unlink" />
                                        <telerik:EditorTool Name="JustifyFull" />
                                        <telerik:EditorTool Name="JustifyCenter" />
                                        <telerik:EditorTool Name="JustifyLeft" />
                                        <telerik:EditorTool Name="JustifyRight" />
                                        <telerik:EditorTool Name="InsertUnorderedList" />
                                        <telerik:EditorTool Name="InsertOrderedList" />
                                    </telerik:EditorToolGroup>
                                </Tools>
                            </telerik:RadEditor>
                        </td>
                    </tr>

                    <tr>
                        <td class="RadUpload_rtl" >Upload Images :</td>

                        <td >

                            <telerik:RadAsyncUpload ID="RadAsyncUpload2" runat="server" MultipleFileSelection="Automatic" MaxFileSize="409600" InputSize="53" AllowedFileExtensions="jpg,jpeg,png,gif" MaxFileInputsCount="10" OnClientValidationFailed="OnClientValidationFailed" Skin="Silk"></telerik:RadAsyncUpload>


                        </td>
                    </tr>

                    <tr>
                        <td class="RadUpload_rtl"></td>
                        <td align="left">
                            <span class="auto-style1">Please upload only .jpg or .png file, all files height: 1000px width: 1000px and maximum file size limit is 400 kb. </span>
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

                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2"></td>
                        <td align="left">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="B" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" OnClick="btnCancel_Click" Text="Reset" />
                            <asp:SqlDataSource ID="dsColors" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [color_master_tbl] ORDER BY [color_name]"></asp:SqlDataSource>
                        </td>
                    </tr>

                    </tr>

       


                </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

