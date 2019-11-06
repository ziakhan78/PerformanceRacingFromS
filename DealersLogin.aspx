<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="DealersLogin.aspx.cs" Inherits="DealersLogin" %>

<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <link href="css/dealers_login.css" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--banner-starts-->
    <div class="bnr" id="home">
        <div id="top" class="callbacks_container">

            <uc1:uc_inner_banner runat="server" ID="uc_inner_banner" />


        </div>
        <div class="clearfix"></div>
        <div class="shabo-strip"></div>
    </div>
    <!--banner-ends-->
    <!--Slider-Starts-Here-->
    <script src="js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 4
            $("#slider4").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 2500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });

        });
    </script>
    <!--End-slider-script-->

    <div class="clearfix"></div>
    <div class="shabo-strip"></div>

    <!--breadcrumb-->

    <div class="bs-example">
        <div class="container">
            <div class="row">

                <div class="main_heading_div">
                    <h2>Dealers Login</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active">Dealers Login</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row" >
            <div class="admin_sbg" style="margin-bottom:100px;">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSign">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                <div class="user_ico">
                    <img src="images/user_icon.png" width="75" height="64" alt="" /></div>


                <div class="user_details">


                    <div class="admin_div">
                        <div class="login_heading">Dealers Login</div>
                    </div>



                    <div action="#" id="login-form-1">
                        <div style="margin: 14px 0px 0 20px;" class="style3">Username/Email-Id:</div>
                        <div style="margin: 5px 12px 15px 20px;">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="txtBox"></asp:TextBox></div>
                        <div style="margin: 10px 0px 0 20px;" class="style3">Password:</div>
                        <div style="margin: 5px 12px 5px 20px;">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txtBox"></asp:TextBox></div>

                        <div style="margin: 5px 12px 5px 20px;"><asp:CheckBox ID="ckremember" runat="server" Text="Remember Login " ForeColor="White" />
                        </div>


                    </div>
                </div>




                <div class="smaller_text">
                    DO NOT check this on public systems
                    <br>
                    (e.g. libraries, internet cafes)
                </div>

                <div class="clearfix"></div>
                <div class="button_div">
                    <div>
                        
                        <asp:LinkButton ID="btnSign" runat="server" ValidationGroup="L" OnClick="btnSign_Click" CssClass="btn_red"><img src="images/logi_arrow.png" alt="" style="vertical-align: middle" />
                            Login</asp:LinkButton>
                     &nbsp; &nbsp; &nbsp; &nbsp;
                        <a href="forgot_password.aspx" class="red_tap">Forgot your password?</a><img src="images/logi_spacer.gif" width="120" height="21" alt="" />

                       
                                        <asp:RequiredFieldValidator ID="RFVMem" runat="server" ControlToValidate="txtMemNo" CssClass="txt_validation" Display="None" ErrorMessage="Please Enter Your Membership No." ValidationGroup="L"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="txtUsername" CssClass="txt_validation" Display="None" ErrorMessage="Please Enter Your Email-Id" ValidationGroup="L"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="REV" runat="server"
                                            ControlToValidate="txtUsername" CssClass="txt_validation" Display="None"
                                            ErrorMessage="Invalid Email-Id"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="L"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RFVPass" runat="server"
                                            ControlToValidate="txtPassword" CssClass="txt_validation" Display="None"
                                            ErrorMessage="Please Enter Your Password" ValidationGroup="L"></asp:RequiredFieldValidator>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                                            CssClass="txt_validation" ShowMessageBox="True" ShowSummary="False"
                                            ValidationGroup="L" />

                    </div>



                </div>

                              </ContentTemplate>
                    </asp:UpdatePanel>

                </asp:Panel>
              
            </div>

            <%--<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSign">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                           
                            <div class="admin_sbg">

                                <div class="user_details">
                                    <form action="#" id="login-form-1">
                                        <div style="margin: 14px 0px 0 20px;" class="style3">
                                           Username/Email-Id:
                                        </div>

                                        <div style="margin: 5px 12px 15px 20px;">
                                            <asp:TextBox ID="txtUsername" runat="server" CssClass="txtBox"></asp:TextBox>                                            
                                        </div>

                                        <div style="margin: 10px 0px 0 20px;" class="style3">Password:</div>
                                        <div style="margin: 5px 12px 5px 20px;">
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txtBox"></asp:TextBox>
                                        </div>

                                        <div style="margin: 5px 12px 5px 20px;">
                                            <asp:CheckBox ID="ckremember" runat="server" Text="Remember Login " />
                                        </div>

                                    </form>
                                </div>




                                <div class="smaller_text">DO NOT check this on public systems (e.g., libraries, internet cafes)</div>
                                <div class="button_div">
                                    <div>

                                        <asp:Label ID="LblInvalid" runat="server" CssClass="txt_validation"
                                            ForeColor="Red"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RFVMem" runat="server" ControlToValidate="txtMemNo" CssClass="txt_validation" Display="None" ErrorMessage="Please Enter Your Membership No." ValidationGroup="L"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="txtUsername" CssClass="txt_validation" Display="None" ErrorMessage="Please Enter Your Email-Id" ValidationGroup="L"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="REV" runat="server"
                                            ControlToValidate="txtUsername" CssClass="txt_validation" Display="None"
                                            ErrorMessage="Invalid Email-Id"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="L"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RFVPass" runat="server"
                                            ControlToValidate="txtPassword" CssClass="txt_validation" Display="None"
                                            ErrorMessage="Please Enter Your Password" ValidationGroup="L"></asp:RequiredFieldValidator>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                                            CssClass="txt_validation" ShowMessageBox="True" ShowSummary="False"
                                            ValidationGroup="L" />

                                        <a href="forgot_password.aspx" class="red_tap">Forgot your password?</a><br />

                                        <asp:LinkButton ID="btnSign" runat="server" ValidationGroup="L" OnClick="btnSign_Click" CssClass="btn btn-danger">Login</asp:LinkButton>


                                    </div>



                                </div>

                            </div>

                            <br />
                            <br />
                            <br />



                        </ContentTemplate>
                    </asp:UpdatePanel>

                </asp:Panel>--%>
        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>

