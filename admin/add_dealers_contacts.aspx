<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_dealers_contacts.aspx.cs" Inherits="admin_add_dealers_contacts" %>

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
            <td colspan="2" class="header_title">Add Dealers Contact Persons</td>
        </tr>
        <tr>
            <td align="right" class="style7">&nbsp;</td>

            <td class="txt">&nbsp;</td>
        </tr>

          <tr>
            <td align="right" class="style7"><span class="style12">*</span> Dealers :</td>
            <td class="style10">
                <asp:DropDownList ID="ddlSupliers" runat="server" CssClass="txtBox" AppendDataBoundItems="True" DataSourceID="DSSuppliers" DataTextField="CompanyName" DataValueField="id">
                    <asp:ListItem Value="0" Text="Select"></asp:ListItem>                   
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvDealers" runat="server" ControlToValidate="ddlSupliers" CssClass="validation" Display="Dynamic" InitialValue="0" ErrorMessage="Select Dealer!" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>      
      

        <tr>
            <td align="right" class="style7">
                <span class="style12">*</span>
                First Name :</td>
            <td class="style10">
                <asp:TextBox ID="txtFName" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVFname" runat="server"
                    ControlToValidate="txtFName" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td align="right" class="style7"><span class="style12">*</span> Last Name :</td>
            <td class="style10">
                <asp:TextBox ID="txtLName" runat="server" Width="200px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVLastname" runat="server" ControlToValidate="txtLName" CssClass="validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>
       
        <tr id="trBCompName" runat="server">
            <td align="right" class="style7">Designation :</td>
            <td class="style10">
                <asp:TextBox ID="txtDesignation" runat="server" Width="350px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>

          <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span>
                Mobile No. :</td>
             <td class="style10">
                <asp:TextBox ID="txtMobileCC" runat="server" CssClass="txtBox" Width="35px"
                    MaxLength="3"></asp:TextBox>
                 -
                <asp:TextBox ID="txtMobile" runat="server" CssClass="txtBox"
                    Width="90px" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVmob" runat="server"
                    ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
    
        <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Email :</td>
            <td class="style11">
                <asp:TextBox ID="txtEmailId" runat="server" Width="300px" ValidationGroup="P"
                    CssClass="txtBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVEmail" runat="server"
                    ControlToValidate="txtEmailId" Display="Dynamic" ErrorMessage="Can't left blank !"
                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="REVEmail" runat="server"
                    ControlToValidate="txtEmailId" Display="Dynamic"
                    ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
            </td>
        </tr>

         
        <tr>
            <td align="right" valign="top" class="style7">&nbsp;Phone No. :</td>
           <td class="style10">
                <asp:TextBox ID="txtPhoneCC" runat="server" CssClass="txtBox" Width="35px"
                    MaxLength="3"></asp:TextBox>
                -
                <asp:TextBox ID="txtPhoneAC" runat="server" CssClass="txtBox" Width="40px"
                    MaxLength="4"></asp:TextBox>
                -
                <asp:TextBox ID="txtPhone" runat="server" CssClass="txtBox" Width="90px"
                    MaxLength="8"></asp:TextBox>
                &nbsp;Ext. No. <asp:TextBox ID="txtExtNo" runat="server" CssClass="txtBox" Width="40px" MaxLength="4"></asp:TextBox>
            </td>
        </tr>

   

      
        <tr>
            <td class="style7">&nbsp;</td>
            <td class="style11">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                    ValidationGroup="C" OnClick="btnAdd_Click" />
                &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                    Text="Reset"  OnClick="btnCancel_Click" />
                <asp:SqlDataSource ID="DSSuppliers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Dealers_tbl] ORDER BY [CompanyName]"></asp:SqlDataSource>
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

