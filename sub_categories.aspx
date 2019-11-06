<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="sub_categories.aspx.cs" Inherits="sub_categories" %>

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
                    <h2>
                        Category - <asp:Label ID="lblCategory" runat="server" ></asp:Label></h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="default.aspx">Home</a></li>
                    <li><a href="categories.aspx">Categories</a></li>
                    <li class="active"><asp:Label ID="lblCategory2" runat="server" ></asp:Label></li>
                </ul>


            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsSubCategories">
                <ItemTemplate>
                    <div class="col-md-4 col-sm-6 col-xs-6 cate-thumbs-item">
                        <div class="category_bg">
                            <div class="banner-item">
                                <div class="banner-details">
                                    <div class="banner-title"><%# Eval("subcat_name") %> &nbsp;&nbsp;<span style="float:right; padding-right:10px;"><a class="banner-more" href="products.aspx?cid=<%# Eval("cid") %>&sid=<%# Eval("sid") %>">View More</a></span></div>
                                    
                                </div>

                                <a class="banner-more" href="products.aspx?cid=<%# Eval("cid") %>&sid=<%# Eval("sid") %>"><img class="img-responsive" src="CategoryImages/<%# Eval("subcat_image") %>" alt="" /></a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource ID="dsSubCategories" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [sid], [cid], [subcat_name], [subcat_image] FROM [Subcategory_tbl] WHERE ([cid] = @cid) ORDER BY [subcat_name]">
                <SelectParameters>
                    <asp:QueryStringParameter Name="cid" QueryStringField="cid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>


            <div class="clearfix"></div>
        </div>

    </div>
</asp:Content>

