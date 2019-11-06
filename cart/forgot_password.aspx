<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="forgot_password.aspx.cs" Inherits="forgot_password" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/programmer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <div class="box-heading">
                <h1>Forgot Password</h1>
            </div>
        </div>
    </div>


 <div class="container">
        <div class="row">

    

            <div class="text_paragraph" style="margin:20px;" >
                <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSend" Height="200px">
                    Just enter the email id you registered with below. 
                    <br />
                    We will immediately send you a password reset request, using the e-mail address in your profile.

                    <br />
                    <br />
                    Email Id:  
                        <asp:TextBox ID="txtEmail" runat="server" Width="250px" CssClass="txtBox" Height="25px"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please Enter Email-Id" ValidationGroup="FP"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid Email-Id" ValidationGroup="FP" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                    <asp:CustomValidator ID="CVEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Your Email-Id is not registered." OnServerValidate="CVEmail_ServerValidate" ValidationGroup="FP"></asp:CustomValidator>

                    <br />
                    <br />
                    <span style="margin-left: 60px">
                        <asp:LinkButton ID="btnSend" runat="server" Text="Send" CssClass="btn btn-danger" ValidationGroup="FP" OnClick="btnSend_Click" />                       
                    </span>
                    <br />
                    <br />
                    
                    Still having trouble? Contact us at <a href="mailto:support@performanceracingstore.in">support@performanceracingstore.in.</a>
                    <p>&nbsp;</p>
                    <br />
                </asp:Panel>

                <asp:Panel ID="Panel2" runat="server" Height="200px" >
                    A password reset link was sent to your registered Email-Id.<br />
                    Please follow the instructions given in the mail.
                         <p>&nbsp;</p>
                    <br />
                </asp:Panel>
            </div>

            <div class="clearfix"></div>
       

            </div>

    </div>
</asp:Content>

