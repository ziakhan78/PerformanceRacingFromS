<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_dealers.aspx.cs" Inherits="admin_add_dealers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style7 {
            width: 150px;
            vertical-align: middle;
            text-align: right;
        }

        .style8 {
        }

        .style9 {
            vertical-align: middle;
        }

        .style10 {
            text-align: left;
        }

        .style11 {
            text-align: left;
            vertical-align: middle;
        }

        .style12 {
            color: #FF0000;
        }

        .auto-style1 {
            width: 150px;
            vertical-align: middle;
            text-align: right;
            height: 28px;
        }

        .validation {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

             <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAdd">

            <table class="txt" style="width: 100%;" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title">Add Dealers</td>
                </tr>
                <tr>
                    <td align="right" class="style7">&nbsp;</td>

                    <td class="txt">&nbsp;</td>
                </tr>

               
                <tr id="trBCompName" runat="server">
                    <td align="right" class="style7"><span class="style12">* </span>Company Name :</td>
                    <td class="style10">
                        <asp:TextBox ID="txtCompanyName" runat="server" Width="350px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVCompName" runat="server" ControlToValidate="txtCompanyName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top" class="style7">
                        <span class="style12">*</span> Address Line-1 :</td>
                    <td align="left" class="style11">
                        <asp:TextBox ID="txtAddress1" runat="server" Width="350px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVAdd1" runat="server" ControlToValidate="txtAddress1" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top" class="style7">
                        Address Line-2 :</td>
                    <td align="left" class="style11">
                        <asp:TextBox ID="txtAddress2" runat="server" CssClass="txtBox" ValidationGroup="P" Width="350px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top" class="auto-style1">Landmark :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtLandmark" runat="server" Width="350px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>        

                <tr>
                    <td align="right" valign="top" class="style7">
                        Pin :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtPin" runat="server" Width="100px" ValidationGroup="P"
                            CssClass="txtBox" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top" class="style7">City :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtCity" runat="server" Width="200px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top" class="style7"><span class="style12">* </span>State :</td>
                    <td class="style11">
                       <%-- <asp:TextBox ID="txtState" runat="server" Width="200px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlState" runat="server" DataSourceID="dsState" DataTextField="state_name" DataValueField="state_id" AppendDataBoundItems="true" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState" CssClass="txt_validation" Display="Dynamic" InitialValue="0" ErrorMessage="Select State!" ValidationGroup="C"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="dsState" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [State_tbl] where country_id='99' ORDER BY [state_name]"></asp:SqlDataSource>
                    </td>
                </tr>
               


             <tr>
                    <td align="right" valign="top" class="style7">Mobile No.-1 :</td>
                    <td class="style10">
                        <asp:TextBox ID="txtMobileCc1" runat="server" CssClass="txtBox" Width="35px"
                            MaxLength="3"></asp:TextBox>
                        -
                <asp:TextBox ID="txtMobile1" runat="server" CssClass="txtBox"
                    Width="90px" MaxLength="10"></asp:TextBox>                       
                        <asp:RegularExpressionValidator ID="REVPrice" runat="server"
                            ControlToValidate="txtMobile1" Display="Dynamic"
                            ErrorMessage="Mobile No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$"
                            ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
                    </td>
                </tr>


                 <tr>
                    <td align="right" valign="top" class="style7">Mobile No.-2 :</td>
                    <td class="style10">
                        <asp:TextBox ID="txtMobileCc2" runat="server" CssClass="txtBox" Width="35px"
                            MaxLength="3"></asp:TextBox>
                        -
                <asp:TextBox ID="txtMobile2" runat="server" CssClass="txtBox"
                    Width="90px" MaxLength="10"></asp:TextBox>
                       
                    </td>
                </tr>



                <tr>
                    <td align="right" valign="top" class="style7">Phone No.-1 :</td>
                    <td class="style10">
                        <asp:TextBox ID="txtPhCC1" runat="server" CssClass="txtBox" Width="35px"
                            MaxLength="3"></asp:TextBox>
                        -
                <asp:TextBox ID="txtPhAC1" runat="server" CssClass="txtBox" Width="40px"
                    MaxLength="4"></asp:TextBox>
                        -
                <asp:TextBox ID="txtPhone1" runat="server" CssClass="txtBox" Width="86px"
                    MaxLength="8"></asp:TextBox>
                          </td>
                </tr>

                <tr>
                    <td align="right" valign="top" class="style7">&nbsp;Phone No.-2 :</td>
                    <td class="style10">
                        <asp:TextBox ID="txtPhCC2" runat="server" CssClass="txtBox" Width="35px"
                            MaxLength="3"></asp:TextBox>
                        -
                <asp:TextBox ID="txtPhAC2" runat="server" CssClass="txtBox" Width="40px"
                    MaxLength="4"></asp:TextBox>
                        -
                <asp:TextBox ID="txtPhone2" runat="server" CssClass="txtBox" Width="86px"
                    MaxLength="8"></asp:TextBox>
                    </td>
                </tr>


                <tr>
                    <td align="right" valign="top" class="style7">&nbsp;Fax No. :</td>
                    <td class="style10">
                        <asp:TextBox ID="txtFaxCC1" runat="server" CssClass="txtBox" Width="35px"
                            MaxLength="3"></asp:TextBox>
                        -
                <asp:TextBox ID="txtFaxAC1" runat="server" CssClass="txtBox" Width="40px"
                    MaxLength="4"></asp:TextBox>
                        -
                        <asp:TextBox ID="txtFax1" runat="server" CssClass="txtBox" MaxLength="8" Width="86px"></asp:TextBox>
                    </td>
                </tr>

                       <tr>
                    <td align="right" valign="top" class="auto-style1">Working Days :</td>
                    <td class="style11">
                        From: <asp:DropDownList ID="ddlFromDays" runat="server" CssClass="txtBox"></asp:DropDownList> To:  <asp:DropDownList ID="ddlToDays" runat="server" CssClass="txtBox"></asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                    <td align="right" valign="top" class="auto-style1">Working Time :</td>
                    <td class="style11">
                        From: <telerik:RadDateInput ID="timeFrom" runat="server" DateFormat="hh:mm tt" CssClass="txtBox" Width="100" Skin="Silk" EmptyMessage="HH:MM"></telerik:RadDateInput>
                        To: <telerik:RadDateInput ID="timeTo" runat="server" DateFormat="hh:mm tt" CssClass="txtBox" Width="100" Skin="Silk" EmptyMessage="HH:MM"></telerik:RadDateInput> 
                        
                    </td>
                </tr>


                  <tr>
                    <td align="right" valign="top" class="auto-style1">Closed On :</td>
                    <td class="style11">
                      <%--  <asp:DropDownList ID="ddlClosedOn" runat="server" CssClass="txtBox"></asp:DropDownList>--%>

                        <asp:RadioButtonList ID="ddlClosedOn" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
                    </td>
                </tr>
                
                 

                <tr>
                    <td align="right" valign="top" class="auto-style1">GST No. :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtVat" runat="server" Width="200px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>


                    </td>
                </tr>

                  <tr>
                    <td align="right" valign="top" >Upload GST Certificate :</td>
                    <td class="style11">
                       <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" InputSize="57"  MaxFileSize="512000" AllowedFileExtensions="jpg,jpeg,png" EnableInlineProgress="true" Skin="Silk" MultipleFileSelection="Disabled"  OnFileUploaded="RadAsyncUpload1_FileUploaded" />
                        <span class="txt_validation">Please upload only .jpg, .jpeg, .gif or .png image.  maximum file size limit is 500 kb.</span><br />
                        <asp:Image ID="vatImg" runat="server" BorderWidth="0" Height="100px" Width="100px" />
                      

                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top" >PAN No. :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtPan" runat="server" Width="200px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>

                    </td>
                </tr>

                  <tr>
                    <td align="right" valign="top" >Upload PAN Card :</td>
                    <td class="style11">
                       <telerik:RadAsyncUpload ID="RadAsyncUpload2" runat="server" ChunkSize="0" InputSize="57"  MaxFileSize="512000" AllowedFileExtensions="jpg,jpeg,png" EnableInlineProgress="true" Skin="Silk" MultipleFileSelection="Disabled" OnFileUploaded="RadAsyncUpload2_FileUploaded" />
                        <span class="txt_validation">Please upload only .jpg, .jpeg, .gif or .png image.  maximum file size limit is 500 kb.</span><br />
                        <asp:Image ID="panImg" runat="server" BorderWidth="0" Height="100px" Width="100px" />
                      

                    </td>
                </tr>

              


                    <tr>
                    <td align="right" valign="top" class="auto-style1">Website Url :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtWebsite" runat="server" Width="350px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>

                    </td>
                </tr>

                 <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" >Brands Represented : </td>
           
            <td >
                 <asp:CheckBoxList ID="chkBrandList" runat="server" DataSourceID="SqlDataSource1" DataTextField="brand_name" DataValueField="id" RepeatColumns="5" RepeatDirection="Horizontal">
                           
                        </asp:CheckBoxList>
            </td>
           
        </tr>


                
                    <tr>
                    <td align="right" valign="top" class="auto-style1">Email-Id :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtEmailId" runat="server" Width="350px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>

                    </td>
                </tr>

                
               <tr >
            <td align="right" class="style7">Credit Facilities :</td>
            <td class="style10">
                <asp:RadioButtonList ID="rbtnCredit" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnCredit_SelectedIndexChanged">
                    <asp:ListItem Text="No" Value="0" Selected="True"></asp:ListItem>
                     <asp:ListItem Text="Yes" Value="1" ></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>

          <tr id="trCreditPeriod" runat="server">
            <td align="right" class="style7"><span class="style12">*</span>Credit Period :</td>
            <td class="style10">
                <asp:DropDownList ID="ddlCreditPeriod" runat="server" CssClass="txtBox">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem Value="1">30</asp:ListItem>
                    <asp:ListItem Value="2">60</asp:ListItem>
                    <asp:ListItem Value="3">90</asp:ListItem>
                    <asp:ListItem Value="4">120</asp:ListItem>
                    <asp:ListItem Value="5">180</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvCreditPeriod" runat="server" ControlToValidate="ddlCreditPeriod" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Credit Period!" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>

          <tr id="trCreditLimit" runat="server">
            <td align="right" class="style7"><span class="style12">*</span>Credit Limit (&#8377;):</td>
            <td class="style10">               
                <telerik:RadNumericTextBox ID="txtCreditLimit" runat="server" AutoPostBack="True" CssClass="txtBox" MaxLength="8" MinValue="0" Skin="Silk" Width="100px">
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
                <asp:RequiredFieldValidator ID="rfvtxtCreditLimit" runat="server" ControlToValidate="txtCreditLimit" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>



                <tr>
                    <td class="style7">&nbsp;</td>
                    <td class="style11">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" OnClick="btnAdd_Click" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                            Text="Reset" OnClick="btnCancel_Click" />
                        
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [brand_name], [id] FROM [brand_master_tbl] ORDER BY [brand_name]"></asp:SqlDataSource>
               
                    </td>
                </tr>

            </table>

                 </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger  ControlID="btnAdd"   />
        </Triggers>

    </asp:UpdatePanel>
</asp:Content>

