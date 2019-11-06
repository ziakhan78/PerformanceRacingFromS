
<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="UpdateShip.aspx.cs" Inherits="admin_UpdateShip" Title="Korpbiz/Admin" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   
        <ContentTemplate>
        
             <table style="width: 815px" class="txt">
   
         <tr>
            <td colspan="3" class="header_title">Edit Shipping</td>             
        </tr>
        <tr>
            <td align="right" valign="top" class="style8" style="width: 260px">
                &nbsp;</td>
            <td align="center" valign="top" style="width: 2px">
                &nbsp;</td>
            <td align="right" valign="top">
                <span class="style1">*</span> Indicates mandatory fields.            
            </td>
        </tr>
                <tr align="left" valign="middle">
                    <td align="right" class="style8" style="width: 260px" valign="top">
                        &nbsp;</td>
                    <td align="center" valign="top" style="width: 2px">
                        &nbsp;</td>
                    <td align="left" valign="top">
                        <asp:Label ID="lblErrorMsg" runat="server" Font-Bold="False" ForeColor="Red" 
                            Visible="False"></asp:Label>
                        <asp:Label ID="lbl" runat="server" Font-Bold="False" ForeColor="Red" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
         <tr>
            <td align="right" valign="top">
                <span class="style1">*</span> Select Country 
            </td>
            <td align="center" valign="top" style="width: 2px">
                :</td>
            <td align="left" valign="top" style="width: 365px">
                        <asp:DropDownList ID="ddlcountry" runat="server" Width="260px" 
                            DataSourceID="dscountry" DataTextField="country_name" 
                            DataValueField="country_id" AutoPostBack="True"></asp:DropDownList>
                          
                        <br />
                        <asp:RequiredFieldValidator ID="reqCtg" runat="server" 
                            ControlToValidate="ddlcountry" Display="Dynamic" 
                            ErrorMessage="Please select Country." Font-Bold="False" InitialValue="0" 
                            ValidationGroup="registration"></asp:RequiredFieldValidator>
                          
            </td>
        </tr>
       
        <tr>
            <td align="right" valign="top">
                <span class="style1">* </span>&nbsp;Minimum Weight (Kgs) 
            </td>
            <td align="center" valign="top" style="width: 2px">
                :</td>
            <td align="left" valign="top" style="width: 365px">
                <telerik:RadNumericTextBox ID="txtminwt" Runat="server" 
                    Culture="English (United Kingdom)" MaxLength="4" MaxValue="2" MinValue="0" 
                    Skin="Office2007" Value="0" Width="125px">
                    <NumberFormat AllowRounding="False" />
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="reqminwt" runat="server" 
                    ControlToValidate="txtminwt" ErrorMessage="*" ValidationGroup="registration" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
                <tr>
            <td align="right" valign="top">
                <span class="style1">* </span>Maximum Weight (Kgs)
            </td>
            <td align="center" valign="top" style="width: 2px">
                :</td>
            <td align="left" valign="top" style="width: 365px">
                <telerik:RadNumericTextBox ID="txtmaxwt" Runat="server" 
                    Culture="English (United Kingdom)" MaxLength="4" MaxValue="5" MinValue="1" 
                    Skin="Office2007" Value="1" Width="125px" DataType="System.Int32">
                    <NumberFormat AllowRounding="False" />
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="reqmaxwt" runat="server" 
                    ControlToValidate="txtmaxwt" ErrorMessage="*" ValidationGroup="registration" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CustomValidator ID="custwt" runat="server" Display="Dynamic"
                    ControlToValidate="txtmaxwt" ValidationGroup="registration" 
                    ErrorMessage="Max weight should be greater than Min weight" Font-Bold="False" 
                    onservervalidate="custwt_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
               
                
                <tr>
                    <td align="right" valign="top">&nbsp;<span class="style1">* </span>Shipping Charges (Rs.)</td>
                    <td align="center" style="width: 2px" valign="top">
                        :</td>
                    <td align="left" style="width: 365px" valign="top">
                        <telerik:RadNumericTextBox ID="txtCharges" Runat="server" 
                            Culture="English (United Kingdom)" MaxLength="100000" MaxValue="100000" 
                            MinValue="0" Skin="Office2007" Value="0" Width="125px">
                        </telerik:RadNumericTextBox>
                        <asp:RequiredFieldValidator ID="reqcharges" runat="server" 
                            ControlToValidate="txtCharges" Display="Dynamic" ErrorMessage="*" 
                            ValidationGroup="registration"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
        <tr>
            <td align="right" valign="top"   style="width: 260px">
                &nbsp;</td>
            <td align="center" valign="top" style="width: 2px">
                &nbsp;</td>
            <td align="left" valign="top" style="width: 365px">
                <span class="ymemformfield">
                <asp:SqlDataSource ID="dscountry" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT 0 AS country_id, ' Select ' AS country_name UNION
SELECT [country_id], [country_name] FROM [Country_tbl] ORDER BY [country_name]">
                </asp:SqlDataSource>
                </span>
               
            </td>
        </tr>
        
        <tr>
            <td align="right" valign="top" class="style8" style="width: 260px">
                &nbsp;</td>
            <td align="center" valign="top" style="width: 2px">
                &nbsp;</td>
            <td align="left" valign="top" style="width: 305px">
                               
                                
                                <asp:Button ID="BtnEdit" runat="server" Text="Edit" CausesValidation="true" ValidationGroup="registration" Visible="true" onclick="BtnEdit_Click" AlternateText="Update" CssClass="btn" />
                                <asp:Button ID="BtnCancel" runat="server" Text="Cancel"  AlternateText="Cancel" CssClass="btn" />
                            </td>
        </tr>
        
    </table>
        
        </ContentTemplate>    
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnEdit" />
        </Triggers> 
   
    </asp:UpdatePanel>                               
                          
</asp:Content>

