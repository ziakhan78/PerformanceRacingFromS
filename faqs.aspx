<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="faqs.aspx.cs" Inherits="faqs" %>

<%@ Register Src="~/uc_testimonial.ascx" TagPrefix="uc1" TagName="uc_testimonial" %>
<%@ Register Src="~/uc_news.ascx" TagPrefix="uc1" TagName="uc_news" %>
<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     
 <!--dropdown-->
<script src="../js/jquery.easydropdown.js"></script>	
<script type="text/javascript">
    $(function () {

        var menu_ul = $('.menu_drop > li > ul'),
	           menu_a = $('.menu_drop > li > a');

        menu_ul.hide();

        menu_a.click(function (e) {
            e.preventDefault();
            if (!$(this).hasClass('active')) {
                menu_a.removeClass('active');
                menu_ul.filter(':visible').slideUp('normal');
                $(this).addClass('active').next().stop(true, true).slideDown('normal');
            } else {
                $(this).removeClass('active');
                $(this).next().stop(true, true).slideUp('normal');
            }
        });

    });
</script>	
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
                    <h2>Faq's</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Faq's</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-md-9" style="height:450px;">



               <%-- <div class="tabs">
                    <ul class="menu_drop">

                        <li class="item1 "><a href="#">
                            <img src="images/arrow.png" alt="">Does Ride-On Tire Protection System react chemically with the tires or wheels?</a>
                            <ul>
                                <li class="subitem1"><a href="#">No. Ride-On (TPS) tire sealant is chemically inert, and will not attack the tire or wheels. Ride -On (TPS) contains corrosion inhibitors that protect steel and aluminum wheels and tire belts against corrosion. Ride-On (TPS) tire sealant can be easily was hed out of tires with water. It will not affect the future use of patches or other tire repairs if necessary. Ride-On (TPS) will actually help preserve the tire casing, making retreads more effective.
                                    <br>
                                    <br>
                                </a></li>
                            </ul>
                        </li>
                        <li class="item2"><a href="#">
                            <img src="images/arrow.png" alt="">Is the Ride-On (TPS) water dispersible?</a>
                            <ul>
                                <li class="subitem2">
                                    <a href="#">Ride-On TPS is not considered a hazardous material as defined by the US EPA and DOT. Ride -On TPS is biodegradable, non-flammable, and non-explosive. 
                                       Please refer to the Ride-On Material Safety Data Sheet (MSDS) and Environmental Impact Testing Report for more details.<br>
                                        <br>
                                    </a></li>

                            </ul>
                        </li>
                        <li class="item3"><a href="#">
                            <img src="images/arrow.png" alt="">Is the Ride-On (TPS) Hazardous?</a>

                            <ul>
                                <li class="subitem2">
                                    <a href="#">Yes. since there is no chemical bonding of Ride -On (TPS) tire sealant to the tire, it can be easily washed out of a tire with water.
                                            This is particularly important to our fleet and commercial clients because, Ride-On (TPS) can be washed out of a tire so that the tire can be retreaded. 
                                            Ride -On (TPS) contains ethylene glycol, which is commonly used as an antifreeze and in cooling and heating systems. Good industrial hygiene work practices should be used when installing or 
                                            removing Ride-On (Please refer to the Material Safety Data Sheet). Please refer to your Federal, State, or Local regulations for disposing or recycling of glycol based products.<br>
                                        <br>
                                    </a></li>

                            </ul>

                        </li>




                        <li class="item4"><a href="#">
                            <img src="images/arrow.png" alt="">Will Ride-On (TPS) rust the wheels?</a>
                            <ul>
                                <li class="subitem2"><a href="#">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
                                <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
                            </ul>
                        </li>
                        <li class="item5"><a href="#">
                            <img src="images/arrow.png" alt="">
                            What is the shelf life of Ride-On (TPS)?</a>
                            <ul>
                                <li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</a></li>
                                <li class="subitem2"><a href="#">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
                                <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
                            </ul>
                        </li>

                        <li class="item5"><a href="#">
                            <img src="images/arrow.png" alt="">
                            Will Ride-On (TPS) settle in the container and need to be stirred?</a>
                            <ul>
                                <li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</a></li>
                                <li class="subitem2"><a href="#">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
                                <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
                            </ul>
                        </li>

                        <li class="item5"><a href="#">
                            <img src="images/arrow.png" alt="">Does Ride-On (TPS) run to the bottom of the tire when the tire is not in motion?</a>
                            <ul>
                                <li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</a></li>
                                <li class="subitem2"><a href="#">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
                                <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
                            </ul>
                        </li>





                        <li class="item5"><a href="#">
                            <img src="images/arrow.png" alt="">Does Ride-On (TPS) run to the bottom of the tire when the tire is not in motion?</a>
                            <ul>
                                <li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</a></li>
                                <li class="subitem2"><a href="#">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
                                <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
                            </ul>
                        </li>



                        <li class="item5"><a href="#">
                            <img src="images/arrow.png" alt="">Does Ride-On (TPS) run to the bottom of the tire when the tire is not in motion?</a>
                            <ul>
                                <li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</a></li>
                                <li class="subitem2"><a href="#">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
                                <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
                            </ul>
                        </li>

                        

                    </ul>
                </div>--%>


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

