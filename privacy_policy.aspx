<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="privacy_policy.aspx.cs" Inherits="privacy_policy " %>

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
                    <h2>Privacy Policy</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Privacy Policy</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="">
                  <p>This privacy policy sets out how PERFORMANCE RACING uses and protects any information that you give PERFORMANCE RACING when you use this website.</p>
                    
                  <p>PERFORMANCE RACING is committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be identified when using this website, then you can be assured that it will only be used in accordance with this privacy statement.</p>  
                    
               <p>PERFORMANCE RACING may change this policy from time to time by updating this page.</p> 
                    
                  
                    <strong>What we collect </strong>
                    <br />
                    <ul style="list-style-type:square; padding-left:20px;">


                        <li>Name</li>
                        <li>contact information including email address</li>
                        <li>Information such as postcode, preferences and interests</li>
                    </ul>
                 <strong>What we do with the information we gather</strong>
                    <br />                
                    We require this information to understand your needs and provide you with a better service, and in particular for the following reasons:<br />
                  
                    <ul style="list-style-type:square; padding-left:20px;">


                        <li>Internal record keeping.</li>
                        <li>We may use the information to improve our products and services.</li>
                        <li>We may periodically send promotional emails about new products, special offers or other information that we think you may find interesting using the email address, which you have provided.</li>
                        <li>From time to time, we may also use your information to contact you for market research purposes. We may contact you by email, phone, fax or mail. We may use the information to customise the website according to your interests.</li>
                    </ul>
                   
                  
                    <strong>Security</strong><br />
                    We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure we have put in place suitable physical, electronic and managerial procedures to safeguard and secure the information we collect online.<br />
                    <br />
                    <strong>Controlling your personal information</strong><br />
                    Any Personal Information which PERFORMANCE RACING collects and which we may use in an aggregated format ensuring you are not individually identified is our property. PERFORMANCE RACING may use it, in its sole discretion and without any compensation to you, for any legitimate purpose including (without limitation) the commercial sale thereof to third parties.
                      <br />
                    <br />

                </div>
            </div>













        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>

