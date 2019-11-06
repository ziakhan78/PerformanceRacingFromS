<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="dealers.aspx.cs" Inherits="dealers" %>

<%@ Register Src="~/uc_testimonial.ascx" TagPrefix="uc1" TagName="uc_testimonial" %>
<%@ Register Src="~/uc_news.ascx" TagPrefix="uc1" TagName="uc_news" %>
<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery.easydropdown.js"></script>
    <script type="text/javascript">
        $(function () {
            var menu_ul = $('.cate_drop > li > ul'),
                   menu_a = $('.cate_drop > li > a');

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
                    <h2>Dealers</h2>
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
                <div>
                   Listed Below Are The Performance Racing Store Dealers.

                </div>


                <div class="col-md-7">

                    <div class="india_map">

                      
                            <div class="indicators_bengalore" title="Bangalore" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>
               

                       
                            <div class="indicators_delhi" title="Delhi" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>
                  

                      
                            <div class="indicators_kerla" title="Cochin" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>
                 
                                        <div class="indicators_trivandrum" title="Trivandrum" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>



                        <div id="id4" type="button" onclick="doFunction('4');" data-toggle="collapse" data-target="#collapseFour">
                            <div class="indicators_mumbai" title="Mumbai" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>
                        </div>



                  <div id="id4" type="button" onclick="doFunction('4');" data-toggle="collapse" data-target="#collapseFour">
                            <div class="indicators_chandrapur" title="Chandrapur" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>
                        </div>

                      
                            <div class="indicators_pune" title="Pune" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>
              

                      
                            <div class="indicators_tamilnadu" title="Coimbatore" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>
               

                      
                            <div class="indicators_vadodra" title="Vadodara" data-toggle="tooltip" data-original-title="Default tooltip">
                                <img src="images/map_pin.png" alt="" /><span class="pulse"></span>
                            </div>
                 





                    </div>
                </div>



                <div class="col-md-5">

                    <div class="row">

                        <div class="panel-group" id="accordion">

                            <div class="red_strip stydhy"><strong>Dealers</strong></div>




                            <div class="panel panel-default">
                                <%--<div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><strong>Maharashtra</strong></a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>
                                            #74/3, Prestige Delta, St. Marks Road,
                                            <br>
                                            (Behind Triumph Motorcycles Showroom)
                                            <br>
                                            Bangalore - 560001.<br>
                                        </p>
                                        <p>
                                            <strong>Mobile No.</strong><br>
                                            +91 80 4114 8113 / +91 97 4060 6319
                                        </p>

                                        <p>
                                            <strong>Email</strong><br>
                                            vickyj@performanceracingstore.net
                                        </p>

                                        <p>
                                            Time: 10am to 8pm<br>
                                            Monday to Saturday
                                        </p>


                                    </div>
                                </div>--%>

                                <div class="tabs">

                                    <ul class="cate_drop">
                                        <asp:Repeater ID="rMainCategories" runat="server" OnItemDataBound="rMainCategories_ItemDataBound">
                                            <ItemTemplate>
                                                <li class="item6">
                                                    <a href="#">
                                                        <strong><%# Eval("state_name") %>
                                                            <img src="images/plus_icon.jpg" width="30" height="30" style="float: right" alt="" /></strong>
                                                    </a>

                                                    <ul style="list-style-type:decimal; margin-left:25px;">
                                                        <asp:Repeater ID="rSubCategories" runat="server">
                                                            <ItemTemplate>
                                                                <li style="text-align:left;">
                                                                    <p style="text-align:left;">
                                                                        <strong><%# Eval("CompanyName")%></strong><br />
                                                                        <%# Eval("Address1")%><br />
                                                                        <%# Eval("Address2")%>
                                                                        <%# Eval("City")%>  <%# Eval("Pin")%>
                                                                    </p>
                                                                    <p>
                                                                        <strong>Mobile No.: </strong> <%# Eval("MobileNo1")%> / <%# Eval("MobileNo2")%><br />                                                                   
                                                                        <strong>Email: </strong> <%# Eval("EmailId")%><br />                                                                    
                                                                        <strong>Working Time: </strong><%# Eval("WorkingTimeStart", "{0:hh:mmtt }")%> - <%# Eval("WorkingTimeEnd", "{0:hh:mmtt }")%><br />
                                                                        <strong>Working Day: </strong><%# Eval("WorkingDay")%><br />
                                                                        <strong>Brands: </strong><%# Eval("BrandRepresented")%>
                                                                    </p>
                                                                    
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ul>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>


                                </div>



                            </div>






                            <%--    <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseSeven"><strong>Vadodara</strong></a>
                                    </h4>
                                </div>
                                <div id="collapseSeven" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>ts etc. <a href="http://www.tutorialrepublic.com/css-tutorial/" target="_blank">Learn more.</a></p>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>

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
                                        <img src="images/Accossato-Racing.jpg" alt="" />
                                    </div>
                                </div>

                                <div class="item">
                                    <div align="center">
                                        <img src="images/AGV-Sport.jpg" alt="" />
                                    </div>
                                </div>

                                <div class="item">
                                    <div align="center">
                                        <img src="images/Akrapovic.jpg" alt="" />
                                    </div>
                                </div>


                                <div class="item">
                                    <div align="center">
                                        <img src="images/ariete.jpg" alt="" />
                                    </div>
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

