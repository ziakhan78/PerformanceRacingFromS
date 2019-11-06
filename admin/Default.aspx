<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Performance Racing | Admin Panel</title>
    <link href="../css/adminpanel.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="top_header_bg">
            <div class="top_header"></div>
        </div>




        <div class="holder">
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSign">


                <div class="admin_sbg">

                    <div class="admin_div"></div>
                    <div class="smaller_text">Use a valid username and password to gain access</div>

                    <div action="#" id="login-form-1">
                        <div class="user_details">
                            <div style="margin: 20px 0px 0 20px;" class="style3">Username:</div>
                            <div style="margin: 5px 50px 15px 20px;">
                                <asp:TextBox ID="txtUsername" runat="server" class="txtBox"></asp:TextBox>
                            </div>
                            <div style="margin: 10px 0px 0 20px;" class="style3">Password:</div>
                            <div style="margin: 5px 50px 5px 20px;">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="txtBox"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="button_div">
                        <div>
                            <asp:LinkButton ID="btnSign" runat="server" CssClass="btn_red" ValidationGroup="L" OnClick="btnSign_Click">Login<img src="../admin_icons/arrow.png" alt="" style="vertical-align: middle" /></asp:LinkButton>
                            <%--<a href="#" class="btn_red">Login
                        <img src="../admin_icons/arrow.png" alt="" style="vertical-align: middle" /></a>--%>                        
                         &nbsp;<a href="PasswordRecovery.aspx"><strong>Forgot your password?</strong></a>
                        </div>
                        <div>
                            <br />
                            <br />
                            <strong>
                                <asp:CheckBox ID="ckremember" runat="server" Text="Remember Login" />
                            </strong>
                        </div>
                    </div>

                </div>

            </asp:Panel>
        </div>

        <footer style="margin-top: 50px;">
            <div align="center" style="border-top: 1px solid #aeaeae; padding-top: 10px;">Copyright &copy; 2015 Performance Racing | All Rights Reserved | Site Designed & Maintained By <a href="http://www.goradiainfotech.com/" target="_blank">Goradia Infotech</a></div>
        </footer>

    </form>
</body>
</html>
