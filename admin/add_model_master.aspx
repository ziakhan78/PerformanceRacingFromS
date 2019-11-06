<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_model_master.aspx.cs" Inherits="Admin_add_model_master" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

             <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">
                        <asp:Label ID="lblHeading" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>



                <tr>
                    <td align="right" valign="top" style="text-align: right; vertical-align: top;"
                        class="style2"><span class="auto-style1">*</span>Manufacturer : </td>

                    <td>
                       <asp:DropDownList ID="DDLManufacturer" runat="server" CssClass="txtBox" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="manufacturer_name" DataValueField="id">
                            <asp:ListItem Value="Select" Text="Select"></asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvManufacturer" runat="server" ControlToValidate="DDLManufacturer" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Manufacturer!" InitialValue="Select" ValidationGroup="O"></asp:RequiredFieldValidator>

                    </td>

                </tr>


                <tr>
                    <td align="right" valign="top" style="text-align: right; vertical-align: top;"
                        class="style2"><span class="auto-style1">*</span>Model : </td>

                    <td>
                        <telerik:RadTextBox ID="txtModel" runat="server" Width="400px" CssClass="txtBox" Skin="Silk">
                        </telerik:RadTextBox>
                         <asp:RequiredFieldValidator ID="RFVModel" runat="server" ControlToValidate="txtModel" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="O"></asp:RequiredFieldValidator>
               

                    </td>
                </tr>

            <tr>
                    <td align="right" style="text-align: right; "
                        class="style2"><span class="auto-style1">*</span>Year : </td>

                    <td><asp:DropDownList ID="DDLYearsFrom" runat="server" AutoPostBack="True" CssClass="txtBox" AppendDataBoundItems="true">
                            <asp:ListItem Value="From" Text="From"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvYearFrom" runat="server" ControlToValidate="DDLYearsFrom" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select From Year!" InitialValue="From" ValidationGroup="O"></asp:RequiredFieldValidator>

                        &nbsp;-&nbsp;
                         <asp:DropDownList ID="DDLYearsTo" runat="server" AutoPostBack="True" CssClass="txtBox" AppendDataBoundItems="true">
                            <asp:ListItem Value="To" Text="To"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvYearTo" runat="server" ControlToValidate="DDLYearsTo" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select To Year!" InitialValue="To" ValidationGroup="O"></asp:RequiredFieldValidator>


                    </td>

                </tr>







                <tr>
                    <td class="style2"></td>

                    <td align="left">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn"
                            OnClick="btnSubmit_Click" ValidationGroup="O" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn"
                            CausesValidation="False" OnClick="btnCancel_Click" />

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [manufacturer_name] FROM [manufacturer_master_tbl] ORDER BY [manufacturer_name]"></asp:SqlDataSource>

                    </td>
                </tr>

            </table>
                 </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

