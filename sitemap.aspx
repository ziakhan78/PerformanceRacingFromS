<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="sitemap.aspx.cs" Inherits="sitemap" %>

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
                    <h2>Sitemap</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="default.aspx">Home</a></li>
                    <li class="active">Sitemap</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-md-6">
                <div class="">
                    <p>
 <div class="text-paragraph">
<ul>
             ` <li class="bd"><a href="default.aspx">Home</a></li> 
                 <li class="bd"><a href="about.aspx">About</a></li>
                <li class="bd"><a href="products.aspx">Products</a></li>
                <li class="f"><a href="helments.aspx">Helmets</a></li>
               <li class="f"><a href="jackets.aspx">Jackets</a></li>
               <li class="f"><a href="boots.aspx">Boots</a></li>



					</li>
                              

							<li class="bd"><a href="new_arrivals.aspx">New Arrivals</a></li>
                            <li class="bd"> <a href="best_sellers.aspx">Best Sellers</a></li> 
                            <li class="bd"> <a href="promotions.aspx">Promotions</a></li>
                            <li class="bd"><a href="BargainBasement.aspx">Bargain  Basement</a></li>
                             <li class="bd"><a href="dealers.aspx">Dealers</a></li>
                              <li class="bd"> <a href="faqs.aspx">FAQ’s</a></li>
                              <li class="bd"><a href="contact.aspx">Contact</a></li>
                         
                                        


<br>

</ul>

 </div>














                    </p>

                </div>
            </div>


  <div class="col-md-6"><img src="../images/sitemap_banner.jpg" class="img-responsive" alt="" /></div>

         




          



        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>

