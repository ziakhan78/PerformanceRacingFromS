<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<%@ Register Src="~/uc_testimonial.ascx" TagPrefix="uc1" TagName="uc_testimonial" %>
<%@ Register Src="~/uc_news.ascx" TagPrefix="uc1" TagName="uc_news" %>
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
                    <h2>About Performance Racing</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">About</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-md-9">
                <div class="">
                    <p>
                        We, Prasad Divadkar and Vivek Jaising, created and established Performance Racing in 2004. We are based in Mumbai, India and specialise in importing and distributing Accessories / Safety Gear / apparel and performance parts for Superbikes.
                        <br>
                        <br>
                        Our product lines have evolved from our own personal interests in motorcycles. As serious enthusiasts ourselves we have a penchant for Safety and advocate the same.
 <br>
                        <br>
                        Our motorcycle range includes trendy accessories and aftermarket parts that will boost the appeal and performance of your motorcycle. We also carry a full range of motorcycle-specific casual apparel and a full range of safety gear - jackets, riding trousers, gloves, helmets etc.
                        <br>
                        <br>
                        We are dedicated to bringing you the best products and services. As we do personally, we strive to ensure that Performance Racing offers the newest, most reliable and updated performance and styling products at the best possible prices. The website is constantly updated with detailed
information and new products. We would like you to visit often so you don't miss out on the new products
                        <br>
                        <br>
                        As motorcycle enthusiasts ourselves, we understand the needs of our customers like you and this allows us to provide you with more accurate and relevant information and services and exactly the right products you have been looking for.
                        <br>
                        <br>
                        The store began out of the need we felt as we imported parts and accessories for our own motorcycles and realised that personalising our motorcycles, whether for more speed or more
appeal, or both, is difficult. Out store, aims to ease that process by offering you the choicest parts for your motorcycle.
                        <br>
                        <br>
                        Welcome to Performance Racing, we hope you have fun bringing your motorcycle closer to how you see it in your mind's eye. We hope you find the website easy to use and fun to browse through. If not, please feel free to drop us a message telling us how we could make it, or our products and services, better.
                        <br>
                        <br>
                        We advocate riding safely on public roads. Always wear protective gear when you go riding and ride safe.
                    </p>

                </div>
            </div>




            <div class="col-md-3">
                <div class="red_strip stydhy">Brands</div>
                <div class="gray_box_01">


                    <br>

                    <div id="myCarousel" class="carousel slide" data-ride="carousel">

                        <!-- Indicators -->


                        <!-- Wrapper for slides -->
                        <div class="reduce_top">
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">

                                    <div align="center">
                                        <img src="images/Accossato-Racing.jpg" alt="" /></div>
                                </div>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/AGV-Sport.jpg" alt="" /></div>
                                </div>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/Akrapovic.jpg" alt="" /></div>
                                </div>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/ariete.jpg" alt="" /></div>
                                </div>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/go_pro.jpg" alt="" /></div>
                                </div>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/hyper_pro.jpg" alt="" /></div>
                                </div>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/rok_form.jpg" alt="" /></div>
                                </div>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/joe_rocket.jpg" alt="" /></div>
                                </div>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/carrozzeria.jpg" alt="" /></div>
                                </div>




                            </div>
                        </div>



                    </div>

                    <!-- Left and right controls -->

                    <div class="clearfix"></div>



                </div>
            </div>


            <div class="col-md-3">
                <div class="red_strip stydhy">Testimonials</div>
                <div class="gray_box">
                    <uc1:uc_testimonial runat="server" ID="uc_testimonial" />
                         </div>
            </div>


            <div class="col-md-3">
                <div class="red_strip stydhy">Latest News</div>
                <div class="gray_box">
                    <uc1:uc_news runat="server" ID="uc_news" />
                </div>
            </div>



        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>

