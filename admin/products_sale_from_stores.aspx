<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="products_sale_from_stores.aspx.cs" Inherits="admin_products_sale_from_stores" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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
            <td colspan="2" class="header_title">Products Sale From Store</td>
        </tr>
        <tr>
            <td align="right" class="style7">&nbsp;</td>

            <td class="txt">&nbsp;</td>
        </tr>

          <tr>
            <td align="right" class="style7"><span class="style12">*</span> Customer :</td>
            <td class="style10">
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </td>
        </tr>      
       <tr>
            <td align="right" class="style7">
                <span class="style12">*</span>
                Invoice No. :</td>
            <td class="style10">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td align="right" class="style7">
                <span class="style12">*</span>
                Invoice Date :</td>
            <td class="style10">
                <telerik:RadDateInput ID="RadDateInput1" Runat="server">
                </telerik:RadDateInput>
            </td>
        </tr>




        <tr>
            <td align="right" class="style7"><span class="style12">*</span> Category :</td>
            <td class="style10">
              <asp:DropDownList ID="ddlCat" runat="server"  AppendDataBoundItems="true"  CssClass="txtBox">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        
            </td>
        </tr>      

        <tr>
            <td align="right" class="style7"><span class="style12">*</span> Sub-Category :</td>
            <td class="style10">
               <asp:DropDownList ID="ddlSubcategory" runat="server" CssClass="txtBox" >
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVsubcat" runat="server" ControlToValidate="ddlSubcategory" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                     
            </td>
        </tr>      

        <tr>
            <td align="right" class="style7"><span class="style12">*</span> Products :</td>
            <td class="style10">
                <asp:DropDownList ID="DropDownList4" runat="server">
                </asp:DropDownList>
            </td>
        </tr>      



        <tr>
            <td align="right" class="style7"><span class="style12">*</span> Invoice Amount :</td>
            <td class="style10">
                <telerik:RadNumericTextBox ID="RadNumericTextBox1" Runat="server">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
       
        <tr>
            <td align="right" class="style7">Payment Mode :</td>
            <td class="style10">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Cheque</asp:ListItem>
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>Card</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>

         <tr >
            <td align="right" class="style7">Card Type :</td>
            <td class="style10">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Debit</asp:ListItem>
                    <asp:ListItem>Credit</asp:ListItem>
                   
                </asp:RadioButtonList>
            </td>
        </tr>

          <tr>
            <td align="right" valign="top" class="style7">
                <span class="style12">*</span>
                Amount Received :</td>
             <td class="style10">
                 <telerik:RadNumericTextBox ID="RadNumericTextBox2" Runat="server">
                 </telerik:RadNumericTextBox>
            </td>
        </tr>
    
        <tr>
            <td class="style7" align="right" valign="top">
                <span class="style12">*</span>
                Balance Amount :</td>
            <td class="style11">
                <asp:Label ID="lblBalAmt" runat="server" ></asp:Label>
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

