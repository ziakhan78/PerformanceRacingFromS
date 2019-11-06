<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_courier_company.aspx.cs" Inherits="admin_add_courier_company" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


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
                    <td colspan="2" class="header_title">Add Shipping Agent</td>
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
                    <td align="right" valign="top" class="auto-style1">Website Url :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtWebsite" runat="server" Width="350px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>

                    </td>
                </tr>


                
                    <tr>
                    <td align="right" valign="top" class="auto-style1">Email-Id :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtEmailId" runat="server" Width="350px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>

                    </td>
                </tr>

                  <tr>
                    <td align="right" valign="top" >Ship To :</td>
                    <td class="style11">
                       <asp:CheckBoxList ID="chkShipTo" runat="server" DataSourceID="ds_states" DataTextField="state_name" DataValueField="state_name" RepeatColumns="6" RepeatDirection="Horizontal">
                        
                        </asp:CheckBoxList>

                    </td>
                </tr>

                

                <tr>
                    <td class="style7">&nbsp;</td>
                    <td class="style11">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" OnClick="btnAdd_Click" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                            Text="Reset" OnClick="btnCancel_Click" />
                        
                        <asp:SqlDataSource ID="ds_states" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [View_IndianStates]"></asp:SqlDataSource>
               
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

