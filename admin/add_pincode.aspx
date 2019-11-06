<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_pincode.aspx.cs" Inherits="Admin_add_pincode" %>

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

        .auto-style2 {
            width: 130px;
            text-align: left;
        }

        .auto-style3 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">Add Pincode</td>
                </tr>

                <tr>
                    <td valign="top" class="auto-style3">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

                <tr>
                    <td class="auto-style3">Select State :</td>
                    <td align="left">
                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="txtBox" DataSourceID="dsState" DataTextField="state_name" DataValueField="state_name" AutoPostBack="True">
                            <asp:ListItem Text="Select" Value="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3">Select City :</td>
                    <td align="left">
                        <asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" CssClass="txtBox" DataSourceID="dsCity" DataTextField="city_name" DataValueField="city_name" AutoPostBack="True">
                            <asp:ListItem Text="Select" Value="Select">Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3" valign="top">Select Pincode :</td>
                    <td align="left">                       
                        <asp:CheckBoxList ID="chkMaterials" runat="server" CssClass="txt" RepeatDirection="Horizontal" DataSourceID="dsPincode" DataTextField="pincode" DataValueField="id" RepeatColumns="10">
                        </asp:CheckBoxList>
                    </td>
                </tr>

                <%--   <tr>
            <td class="auto-style3" ><span class="auto-style1">*</span>Add Pincode : </td>
           
            <td >
                <telerik:RadTextBox ID="txtColor" Runat="server" width="250px" CssClass="txtBox" Skin="Silk">
                </telerik:RadTextBox>
                
                
                
                
                <asp:RequiredFieldValidator ID="RFVColor" runat="server" 
                    ControlToValidate="txtColor" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CVColor" runat="server" 
                    ControlToValidate="txtColor" CssClass="txt_validation" Display="Dynamic" 
                    ErrorMessage="* Already Exists." 
                    onservervalidate="CVColor_ServerValidate" ValidationGroup="O"></asp:CustomValidator>
            </td>
           
        </tr>--%>

                <tr>
                    <td class="auto-style2"></td>

                    <td align="left">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClick="btnSubmit_Click" ValidationGroup="O" />&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn" CausesValidation="False" OnClick="btnCancel_Click" />
                        <asp:SqlDataSource ID="dsState" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT distinct [state_name] FROM [StateCityPinCode_tbl] ORDER BY [state_name]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsCity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT distinct [city_name] FROM [StateCityPinCode_tbl] WHERE ([state_name] = @state_name)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlState" Name="state_name" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsPincode" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [StateCityPinCode_tbl] WHERE ([city_name] = @city_name) ORDER BY [pincode]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCity" Name="city_name" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>

            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

