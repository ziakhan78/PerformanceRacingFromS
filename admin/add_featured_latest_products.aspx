<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_featured_latest_products.aspx.cs" Inherits="Admin_add_featured_latest_products" %>

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
                        <td class="header_title" align="center">
                            <asp:Label ID="lblHeading" runat="server"></asp:Label></td>
                    </tr>

                    <tr>                       

                        <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                    </tr>



                    <tr>
                       <td class="style2"><span class="auto-style1">*</span>Select Featured Products : </td>

                     
                    </tr>

                     <tr>
                       

                        <td>
                             <asp:CheckBoxList ID="chkProducts" runat="server" DataSourceID="dsProducts" DataTextField="sku" DataValueField="pid" RepeatDirection="Horizontal" RepeatColumns="8"></asp:CheckBoxList>
                        </td>

                    </tr>


                    <tr>
                        <td class="style2"><span class="auto-style1">*</span>Select Latest Products : </td>
                       

                    </tr>

                       <tr>
                       

                        <td >
                            <asp:CheckBoxList ID="chkLatest" runat="server" DataSourceID="dsProducts" DataTextField="sku" DataValueField="pid" RepeatDirection="Horizontal" RepeatColumns="8"></asp:CheckBoxList>
                        </td>

                    </tr>





                    <tr>
                       

                        <td align="left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn"
                                OnClick="btnSubmit_Click" ValidationGroup="O" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn"
                                CausesValidation="False" OnClick="btnCancel_Click" />

                            <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [pid], [sku] FROM [Products_tbl] ORDER BY [sku]"></asp:SqlDataSource>

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

