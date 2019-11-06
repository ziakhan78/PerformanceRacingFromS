<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="shipping_delivery.aspx.cs" Inherits="shipping_delivery" %>

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
                    <h2>Shipping & Delivery</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Shipping & Delivery</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="">
                    <strong>Shipping & Delivery Policy</strong><br />
<p>For domestic buyers, orders are shipped through registered domestic courier companies and /or speed post only. Orders are shipped within 48 hours, if the goods are in stock. If the product is on back order, then it will be shipped 48 hours after we receive it in our warehouse. PERFORMANCE RACING is not liable for any delay in delivery by the courier company / postal authorities and only guarantees to hand over the consignment to the courier company or postal authorities within 48 hours from the date of the order and payment. Delivery of all orders will be to registered address of the buyer as per the credit/debit card only at all times (Unless specified at the time of Order). PERFORMANCE RACING is in no way responsible for any damage to the order while in transit to the buyer.</p> 
<strong>Shipping & Delivery Policy (Services)</strong>

<p>Delivery of our services will be confirmed on your mail ID as specified during registration. For any issues in utilizing our services you may contact our store on +91-22-65879696.</p>

                  

                </div>
            </div>




         




          



        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>

