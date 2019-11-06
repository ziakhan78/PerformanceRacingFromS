<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="AddCustomer.aspx.cs" Inherits="Admin_AddCustomer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style7 {
            width: 130px;
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
            width: 130px;
            vertical-align: middle;
            text-align: right;
            height: 28px;
        }

        .auto-style2 {
            padding-left: 5px;
            text-align: left;
            vertical-align: middle;
            color: #92294A;
            font-family: Arial, Verdana, tahoma;
            font-size: 12px;
            width: 550px;
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

       
    <table class="txt" style="width: 100%;" align="center">

        <tr>
            <td colspan="2" class="header_title">Register A New Customer</td>
        </tr>
        <tr>
            <td align="right" class="style7">&nbsp;</td>

            <td class="txt">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="header_subtitle" align="left">Billing Information
                <asp:Label ID="lblMsg" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" class="style7">Title :</td>
            <td class="style10">
                <asp:DropDownList ID="DDLTitle" runat="server" CssClass="txtBox" Width="60px">
                    <asp:ListItem>Mr.</asp:ListItem>
                    <asp:ListItem>Mrs.</asp:ListItem>
                    <asp:ListItem>Ms.</asp:ListItem>
                    <asp:ListItem>Dr.</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td align="right" class="style7">
                <span class="style12">*</span>
                First Name :</td>
            <td class="style10">
                <asp:TextBox ID="txtFName" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBFname" runat="server"
                    ControlToValidate="txtFName" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7"><span class="style12">*</span> Last Name :</td>
            <td class="style10">
                <asp:TextBox ID="txtLName" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBFname1" runat="server" ControlToValidate="txtLName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">Address Type :</td>
            <td align="left" >
                <asp:RadioButtonList ID="rbtnBAddType" runat="server"
                    RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnBAddType_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Home</asp:ListItem>
                    <asp:ListItem>Business</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="trBCompName" runat="server">
            <td align="right" class="style7">Company Name :</td>
            <td class="style10">
                <asp:TextBox ID="txtBCompanyName" runat="server" Width="350px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>

          <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span>
                Mobile No. :</td>
             <td class="style10">
                <asp:TextBox ID="txtMobileCc" runat="server" Width="40px"
                                    MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                &nbsp;-
                
                         <telerik:RadNumericTextBox ID="txtMobile" runat="server" MaxLength="10" Width="110px" CssClass="txtBox" Skin="Silk">
                             <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                         </telerik:RadNumericTextBox>

                                <asp:RequiredFieldValidator ID="RFVMobile" runat="server"
                                    ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Can't left blank !"
                                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">&nbsp;Phone No. :</td>
           <td class="style10">
                <asp:TextBox ID="txtPhoneCc" runat="server" Width="40px"
                                    MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                &nbsp;-
                <asp:TextBox ID="txtPhoneAc" runat="server" Width="50px"
                    MaxLength="4" CssClass="txtBox"></asp:TextBox>
                                &nbsp;-
                 <telerik:RadNumericTextBox ID="txtPhone" runat="server" MaxLength="8" Width="100px" CssClass="txtBox" Skin="Silk">
                     <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                 </telerik:RadNumericTextBox>
            </td>
        </tr>

        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span> Address :</td>
            <td align="left" class="style11">
                <asp:TextBox ID="txtAddress1" runat="server" Width="350px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBFname0" runat="server"
                    ControlToValidate="txtAddress1" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">&nbsp;</td>
            <td align="left" class="style11">
                <asp:TextBox ID="txtAddress2" runat="server" Width="350px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span>
                Zip Code :</td>
            <td class="style11">
                <telerik:RadNumericTextBox ID="txtZip" runat="server" MaxLength="6" Width="100px" CssClass="txtBox" Skin="Silk">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>
                                    <asp:RequiredFieldValidator ID="RFVBZip" runat="server"
                                        ControlToValidate="txtZip" Display="Dynamic" ErrorMessage="Can't left blank !"
                                        ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span>
                City :</td>
            <td class="style11">
                <asp:TextBox ID="txtCity" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBcity" runat="server"
                    ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td align="right" valign="top" class="style7"><span class="style12">*</span> State :</td>
            <td class="style11">
                <asp:DropDownList ID="DDLState" runat="server" CssClass="txtBox" Width="221px" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtBState" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBstate" runat="server" ControlToValidate="txtBState" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="auto-style1"><span class="style12">*</span> Country :</td>
           <td class="style11">
                <asp:DropDownList ID="DDLCountry" runat="server" CssClass="txtBox"
                    Width="221px" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtBCountry" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBcountry" runat="server" ControlToValidate="txtBCountry" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>

      

      <%--  <tr>
            <td align="right" valign="top" class="style7">Phone No. 2.&nbsp; </td>
            <td >
                <asp:TextBox ID="txtSecondPhone1" runat="server" CssClass="txtBoxPhone"
                    Width="35px" MaxLength="3"></asp:TextBox>
                &nbsp;-
                <asp:TextBox ID="txtSecondPhone2" runat="server" CssClass="txtBoxPhone"
                    Width="35px" MaxLength="4"></asp:TextBox>
                &nbsp;-
                <asp:TextBox ID="txtSecondPhone3" runat="server" CssClass="txtBoxPhone"
                    Width="90px" MaxLength="8"></asp:TextBox>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtSecondPhone3" Display="Dynamic"
                    ErrorMessage="Phone No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$"
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">Fax No.</td>
            <td >
                <asp:TextBox ID="txtFax1" runat="server" CssClass="txtBoxPhone" Width="35px"
                    MaxLength="3"></asp:TextBox>
                &nbsp;-
                <asp:TextBox ID="txtFax2" runat="server" CssClass="txtBoxPhone" Width="35px"
                    MaxLength="4"></asp:TextBox>
                &nbsp;-
                <asp:TextBox ID="txtFax3" runat="server" CssClass="txtBoxPhone"
                    Width="90px" MaxLength="8"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REVPrice0" runat="server"
                    ControlToValidate="txtFax3" Display="Dynamic"
                    ErrorMessage="Fax No. Should be numeric." ValidationExpression="^[-+]?\d*\.?\d*$"
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>--%>


        <tr>
            <td class="header_subtitle" colspan="2">Shipping Information</td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">&nbsp;</td>
            <td align="left">
               <asp:CheckBox ID="chkShippAsBill" runat="server" CssClass="rbl" Text="Use billing information for your shipping information"
                            AutoPostBack="True" OnCheckedChanged="chkShippAsBill_CheckedChanged" />
            </td>
        </tr>

        <tr>
            <td align="right" class="style7">
                <span class="style12">*</span>
                First Name :</td>
            <td class="style10">
                <asp:TextBox ID="txtSFname" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVSfname" runat="server"
                    ControlToValidate="txtSFname" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7"><span class="style12">*</span> Last Name :</td>
            <td class="style10">
                <asp:TextBox ID="txtSLName" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVSlname" runat="server" ControlToValidate="txtSLName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>

          <tr>
            <td align="right" class="style7">Address Type :</td>
            <td align="left">
                <asp:RadioButtonList ID="rbtnSAddType" runat="server"
                    RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnSAddType_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Home</asp:ListItem>
                    <asp:ListItem>Business</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>

        <tr id="trSCompName" runat="server">
            <td align="right" class="style7">Company Name :</td>
            <td class="style10">
                <asp:TextBox ID="txtSCompanyName" runat="server" Width="350px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>

          <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span>
                Mobile No. :</td>
            <td >
               <asp:TextBox ID="txtSMobileCc" runat="server"
                                            Width="40px" MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                        &nbsp;-
                  <telerik:RadNumericTextBox ID="txtSMobile" runat="server" MaxLength="10" Width="110px" CssClass="txtBox" Skin="Silk">
                      <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                  </telerik:RadNumericTextBox>
                                        <asp:RequiredFieldValidator ID="RFVSmobile" runat="server"
                                            ControlToValidate="txtSMobile" Display="Dynamic" ErrorMessage="Can't left blank !"
                                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">Phone No. :</td>
            <td >
                <asp:TextBox ID="txtSPhoneCc" runat="server" Width="40px"
                                            MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                        &nbsp;-
                <asp:TextBox ID="txtSPhoneAc" runat="server" Width="50px"
                    MaxLength="4" CssClass="txtBox"></asp:TextBox>
                                        &nbsp;-
                <telerik:RadNumericTextBox ID="txtSPhone" runat="server" MaxLength="8" Width="100px" CssClass="txtBox" Skin="Silk">
                    <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                </telerik:RadNumericTextBox></td>
        </tr>

        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span> Address :</td>
            <td class="style11">
                <asp:TextBox ID="txtSAddress1" runat="server" Width="350px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVSaddress1" runat="server"
                    ControlToValidate="txtSAddress1" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">&nbsp;</td>
            <td class="style11">
                <asp:TextBox ID="txtSAddress2" runat="server" Width="350px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span>
                Zip Code :</td>
            <td class="style11">
                <telerik:RadNumericTextBox ID="txtSZip" runat="server" MaxLength="6" Width="100px" CssClass="txtBox" Skin="Silk">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>
                                    <asp:RequiredFieldValidator ID="rfvSZip" runat="server"
                                        ControlToValidate="txtSZip" Display="Dynamic" ErrorMessage="Can't left blank !"
                                        ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span>
                City :</td>
            <td class="style11">
                <asp:TextBox ID="txtSCity" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVscity" runat="server"
                    ControlToValidate="txtSCity" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>


        <tr>
            <td align="right" valign="top" class="style7"><span class="style12">*</span> State :</td>
            <td class="style11">
                <asp:DropDownList ID="DDLSState" runat="server" CssClass="txtBox" Width="221px" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtSState" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVsstate" runat="server" ControlToValidate="txtSState" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td align="right" valign="top" class="style7"><span class="style12">*</span> Country :</td>
            <td class="style11">
                <asp:DropDownList ID="DDLSCountry" runat="server" CssClass="txtBox"
                    Width="221px" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtSCountry" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVscountry" runat="server" ControlToValidate="txtSCountry" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>


      
      <%--  <tr>
            <td align="right" valign="top" class="style7">Phone No. 2.</td>
            <td >
                <asp:TextBox ID="txtSecondSPhone1" runat="server" CssClass="txtBoxPhone"
                    Width="35px" MaxLength="3"></asp:TextBox>
                &nbsp;-
                <asp:TextBox ID="txtSecondSPhone2" runat="server" CssClass="txtBoxPhone"
                    Width="35px" OnTextChanged="TextBox2_TextChanged" MaxLength="4"></asp:TextBox>
                &nbsp;-
                <asp:TextBox ID="txtSecondSPhone3" runat="server" CssClass="txtBoxPhone"
                    Width="90px" MaxLength="8"></asp:TextBox>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtSecondSPhone3" Display="Dynamic"
                    ErrorMessage="Phone No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$"
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">Fax No.</td>
            <td valign="top" >
                <asp:TextBox ID="txtSFax1" runat="server" CssClass="txtBoxPhone" Width="35px"
                    MaxLength="3"></asp:TextBox>
                &nbsp;-
                <asp:TextBox ID="txtSFax2" runat="server" CssClass="txtBoxPhone" Width="35px"
                    MaxLength="4"></asp:TextBox>
                &nbsp;-
                <asp:TextBox ID="txtSFax3" runat="server" CssClass="txtBoxPhone" Width="90px"
                    MaxLength="8"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REVSFax3" runat="server"
                    ControlToValidate="txtSFax3" Display="Dynamic"
                    ErrorMessage="Fax No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$"
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>--%>




        <tr>
            <td class="header_subtitle" colspan="2">Login Information</td>
        </tr>

        <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Email (Login Id) :</td>
            <td class="style11">
                <asp:TextBox ID="txtEmailId" runat="server" Width="300px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVEmail" runat="server"
                    ControlToValidate="txtEmailId" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server"
                    ControlToValidate="txtEmailId" ErrorMessage="EmailId Allready Exist."
                    OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="C"
                    CssClass="txt_validation" Display="Dynamic"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="REVEmail" runat="server"
                    ControlToValidate="txtEmailId" Display="Dynamic"
                    ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RegularExpressionValidator>
            </td>
        </tr>

         <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Re-type Email-Id :</td>
            <td class="style11">
                <asp:TextBox ID="txtReEmail" runat="server" Width="300px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvReEmail" runat="server"
                    ControlToValidate="txtReEmail" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>               
                <asp:RegularExpressionValidator ID="revREEmail" runat="server"
                    ControlToValidate="txtReEmail" Display="Dynamic"
                    ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RegularExpressionValidator>
            </td>
        </tr>


         <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Password :</td>
            <td class="style11">
                <asp:TextBox ID="txtPass" runat="server" Width="150px" ValidationGroup="P"
                    CssClass="txtBox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPass" runat="server"
                    ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
              
            </td>
        </tr>

         <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Re-type Password :</td>
            <td class="style11">
                <asp:TextBox ID="txtCPass" runat="server" Width="150px" ValidationGroup="P"
                    CssClass="txtBox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCPass" runat="server"
                    ControlToValidate="txtCPass" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>               
            </td>
        </tr>


        <%-- <tr >
                   <td class="style8">
                &nbsp;</td>     <td align="right" >
                            Publish</td>
                        <td  align="left" valign="top" >
                            :</td>
                        <td align="left">
                            <asp:CheckBox ID="ckpublish" runat="server" Checked="True" />
                        </td><td class="style17">
                &nbsp;</td>
                    </tr>--%>

        <tr>
            <td  colspan="2" align="left">
                <table>
                    <tr>
                        <td>Would you like to subscribe to newsletter :</td><td> <asp:RadioButtonList ID="radBtnMailing" runat="server"
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList></td>
                    </tr>
                </table>
                
                
            </td>
        </tr>



        <tr>
            <td class="style7">&nbsp;</td>
            <td class="style11">&nbsp;</td>
        </tr>



        <tr>
            <td class="style7">&nbsp;</td>
            <td class="style11">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                    ValidationGroup="C" OnClick="btnAdd_Click" />
                &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                    Text="Reset" Width="59px" OnClick="btnCancel_Click" />
            </td>
        </tr>

    </table>

             </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnAdd" />
        </Triggers>

    </asp:UpdatePanel>
</asp:Content>

