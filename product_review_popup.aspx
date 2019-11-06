<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product_review_popup.aspx.cs" Inherits="product_review_popup" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mu Big Chair - Product Reviews</title>
    <link href="css/popup.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <img src="../admin_icons/header_admin_popup.gif" alt="" />
        </div>
        <div id="product_review" runat="server" style="padding-left: 20px; margin-top: 15px; width: 650px;">
            <div style="margin: 10px 0 10px 0;">
                <span style="font-weight: bold;">Product Review</span>
            </div>
            <div>
                <telerik:RadRating ID="RadRating1" runat="server" DbValue="0">
                    <Items>
                        <telerik:RadRatingItem Value="1" ToolTip="Bad"></telerik:RadRatingItem>
                        <telerik:RadRatingItem Value="2" ToolTip="Poor"></telerik:RadRatingItem>
                        <telerik:RadRatingItem Value="3" ToolTip="Regular"></telerik:RadRatingItem>
                        <telerik:RadRatingItem Value="4" ToolTip="Good"></telerik:RadRatingItem>
                        <telerik:RadRatingItem Value="5" ToolTip="Gorgeues"></telerik:RadRatingItem>
                    </Items>
                </telerik:RadRating>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please enter a star rating for this review!"
                    ControlToValidate="RadRating1" OnServerValidate="CustomValidator1_ServerValidate" CssClass="txt_validation" Display="Dynamic" ValidationGroup="rating" >
                </asp:CustomValidator>
               <%-- <asp:RequiredFieldValidator ID="rfvRating" runat="server" ControlToValidate="RadRating1" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please enter a star rating for this review!" ValidationGroup="rating"></asp:RequiredFieldValidator>--%>
            </div>
            <div style="margin: 15px 0 15px 0;">
                <telerik:RadTextBox ID="txtTitle" runat="server" EmptyMessage="Enter Review Title" Resize="None" Width="615px" Height="25px" CssClass="txtBox" Skin="Silk"></telerik:RadTextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvReviewTitle" runat="server" ControlToValidate="txtTitle" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="rating"></asp:RequiredFieldValidator>
            </div>
            <div>
                <telerik:RadTextBox ID="txtDesc" runat="server" EmptyMessage="Enter Review" Height="80px" Resize="None" TextMode="MultiLine" Width="615px" CssClass="txtBox" Skin="Silk"></telerik:RadTextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvReviewDesc" runat="server" ControlToValidate="txtDesc" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="rating"></asp:RequiredFieldValidator>
            </div>
           <%-- <div style="margin: 15px 0 15px 0;">
                <telerik:RadTextBox ID="txtLocation" runat="server" EmptyMessage="Enter Location" Resize="None" Width="615px" Height="25px" CssClass="txtBox" Skin="Silk"></telerik:RadTextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="rating"></asp:RequiredFieldValidator>
            </div>--%>
            <div style="margin: 15px 0 15px 0;">
                <asp:Button ID="btnPost" runat="server" Text="Post Review" CssClass="btn btn-danger" ValidationGroup="rating" OnClick="btnPost_Click" />
            </div>

            <div id="ratingMsg" runat="server" style="height: 30px; background-color: #f6f1d6;">
                <span style="background-color: #f6f1d6; font-weight: bold; margin-top: 10px;">
                    <asp:Label ID="lblMsg" runat="server" Text="Your review was sent successfully and is now waiting for our admin to publish it."></asp:Label>
                </span>
            </div>
        </div>
    </form>
</body>
</html>
