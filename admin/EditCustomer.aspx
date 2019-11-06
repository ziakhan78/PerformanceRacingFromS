<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="EditCustomer.aspx.cs" Inherits="Admin_EditCustomer"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .style7
        {
            width: 130px;
            vertical-align: middle;
        }
        .style8
        {
        }
        .style9
        {
            vertical-align: middle;
        }
        .style10
        { 
            padding-left:5px;          
            text-align: left;
            vertical-align: middle;
            color: #92294A;           
            font-family: Arial, Verdana, tahoma;
            font-size: 12px;            
           
        }
        .style11
        {
             padding-left:5px;          
            text-align: left;
            vertical-align: middle;
            color: #92294A;           
            font-family: Arial, Verdana, tahoma;
            font-size: 12px;            
            width: 550px;
        }
         .style12
         {
             color: #FF0000;
         }

           .validation {
            color: #FF0000;
        }
         .auto-style1 {
             width: 130px;
             vertical-align: middle;
             height: 29px;
         }
         .auto-style2 {
             padding-left: 5px;
             text-align: left;
             vertical-align: middle;
             color: #92294A;
             font-family: Arial, Verdana, tahoma;
             font-size: 12px;
             height: 29px;
         }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="txt" style="width:100%;" align="center">
       
         
         <tr>
            <td colspan="2" class="header_title">Update Customer Information</td>             
        </tr>
        
        <tr>
            <td align="right" class="style7">
                &nbsp;</td>
            <td class="style10"><asp:Label ID="lblMsg" runat="server"></asp:Label></td>
        </tr>
        
        <tr >
            <td colspan="2" class="header_subtitle"> Billing Information</td>
        </tr>        
       
        <tr>
            <td align="right" class="style7">
                Title</td>
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
                Company Name</td>
            <td class="style10">
                <asp:TextBox ID="txtBCompanyName" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <span class="style12">* </span>First Name</td>
            <td class="style10">
                <asp:TextBox ID="txtFName" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBFname" runat="server" 
                    ControlToValidate="txtFName" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                Last Name</td>
            <td class="style10">
                <asp:TextBox ID="txtLNmae" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">* </span>Address Line 1.</td>
            <td align="left" class="style11">
                <asp:TextBox ID="txtAddress1" runat="server" Width="350px" ValidationGroup="P" 
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBFname0" runat="server" 
                    ControlToValidate="txtAddress1" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                Address Line 2.</td>
            <td align="left" class="style11">
                <asp:TextBox ID="txtAddress2" runat="server" Width="350px" ValidationGroup="P" 
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td align="right" valign="top" class="style7">
                <span class="style12">* </span>Zip / Postal Code</td>
            <td class="style11">
                <asp:TextBox ID="txtZip" runat="server" Width="100px" ValidationGroup="P" 
                    CssClass="txtBox" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBZip" runat="server" 
                    ControlToValidate="txtZip" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REVPrice2" runat="server" 
                    ControlToValidate="txtZip" Display="Dynamic" 
                    ErrorMessage="Zip Code Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>

         <tr >
            <td align="right" valign="top" class="style7">
                <span class="style12">* </span>City</td>
            <td class="style11">
                <asp:TextBox ID="txtCity" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBoxPhone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBcity" runat="server" 
                    ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
            </td>
        </tr>

         <tr >
            <td align="right" valign="top" class="style7">
                State</td>
            <td class="style11">
                <asp:DropDownList ID="DDLState" runat="server" CssClass="txtBox" Width="221px" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtBState" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>


        <tr >
            <td align="right" valign="top" class="style7">
                Country</td>
            <td class="style11">
                <asp:DropDownList ID="DDLCountry" runat="server" CssClass="txtBox" 
                    Width="221px" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtBCountry" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>
       
       
        
         <tr >
            <td align="right" valign="top" class="style7">
                <span class="style12">* </span>Mobile No.</td>
            <td class="style11">
                <asp:TextBox ID="txtMobile1" runat="server" CssClass="txtBoxPhone" Width="35px" MaxLength="3"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtMobile2" runat="server" CssClass="txtBoxPhone" Width="90px" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVBMob2" runat="server" 
                    ControlToValidate="txtMobile2" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REVPrice" runat="server" 
                    ControlToValidate="txtMobile2" Display="Dynamic" 
                    ErrorMessage="Mobile No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>        
        <tr >
            <td align="right" valign="top" class="style7">
                Phone No. </td>
            <td class="style11">
                <asp:TextBox ID="txtPhone1" runat="server" CssClass="txtBoxPhone" Width="35px" MaxLength="3"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtPhone2" runat="server" CssClass="txtBoxPhone" Width="40px" MaxLength="4"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtPhone3" runat="server" CssClass="txtBoxPhone" Width="90px" MaxLength="8"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REVPrice1" runat="server" 
                    ControlToValidate="txtPhone3" Display="Dynamic" 
                    ErrorMessage="Phone No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>
        
     <%--    <tr >
            <td align="right" valign="top" class="style7">
                Phone No. 2.&nbsp; </td>
            <td class="style11">
                <asp:TextBox ID="txtSecondPhone1" runat="server" CssClass="txtBoxPhone" 
                    Width="35px"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSecondPhone2" runat="server" CssClass="txtBoxPhone" 
                    Width="35px"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSecondPhone3" runat="server" CssClass="txtBoxPhone" 
                    Width="113px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtSecondPhone3" Display="Dynamic" 
                    ErrorMessage="Phone No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr >
            <td align="right" valign="top" class="style7">
                Fax No.</td>
            <td class="style11">
                <asp:TextBox ID="txtFax1" runat="server" CssClass="txtBoxPhone" Width="35px"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtFax2" runat="server" CssClass="txtBoxPhone" Width="35px"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtFax3" runat="server" CssClass="txtBoxPhone" 
                    Width="113px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REVPrice0" runat="server" 
                    ControlToValidate="txtFax3" Display="Dynamic" 
                    ErrorMessage="Fax No. Should be numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>--%>
       
       
        <tr >
            <td class="header_subtitle" colspan="2" >Shipping Information</td>
        </tr>
         <tr >
            <td align="right" valign="top" class="style7">
                &nbsp;</td>
            <td class="style11">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="is 'bill to' address same as above?" 
                    AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                Company Name</td>
            <td class="style10">
                <asp:TextBox ID="txtSCompanyName" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBoxPhone"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style1">
                First Name</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtSFname" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBoxPhone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVSfname" runat="server" 
                    ControlToValidate="txtSFname" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                Last Name</td>
            <td class="style10">
                <asp:TextBox ID="txtSLName" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBoxPhone"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">* </span>Address Line 1</td>
            <td class="style11">
                <asp:TextBox ID="txtSAddress1" runat="server" Width="350px" ValidationGroup="P" 
                    CssClass="txtBoxPhone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVSaddress1" runat="server" 
                    ControlToValidate="txtSAddress1" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                Address Line 2</td>
            <td class="style11">
                <asp:TextBox ID="txtSAddress2" runat="server" Width="350px" ValidationGroup="P" 
                    CssClass="txtBoxPhone"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">* </span>Zip / Postal Code</td>
            <td class="style11">
                <asp:TextBox ID="txtSZip" runat="server" Width="100px" ValidationGroup="P" 
                    CssClass="txtBoxPhone" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVSZip" runat="server" 
                    ControlToValidate="txtSZip" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REVSZip" runat="server" 
                    ControlToValidate="txtSZip" Display="Dynamic" 
                    ErrorMessage="Zip Code Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>

          <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">* </span>City</td>
            <td class="style11">
                <asp:TextBox ID="txtSCity" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBoxPhone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVscity" runat="server" 
                    ControlToValidate="txtSCity" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
            </td>
        </tr>

          <tr>
            <td align="right" valign="top" class="style7">
                State</td>
            <td class="style11">
                <asp:DropDownList ID="DDLSState" runat="server" CssClass="txtBox" Width="221px" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtSState" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>
      

        <tr>
            <td align="right" valign="top" class="style7">
                Country</td>
            <td class="style11">
                <asp:DropDownList ID="DDLSCountry" runat="server" CssClass="txtBox" 
                    Width="221px" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtSCountry" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>
      
         <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">* </span>Mobile No.</td>
            <td class="style11">
                <asp:TextBox ID="txtSMobile1" runat="server" CssClass="txtBoxPhone" Width="35px" MaxLength="3"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSMobile2" runat="server" CssClass="txtBoxPhone" Width="90px" MaxLength="10"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REVSMoble" runat="server" 
                    ControlToValidate="txtSMobile2" Display="Dynamic" 
                    ErrorMessage="Mobile No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                Phone No.</td>
            <td class="style11">
                <asp:TextBox ID="txtSPhone1" runat="server" CssClass="txtBoxPhone" Width="35px" MaxLength="3"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSPhone2" runat="server" CssClass="txtBoxPhone" Width="40px" MaxLength="4"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSPhone3" runat="server" CssClass="txtBoxPhone" Width="90px" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVSPhone3" runat="server" 
                    ControlToValidate="txtSPhone3" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REVSphone3" runat="server" 
                    ControlToValidate="txtSPhone3" Display="Dynamic" 
                    ErrorMessage="Phone No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>
       <%--  <tr>
            <td align="right" valign="top" class="style7">
                Phone No.</td>
            <td class="style11">
                <asp:TextBox ID="txtSecondSPhone1" runat="server" CssClass="txtBoxPhone" 
                    Width="35px"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSecondSPhone2" runat="server" CssClass="txtBoxPhone" 
                    Width="35px" ></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSecondSPhone3" runat="server" CssClass="txtBoxPhone" 
                    Width="113px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtSecondSPhone3" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtSecondSPhone3" Display="Dynamic" 
                    ErrorMessage="Phone No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style7">
                Fax No.</td>
            <td valign="top" class="style11">
                <asp:TextBox ID="txtSFax1" runat="server" CssClass="txtBoxPhone" Width="35px"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSFax2" runat="server" CssClass="txtBoxPhone" Width="35px"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="txtSFax3" runat="server" CssClass="txtBoxPhone" Width="113px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="REVSFax3" runat="server" 
                    ControlToValidate="txtSFax3" Display="Dynamic" 
                    ErrorMessage="Fax No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>--%>
       
               
        <tr>
            <td class="header_subtitle" colspan="2" >Login Information
                </td>
        </tr>
        
        
        <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">* </span>Email Address</td>
            <td class="style11">
                <asp:TextBox ID="txtEmailId" runat="server" Width="218px" ValidationGroup="P" 
                    CssClass="txtBoxPhone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVEmail" runat="server" 
                    ControlToValidate="txtEmailId" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REVEmail" runat="server" 
                    ControlToValidate="txtEmailId" Display="Dynamic" 
                    ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>
        
            
     <%--   
       <tr >
                   <td class="style8">
                &nbsp;</td>     <td align="right" >
                            Publish</td>
                        <td  align="left" valign="top" >
                            :</td>
                        <td align="left" >
                            <asp:CheckBox ID="ckpublish" runat="server"  />
                        </td><td class="style17">
                &nbsp;</td>
                    </tr>--%>

                      <tr>
            <td class="style7" align="right">Would you like to subscribe to newsletter</td>
            <td align="left">
                <asp:RadioButtonList ID="radBtnMailing" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        
        
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
        </tr>
        
        
        
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style11">
                <asp:Button ID="btnUpdate1" runat="server" CssClass="btn" 
                    onclick="btnUpdate1_Click" Text="Update" />
            </td>
        </tr>
       
    </table>
</asp:Content>

