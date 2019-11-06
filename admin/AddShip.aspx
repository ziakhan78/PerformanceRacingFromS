<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="AddShip.aspx.cs" Inherits="admin_AddShip" Title="" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style1 {
            color: #FF0000;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
   
        <ContentTemplate>--%>

    <table class="txt" style="width: 100%;" align="center" cellpadding="3" cellspacing="5">
        <tr>
            <td colspan="2" class="header_title">Add Shipping Charges</td>
        </tr>
        <tr>
            <td align="right"></td>
            <td align="right">
                <span class="style1">*</span> Indicates mandatory fields.
            </td>
        </tr>


        <tr>
            <td align="right" width="170px">
                <span class="style1">*</span> Select State :</td>
            <td align="left">
                <asp:DropDownList ID="DDLState" runat="server" DataSourceID="dsStates"
                    DataTextField="state_name" DataValueField="state_id" CssClass="txtBox">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsStates" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [State_tbl] where country_id=99 ORDER BY [state_name]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="right">Location :</td>
            <td align="left">
                <asp:TextBox ID="txtLocation" runat="server" Width="300px" CssClass="txtBox"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td align="right">Pin Code :</td>
            <td align="left">
                <asp:TextBox ID="txtPin" runat="server" Width="150px" CssClass="txtBox" MaxLength="6"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td align="right">
                <span class="style1">*</span> Minimum Weight (Kgs.) 
                : 
            </td>
            <td align="left">
                <telerik:RadNumericTextBox ID="txtminwt" runat="server"
                    Culture="English (United Kingdom)" MaxLength="5"
                    Skin="Silk" Width="100px" CssClass="txtBox">
                    <NegativeStyle Resize="None"></NegativeStyle>

                    <NumberFormat />

                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                    <FocusedStyle Resize="None"></FocusedStyle>

                    <DisabledStyle Resize="None"></DisabledStyle>

                    <InvalidStyle Resize="None"></InvalidStyle>

                    <HoveredStyle Resize="None"></HoveredStyle>

                    <EnabledStyle Resize="None"></EnabledStyle>
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="reqminwt" runat="server"
                    ControlToValidate="txtminwt" ErrorMessage="Can't be left blank !" ValidationGroup="registration"
                    Display="Dynamic" CssClass="txt_validation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <span class="style1">* </span>Maximum Weight (Kgs.)
                :
            </td>
            <td align="left">
                <telerik:RadNumericTextBox ID="txtmaxwt" runat="server"
                    Culture="English (United Kingdom)" MaxLength="6"
                    Skin="Silk" Width="100px" DataType="System.Int32" CssClass="txtBox">
                    <NegativeStyle Resize="None"></NegativeStyle>

                    <NumberFormat />

                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                    <FocusedStyle Resize="None"></FocusedStyle>

                    <DisabledStyle Resize="None"></DisabledStyle>

                    <InvalidStyle Resize="None"></InvalidStyle>

                    <HoveredStyle Resize="None"></HoveredStyle>

                    <EnabledStyle Resize="None"></EnabledStyle>
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="reqmaxwt" runat="server"
                    ControlToValidate="txtmaxwt" ErrorMessage="Can't be left blank !" ValidationGroup="registration"
                    Display="Dynamic" CssClass="txt_validation"></asp:RequiredFieldValidator>
                <br />
                <asp:CustomValidator ID="custwt" runat="server" Display="Dynamic"
                    ControlToValidate="txtmaxwt" ValidationGroup="registration"
                    ErrorMessage="Max weight should be greater than Min weight" Font-Bold="False"
                    OnServerValidate="custwt_ServerValidate" CssClass="txt_validation"></asp:CustomValidator>
            </td>
        </tr>


        <tr>
            <td align="right">
                <span class="style1">&nbsp;*</span> Shipping Charges (<b><img
                    src="../Admin_Icons/rupee.gif" /></b>) :</td>
            <td align="left">
                <telerik:RadNumericTextBox ID="txtCharges" runat="server" Skin="Silk" Width="100px" CssClass="txtBox" MaxLength="5">
                    <NegativeStyle Resize="None"></NegativeStyle>

                    <NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>

                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                    <FocusedStyle Resize="None"></FocusedStyle>

                    <DisabledStyle Resize="None"></DisabledStyle>

                    <InvalidStyle Resize="None"></InvalidStyle>

                    <HoveredStyle Resize="None"></HoveredStyle>

                    <EnabledStyle Resize="None"></EnabledStyle>
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="reqcharges" runat="server"
                    ControlToValidate="txtCharges" Display="Dynamic" ErrorMessage="Can't be left blank !"
                    ValidationGroup="registration" CssClass="txt_validation"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right">&nbsp;</td>
            <td align="left">&nbsp;</td>
        </tr>
        <tr>
            <td align="right">&nbsp;</td>
            <td align="left">
                <asp:Button ID="BtnAdd" runat="server" CssClass="btn" OnClick="BtnAdd_Click1"
                    Text="Submit" ValidationGroup="registration" />
                <asp:Button ID="btnCancel" runat="server" CssClass="btn"
                    OnClick="btnCancel_Click" Text="Cancel" ValidationGroup="registration" />
            </td>
        </tr>



    </table>

    <%--     </ContentTemplate>    
       
   
    </asp:UpdatePanel> --%>
</asp:Content>
