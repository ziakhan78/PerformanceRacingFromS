<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

    <div class="bs-example">
        <div class="container">
            <div class="row">

                <div class="main_heading_div">
                    <h2>Contact</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active">Contact</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="heading_billabong heading5">Feedback Form </div>

                <div class="page_temp_contact">

                    <div id="write">
                        Feel free to contact us with any questions or comments you may have about us. 
We'll get back to you as soon as possible with an answer!<br />
                        <br />
                    </div>

                    <div>
                        <div class="textname">Name <span>* </span></div>
                        <div class="inputname">
                            <asp:TextBox ID="txtName" runat="server" CssClass="textfield"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="F"></asp:RequiredFieldValidator>

                        </div>
                        <div class="textname">Company Name</div>
                        <div class="inputname">
                            <asp:TextBox ID="txtCompany" runat="server" CssClass="textfield"></asp:TextBox></div>
                        <div class="textname">Email <span>* </span></div>
                        <div class="inputname">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="textfield"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="rfvEmailId" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="F"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Invalid Email-Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="F"></asp:RegularExpressionValidator>
                        </div>
                        <div class="textname">Contact Number </div>
                        <div class="inputname">
                            <asp:TextBox ID="txtContactNumber" runat="server" CssClass="textfield"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContactNumber" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="F"></asp:RequiredFieldValidator>
                        </div>
                        <div class="textname">Message <span>* </span></div>
                        <div class="inputname">
                            <asp:TextBox ID="txtMessage" TextMode="MultiLine" Rows="5" runat="server" CssClass="textfield"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvComments" runat="server" ControlToValidate="txtMessage" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="F"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputname">
                            <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-danger btn-sub" OnClick="btnSubmit_Click" ValidationGroup="F"><i class="fa fa-paper-plane"></i>&nbsp;Submit</asp:LinkButton></div>
                    </div>

                </div>
            </div>

            <div class="col-lg-8 col-md-8 col-sm-12 ">

                <div class="heading5">Address</div>

                <div class="icon-text">
                    <i class="fa fa-map-marker"></i>
                    <p>
                        <strong>Mumbai Address</strong><br />
                        Shop No. 7-8, 143/147, Adam Mahal, Ratan Tata Colony, Tardeo, Mumbai - 400 034. INDIA
                    </p>
                </div>
                <div class="icon-text">
                    <i class="fa fa-phone"></i>
                    <p><strong>Tel:</strong> +91-22-23549696 / +91-22-23526038 / +91-8655879696 / <a href="tel:+919820588118" target="">+91-9820588118</a></p>
                </div>
                <div class="icon-text">
                    <i class="fa fa-envelope-o"></i>
                    <p><a href="mailto:sales@performanceracing.in">sales@performanceracing.in</a></p>
                </div>

                <div class="heading_billabong heading5">Map</div>
                <br />
                <div>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1586.399186174931!2d72.81370640128328!3d18.970554485068156!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7ce71f37b8381%3A0xa54f89f6235fbf0c!2sPerformance+Racing!5e0!3m2!1sen!2sin!4v1444645052086" width="100%" height="360" frameborder="0" style="border: 0" allowfullscreen></iframe>
                </div>

            </div>



        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>
