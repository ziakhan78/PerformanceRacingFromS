<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="warranty.aspx.cs" Inherits="warranty" %>

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
                    <h2>Warranty</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Warranty</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="">
                  <p>PERFORMANCE RACING provides warranty on every item we sell.</p> 
<p>The warranty is a warranty against any manufacturing defects.</p>
<p>Please remember that the warranty specifically covers manufacturing defects only and does not include wear and tear and/or abuse. </p>
<p>The warranty claim MUST be accompanied by the barcode label / warranty card of the product and the tax invoice issued by an authorized reseller/dealer. </p>
<p>You may approach the reseller or dealer for assistance or mail the Company directly at <a href="mailto:cs@performanceracing.in">cs@performanceracing.in</a>. </p>
<p>Claims without valid invoices & warranty card will not be entertained. Liability is limited to repair or replacement of the product based on our discretion and judgement.</p>
<p>Warranty claims can be processed only at our Mumbai Store.  </p>
<p>PERFORMANCE RACING retains the right to reject any claim at its sole discretion.</p>
                   </div>
            </div>




         




          



        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>

