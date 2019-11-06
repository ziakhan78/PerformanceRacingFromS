<%@ Page Title="Testimonials" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="Testimonials.aspx.cs" Inherits="Testimonials" %>

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
                    <h2>Testimonials</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active">Testimonials</li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <div class="">
                    <p>
                      <asp:Repeater ID="Repeater2" runat="server" >
            <ItemTemplate>
                    <div align="left" > <%# Eval("testimonial") %></div>
                    <div align="right" >
                      <strong><%# Eval("name") %></strong>
                        <br>
                        <%# Eval("designation") %>
                    </div>

               
                <div style="text-align:center; margin:10px 0 10px 0;">-----------------------------------</div>

                    </ItemTemplate>
        </asp:Repeater>

                    </p>

                </div>
            </div>


        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>

