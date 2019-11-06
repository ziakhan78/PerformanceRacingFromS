<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_shipping_agent.aspx.cs" Inherits="admin_add_shipping_agent" %>

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

        .validation {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>


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
                    <td align="right" valign="top" class="style7">
                        Pin :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtZip" runat="server" Width="100px" ValidationGroup="P"
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
                    <td align="right" valign="top" class="style7">State :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtState" runat="server" Width="200px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>
                    </td>
                </tr>


          
                <tr>
                    <td align="right" valign="top" class="style7"><span class="style12">* </span>Phone No.-1 :</td>
                    <td class="style10">
                        <asp:TextBox ID="txtPhCC1" runat="server" CssClass="txtBox" Width="35px"
                            MaxLength="3"></asp:TextBox>
                        -
                <asp:TextBox ID="txtPhAC1" runat="server" CssClass="txtBox" Width="40px"
                    MaxLength="4"></asp:TextBox>
                        -
                <asp:TextBox ID="txtPhone1" runat="server" CssClass="txtBox" Width="90px"
                    MaxLength="8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVPh1" runat="server" ControlToValidate="txtPhone1" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="C"></asp:RequiredFieldValidator>
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
                <asp:TextBox ID="txtPhone2" runat="server" CssClass="txtBox" Width="90px"
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
                        <asp:TextBox ID="txtFax1" runat="server" CssClass="txtBox" MaxLength="8" Width="90px"></asp:TextBox>
                    </td>
                </tr>

                              

             
              

              

                    <tr>
                    <td align="right" valign="top" class="auto-style1">Website :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtWebsite" runat="server" Width="350px" ValidationGroup="P"
                            CssClass="txtBox"></asp:TextBox>

                    </td>
                </tr>

                
                    <tr>
                    <td align="right" valign="top" >Shipping to :</td>
                    <td class="style11" valign="top">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="state_name" DataValueField="state_name" RepeatColumns="6" RepeatDirection="Horizontal">
                        
                        </asp:CheckBoxList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT distinct [state_name] FROM [StateCityPincode_tbl] group by [state_name] ORDER BY [state_name]"></asp:SqlDataSource>

                    </td>
                </tr>













                <%-- <tr>
            <td class="header_subtitle" colspan="2">Login Information</td>
        </tr>

        <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Email (Login Id) :</td>
            <td class="style11">
                <asp:TextBox ID="txtEmailId" runat="server" Width="300px" ValidationGroup="P"
                    CssClass="txtBoxPhone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVEmail" runat="server"
                    ControlToValidate="txtEmailId" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server"
                    ControlToValidate="txtEmailId" ErrorMessage="EmailId Allready Exist."
                    OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="C"
                    CssClass="validation" Display="Dynamic"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="REVEmail" runat="server"
                    ControlToValidate="txtEmailId" Display="Dynamic"
                    ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>

         <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Re-type Email-Id :</td>
            <td class="style11">
                <asp:TextBox ID="txtReEmail" runat="server" Width="300px" ValidationGroup="P"
                    CssClass="txtBoxPhone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvReEmail" runat="server"
                    ControlToValidate="txtReEmail" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>               
                <asp:RegularExpressionValidator ID="revREEmail" runat="server"
                    ControlToValidate="txtReEmail" Display="Dynamic"
                    ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>


         <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Password :</td>
            <td class="style11">
                <asp:TextBox ID="txtPass" runat="server" Width="150px" ValidationGroup="P"
                    CssClass="txtBoxPhone" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPass" runat="server"
                    ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
              
            </td>
        </tr>

         <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Re-type Password :</td>
            <td class="style11">
                <asp:TextBox ID="txtCPass" runat="server" Width="150px" ValidationGroup="P"
                    CssClass="txtBoxPhone" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCPass" runat="server"
                    ControlToValidate="txtCPass" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>               
            </td>
        </tr>--%>







                <tr>
                    <td class="style7">&nbsp;</td>
                    <td class="style11">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" OnClick="btnAdd_Click" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                            Text="Reset" OnClick="btnCancel_Click" />
                    </td>
                </tr>

            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger  ControlID="btnAdd"   />
        </Triggers>

    </asp:UpdatePanel>
</asp:Content>

