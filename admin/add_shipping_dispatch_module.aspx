<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_shipping_dispatch_module.aspx.cs" Inherits="admin_add_shipping_dispatch_module" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }
    
        .style12 {
            color: #FF0000;
        }

        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

            <table class="txt" style="width: 100%;" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title">Add Shipping Dispatch Module</td>
                </tr>

                <tr>
                    <td align="right" class="style7">&nbsp;</td>

                    <td class="txt">&nbsp;</td>
                </tr>


                <tr>
                    <td align="right" style="width: 200px;"><span class="style12">* </span>Customer Name :</td>
                    <td class="style10">
                        <asp:DropDownList ID="ddlCustomers" runat="server" CssClass="txtBox">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCustName" runat="server" ControlToValidate="ddlCustomers" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Customer!" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>

               

                <tr>
                    <td align="right" class="style7"><span class="style12">* </span>Order No. :</td>
                    <td class="style10">
                        <asp:DropDownList ID="ddlOrderNo" runat="server" CssClass="txtBox">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvOrdNo" runat="server" ControlToValidate="ddlOrderNo" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Order No.!" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                  <tr>
                    <td align="right" valign="top" class="auto-style1"><span class="style12">* </span>Courier Compnay :</td>
                    <td align="left" class="auto-style1">
                        <asp:DropDownList ID="ddlCourierComp" runat="server" CssClass="txtBox" DataSourceID="dsCourierComp" DataTextField="CompanyName" DataValueField="id" AppendDataBoundItems="true">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCourierComp" runat="server" ControlToValidate="ddlCourierComp" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Courier Company!" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td align="right" valign="top" class="style7"><span class="style12">* </span>Airway Bill No. :</td>
                    <td class="style11">
                        <asp:TextBox ID="txtBillNo" runat="server" Width="100px" ValidationGroup="P"
                            CssClass="txtBox" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvBill" runat="server" ControlToValidate="txtBillNo" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top" class="style7"><span class="style12">* </span>Dispatch Mode :</td>
                    <td class="style11">
                    <asp:DropDownList ID="ddlDispatchMode" runat="server" CssClass="txtBox" >
                            <asp:ListItem>Select</asp:ListItem>
                           <asp:ListItem>By Air</asp:ListItem>
                           <asp:ListItem>By Road</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDispatchMode" runat="server" ControlToValidate="ddlDispatchMode" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Dispatch Mode!" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td align="right" valign="top" class="style7"><span class="style12">* </span>Dispatch Date :</td>
                    <td class="style11">
                        <telerik:RadDatePicker ID="dispatchDate" runat="server" Skin="Silk">
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="rfvDispatchDt" runat="server" ControlToValidate="dispatchDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="C"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                 <tr>
                    <td align="right" class="style7">Estimated Delivery :</td>
                    <td class="style11">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0" Text="2-4 days" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" Text="3-6 days" ></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                
                <tr>
                    <td class="style7">&nbsp;</td>
                    <td class="style11">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                            Text="Reset" />
                        <asp:SqlDataSource ID="dsCourierComp" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [CompanyName] FROM [Courier_Company_tbl] ORDER BY [CompanyName]"></asp:SqlDataSource>
                    </td>
                </tr>

            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>

    </asp:UpdatePanel>
</asp:Content>


