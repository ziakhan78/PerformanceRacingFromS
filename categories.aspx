<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="categories.aspx.cs" Inherits="categories" %>

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
                    <h2>Categories</h2>
                </div>
                <ul class="breadcrumb">
                    <li><a href="default.aspx">Home</a></li>
                    <li class="active">Categories</li>
                </ul>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsCategories">
                <ItemTemplate>


                    <div class="col-lg-4  col-sm-6 col-xs-6 cate-thumbs-item">
                        <div class="category_bg">
                            <div class="banner-item">
                                <div class="banner-details">
                                    <div class="banner-title"><%# Eval("cat_name") %>&nbsp;&nbsp;<span style="float:right; padding-right:10px;"> <a class="banner-more" href="sub_categories.aspx?cid=<%# Eval("cid") %>">View More</a></span></div>
                                </div>

                                <a href="sub_categories.aspx?cid=<%# Eval("cid") %>">
                                    <img class="img-responsive" src="CategoryImages/<%# Eval("cat_image") %>" alt="" /></a>
                            </div>
                        </div>
                    </div>


                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [cid], [cat_name], [cat_image] FROM [Category_tbl] where cat_name!='Bargain Basement' ORDER BY [cat_name]"></asp:SqlDataSource>

            <div class="clearfix"></div>
        </div>

    </div>
</asp:Content>

