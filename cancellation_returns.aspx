<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="cancellation_returns.aspx.cs" Inherits="cancellation_returns" %>

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
                    <h2>Cancellation & Refund Policy</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Cancellation & Refund Policy</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="">
                    <strong>Cancellation Policy</strong>
                   <p>PERFORMANCE RACING believes in helping its customers as far as possible, and has therefore a liberal cancellation policy.</p>
 <ul style="list-style-type:square; padding-left:20px;">


                        <li>Cancellations will be considered only if the request is made within 24 hours of placing an order. However, the cancellation request will not be entertained if the orders have been communicated to the warehouse and they have initiated the process of shipping them.</li>
<li>There is no cancellation of orders placed under the Same Day Delivery category.</li>
<li>No cancellations are entertained for those products that PERFORMANCE RACING marketing team has obtained on special occasions like Pongal, Christmas, Diwali, Valentine’s Day etc. These are limited occasion offers and therefore cancellations are not possible.</li>
<li>In case of receipt of damaged or defective items please report the same to our Customer Service team. The request will, however, be entertained once the merchant has checked and determined the same at his own end. This should be reported within 24 hours of receipt of the products.</li>
    </ul>


                   <strong>Refund Policy</strong>
                    <p>
                        PERFORMANCE RACING does not have any refund policy, unless the product received by the customer is defective or damaged, PERFORMANCE RACING will repair or replace the product, after inspecting and validating the claim.
                    </p>

                </div>
            </div>




         




          



        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>

