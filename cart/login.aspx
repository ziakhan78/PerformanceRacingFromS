<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="cart_login" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/programmer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- 
        <div class="container">
<br>
    <section class="">
    <ul class="breadcrumb bcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Living Room </a></li>
    <li class="active">Sao Paulo Six Seater Dining Table Set</li>
</ul>
    
    </section>
    </div>
    --%>



    <div class="container">


        <div class="registration">
            <div class="col-lg-6 col-md-6 col-sm-12">


                <div class="registration_left">
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnCreateAccount">
                        <h2>Create An account</h2>
                         <div class="registration_form">
                            <div>
                                <label>

                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="txtBox" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFname" runat="server"
                                        ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Can't be left blank"
                                        ValidationGroup="ca" CssClass="txt_validation"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="revFName" runat="server"
                                        ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Only alphabets are allowed" ValidationGroup="ca" CssClass="txt_validation" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                                </label>
                            </div>
                            <div>
                                <label>
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="txtBox" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLname" runat="server"
                                        ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Can't be left blank"
                                        ValidationGroup="ca" CssClass="txt_validation"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="revLName" runat="server" Display="Dynamic"
                                        ControlToValidate="txtLastName" ErrorMessage="Only alphabets are allowed" ValidationGroup="ca" CssClass="txt_validation" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                                </label>
                            </div>

                            <div>
                                <label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="txtBox" Height="30" placeholder="Email Id"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfemail" runat="server"
                                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Can't be left blank"
                                        ValidationGroup="ca" CssClass="txt_validation" Width="60%"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="revemail0" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                                        ErrorMessage="Invalid email id"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="ca" CssClass="txt_validation"></asp:RegularExpressionValidator>
                                    <asp:CustomValidator
                                        ID="cvemail" runat="server"
                                        ControlToValidate="txtEmail" Display="Dynamic"
                                        ErrorMessage="Emai id allready exists "
                                        OnServerValidate="cvemail_ServerValidate" ValidationGroup="ca" CssClass="txt_validation"></asp:CustomValidator>
                                </label>
                            </div>

                            <div>
                                <label>
                                    <asp:TextBox ID="txtMobileCc" runat="server" Width="45px" placeholder="+91"
                                        MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                    <telerik:RadNumericTextBox ID="txtMobile" runat="server" MaxLength="10" Width="110px" CssClass="txtBox" Skin="Silk" placeholder="0123456789">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                                        ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Can't be left blank"
                                        ValidationGroup="ca" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REVMobile" runat="server"
                                        ControlToValidate="txtMobile" Display="Dynamic"
                                        ErrorMessage="Mobile No. Should Be Numeric." ValidationExpression="^[-+]?\d*\.?\d*$"
                                        ValidationGroup="ca" CssClass="txt_validation"></asp:RegularExpressionValidator>
                                </label>

                            </div>

                        </div>
                        <div class="sky-form" style="padding-left:0px;">

                            <div class="reation_frm">
                                <label class="checkbox">
                                    <asp:CheckBox ID="chkPP" runat="server" Text="Sign up for offers" Checked="True" /><a href="../privacy_policy.aspx" class="terms"> View Privacy Policy</a></label>
                            </div>

                            <label class="checkbox">
                                <asp:CheckBox ID="chkTC" runat="server" Text="I accept" Checked="True" /><a href="../terms_conditions.aspx" class="terms"> Terms & Conditions</a></label>
                        </div>

                        <div>
                            <asp:Label ID="lblmsg" runat="server" Text="Terms & Conditions must be read and checked before the user registration ! " CssClass="txt_validation"></asp:Label><br />
                            <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" CssClass="addtowish" ValidationGroup="ca" OnClick="btnCreateAccount_Click" />
                        </div>

                    </asp:Panel>

                </div>


            </div>


            <div class="col-lg-6 col-md-6 col-sm-12">

                <div class="registration_left">
                    <asp:Panel ID="Panel2" runat="server" DefaultButton="btnsignin">

                        <h2>Log In</h2>
                        <div class="registration_form">

                            <div>
                                <label>
                                    <asp:TextBox ID="txtuname" runat="server" CssClass="txtBox" value="Usename" onfocus="if (this.defaultValue==this.value) this.value=''" onblur="if (this.value=='') this.value=this.defaultValue"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvuname" runat="server"
                                        ControlToValidate="txtuname" Display="Dynamic" ErrorMessage="Can't be left blank" ValidationGroup="log" CssClass="txt_validation"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="revemail" runat="server"
                                        ControlToValidate="txtuname" Display="Dynamic" ErrorMessage="Invalid email id"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="log" CssClass="txt_validation"></asp:RegularExpressionValidator>
                                </label>
                            </div>


                            <div>
                                <label>
                                    <asp:TextBox ID="txtpsw" runat="server" CssClass="txtBox" TextMode="Password" value="Enter Password" onfocus="if (this.defaultValue==this.value) this.value=''" onblur="if (this.value=='') this.value=this.defaultValue"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvpsw" runat="server"
                                        ControlToValidate="txtpsw" ErrorMessage="Can't be left blank" ValidationGroup="log"
                                        CssClass="txt_validation"></asp:RequiredFieldValidator><br />
                                    <asp:CustomValidator ID="cvisvaliduser" runat="server" Display="Dynamic"
                                        ErrorMessage="Invalid user or wrong password"
                                        OnServerValidate="cvisvaliduser_ServerValidate" ValidationGroup="log"
                                        CssClass="txt_validation"></asp:CustomValidator>
                                </label>
                            </div>




                            <div class="sky-form" style="padding-left: 0px;">
                                <label class="checkbox">
                                    <asp:CheckBox ID="ckremember1" runat="server" CssClass="terms"
                                        Text=" Remember Login " Width="173px" />
                                </label>
                            </div>

                            <div class="forget">
                                <asp:LinkButton ID="lbtforgotpass" runat="server" CausesValidation="False" PostBackUrl="forgot_password.aspx" CssClass="terms" Font-Underline="false">Forgot your password? </asp:LinkButton><br>
                                Don't check this on public systems (e.g. libraries, internet cafes)

                            </div>
                            <div>

                                <asp:Button ID="btnsignin" runat="server" Text="Sign In" CssClass="addtowish" ValidationGroup="log" />
                            </div>


                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />


                        </div>
                    </asp:Panel>
                </div>
            </div>



            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>

