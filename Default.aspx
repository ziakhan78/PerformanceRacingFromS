<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" UICulture="hi-IN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script>
        $(document).ready(function () {
            $("div.item:first").addClass("active");

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <!--bottom-header-->
            <!--banner-starts-->
            <div class="bnr" id="home">
                <div id="top" class="callbacks_container">
                    <ul class="rslides" id="slider4">

                        <li>
                            <div class="banner5"><img class="img-responsive" src="images/bnr-5.jpg" style="width:100%;"/></div>
                        </li>

                        <li>
                            <div class="banner6"><img class="img-responsive" src="images/bnr-6.jpg" style="width:100%;"/></div>
                        </li>

                        <li>
                            <div class="banner"><img class="img-responsive" src="images/bnr-2.jpg" style="width:100%;"/></div>
                        </li>

                        <li>
                            <div class="banner1"><img class="img-responsive" src="images/bnr-3.jpg" style="width:100%;"/></div>
                        </li>

                        <li>
                            <div class="banner2"><img class="img-responsive" src="images/bnr-4.jpg" style="width:100%;"/></div>
                        </li>

                        <li>
                            <div class="banner3"><img class="img-responsive" src="images/bnr-1.jpg" style="width:100%;"/></div>
                        </li>

   <li>
                            <div class="banner3"><img class="img-responsive" src="images/bnr-8.jpg" style="width:100%;"/></div>
                        </li>

                    </ul>

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


            <!--news-starts-->
            <div class="container">
                <div class="ticker-container">
                    <div class="ticker-caption">
                        Breaking News
                    </div>
                    <div>
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="dsNews">
                            <ItemTemplate>
                                <div>
                                    <marquee><%# Eval("news") %></marquee>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="dsNews" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="z_GetAllNews" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>

        

            <div class="container">
                <div class="row">
                    <div class="sap_tabs">
                        <div id="horizontalTab">
                            <ul class="resp-tabs-list">
                                <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>New Arrivals </span></li>
                                <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Best Sellers</span></li>
                                <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Promotions</span></li>
                                <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span>Bargain Basement</span></li>
                                <div class="clearfix"></div>
                            </ul>

                            <div class="resp-tabs-container">

                                <!--New Arrivals-->
                                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">

                                    <div class="product-one">

                                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                            <ItemTemplate>
                                                <div class="col-md-3 col-sm-6 product-left" style="padding-bottom: 25px;">
                                                    <div class="product-main simpleCart_shelfItem">

                                                        <div class=" you-onto" id="divDiscount1" runat="server">
                                                            <asp:Label ID="lblPerce" runat="server" Text='<%# Eval("percentage", "{0:n0}") %>' Visible="false"></asp:Label></span>
                                                        </div>

                                                        <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_amt") %>" class="mask">                                                            
                                                            <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                            <asp:Image ID="img1" runat="server" Style="height: auto; width: 270px;" CssClass="img-responsive zoom-img" />
                                                        </a>
                                                        <div class="product-bottom">
                                                            <h3 ><%# Eval("product_name") %></h3>
                                                            <p>
                                                                <strong>
                                                                    <asp:Label ID="lblPrice" runat="server" ToolTip="Inclusive of GST" Text='<%# Eval("selling_price", "{0:n0}") %>'></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblDisPrice" runat="server" Text='<%# Eval("discount_percentage_amt", "{0:n0}") %>'></asp:Label>
                                                                </strong>
                                                            </p>
                                                          
                                                            <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_amt") %>" class="btn btn-default btn-circle" title="Add to Cart" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-shopping-cart"></i></a>&nbsp;
                                                            <asp:LinkButton ID="lnkBtnWishList" runat="server" title="Add to Wishlist" data-toggle="tooltip" CssClass="btn btn-default btn-circle" CommandArgument='<%# Eval("pid") %>' CommandName="AddtoWishlist"><i class="fa fa-heart"></i></asp:LinkButton>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <div class="clearfix"></div>
                                    </div>

                                </div>

                                <!--Best Sellers-->
                                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
                                    <div class="product-one">

                                       
                                          <asp:Repeater ID="rptBestSellers" runat="server" OnItemDataBound="rptBestSellers_ItemDataBound" OnItemCommand="rptBestSellers_ItemCommand">
                                            <ItemTemplate>
                                                <div class="col-md-3 col-sm-6 product-left" style="padding-bottom: 25px;">
                                                    <div class="product-main simpleCart_shelfItem">

                                                        <div class="you-onto" id="divDiscount1" runat="server">
                                                            <asp:Label ID="lblPerce" runat="server" Text='<%# Eval("percentage", "{0:n0}") %>' Visible="false"></asp:Label></span>
                                                        </div>

                                                        <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_percentage_amt") %>" class="mask">                                                            
                                                            <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                            <asp:Image ID="img1" runat="server" Style="height: auto; width: 270px;" CssClass="img-responsive zoom-img" />
                                                        </a>
                                                        <div class="product-bottom">
                                                            <h3 ><%# Eval("product_name") %></h3>
                                                            <p>
                                                                <strong>
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price", "{0:n0}") %>'></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblDisPrice" runat="server" Text='<%# Eval("discount_percentage_amt", "{0:n0}") %>'></asp:Label>
                                                                </strong>
                                                            </p>
                                                          
                                                            <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_percentage_amt") %>" class="btn btn-default btn-circle" title="Add to Cart" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-shopping-cart"></i></a>&nbsp;
                                                            <asp:LinkButton ID="lnkBtnWishList" runat="server" title="Add to Wishlist" data-toggle="tooltip" CssClass="btn btn-default btn-circle" CommandArgument='<%# Eval("pid") %>' CommandName="AddtoWishlist"><i class="fa fa-heart"></i></asp:LinkButton>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <div class="clearfix"></div>
                                    </div>



                                    <div class="product-one">





                                       





                                        <div class="clearfix"></div>
                                    </div>

                                </div>

                                <!--Promotions-->
                                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">

                                    <div class="product-one">

                                        <asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                            <ItemTemplate>
                                                <div class="col-md-3 col-sm-6 product-left" style="padding-bottom: 25px;">
                                                    <div class="product-main simpleCart_shelfItem">

                                                        <div class=" you-onto" id="divDiscount1" runat="server">
                                                            <asp:Label ID="lblPerce" runat="server" Text='<%# Eval("percentage", "{0:n0}") %>' Visible="false"></asp:Label></span>
                                                        </div>

                                                        <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_percentage_amt") %>" class="mask">

                                                            <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                            <asp:Image ID="img1" runat="server" Style="height: auto; width: 270px;" CssClass="img-responsive zoom-img" />
                                                        </a>
                                                        <div class="product-bottom">
                                                            <h3 style="height: 30px;"><%# Eval("product_name") %></h3>
                                                            <p>
                                                                <strong>
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblDisPrice" runat="server" Text='<%# Eval("discount_percentage_amt", "{0:n0}") %>'></asp:Label>
                                                                </strong>
                                                            </p>
                                                            <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_percentage_amt") %>" class="btn btn-default btn-circle" title="Add to Cart" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-shopping-cart"></i></a>
                                                            &nbsp;
                                                           <asp:LinkButton ID="lnkBtnWishList" runat="server" title="Add to Wishlist" data-toggle="tooltip" CssClass="btn btn-default btn-circle" CommandArgument='<%# Eval("pid") %>' CommandName="AddtoWishlist"><i class="fa fa-heart"></i></asp:LinkButton>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <div class="clearfix"></div>
                                    </div>


                                </div>

                                <!--Bargain Basement-->
                                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">
                                    <div class="product-one">
                                        <asp:Repeater ID="Repeater4" runat="server" OnItemDataBound="Repeater4_ItemDataBound" OnItemCommand="Repeater4_ItemCommand">
                                            <ItemTemplate>
                                                <div class="col-md-3 col-sm-6 product-left" style="padding-bottom: 25px;">
                                                    <div class="product-main simpleCart_shelfItem">

                                                        <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("selling_price") %>" class="mask">
                                                            <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                            <asp:Image ID="img1" runat="server" Style="height: auto; width: 270px;" CssClass="img-responsive zoom-img" />
                                                        </a>
                                                        <div class="product-bottom">
                                                            <h3 style="height: 30px;"><%# Eval("product_name") %></h3>
                                                            <p>
                                                                <strong>
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblDisPrice" runat="server" Text='<%# Eval("selling_price", "{0:n0}") %>'></asp:Label>
                                                                </strong>
                                                            </p>
                                                            <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("selling_price") %>" class="btn btn-default btn-circle" title="Add to Cart" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-shopping-cart"></i></a>
                                                            &nbsp;
                                                           <asp:LinkButton ID="lnkBtnWishList" runat="server" title="Add to Wishlist" data-toggle="tooltip" CssClass="btn btn-default btn-circle" CommandArgument='<%# Eval("pid") %>' CommandName="AddtoWishlist"><i class="fa fa-heart"></i></asp:LinkButton>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                    




                                        <div class="clearfix"></div>
                                    </div>



                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Testimonials Code-->

            <div class="testimonials">
                <div class="container">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">

                        <!-- Indicators -->
                       <%-- <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>--%>

                        <!-- Wrapper for slides -->
                        <div class="reduce_top">
                            <div class="carousel-inner" role="listbox">

                                  <asp:Repeater ID="RepeaterTestimonials" runat="server" >
            <ItemTemplate>
                                <div class="item">
                                    <div align="center">
                                        <img src="images/<%# Eval("image") %>" alt="" />
                                    </div>
                                    <div class="testi_style1"><%# Eval("name") %></div>
                                    <div class="testi_style1"><%# Eval("testimonial") %></div> 
                                </div>
                </ItemTemplate>
                                      </asp:Repeater>

                            </div>
                        </div>



                    </div>

                    <!-- Left and right controls -->

                    <div class="clearfix"></div>



                </div>
            </div>

            <!--end of testimonials-->
            <!--start-image-cursuals-->
            <div class="scroll-slider">
                <div class="container">

                    <div class="special">
                        <h3>Favourite Brands</h3>
                    </div>

                    <div class="nbs-flexisel-container">
                        <div class="nbs-flexisel-inner">

                            <ul class="flexiselDemo3 nbs-flexisel-ul" style="left: -253.6px; display: block;">
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="dsBrands">
                                    <ItemTemplate>
                                        <li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;">
                                            <img class="" src="BrandImages/<%# Eval("logo") %>" alt="" /></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsBrands" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [logo], [brand_name] FROM [brand_master_tbl] where logo is not null ORDER BY [brand_name]"></asp:SqlDataSource>
                            </ul>
                            <div class="nbs-flexisel-nav-left" style="top: 21.5px;"></div>
                            <div class="nbs-flexisel-nav-right" style="top: 21.5px;"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!--start-image-->
                    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                    <!--//end-->
                    <script type="text/javascript">
                        $(window).load(function () {
                            $(".flexiselDemo3").flexisel({
                                visibleItems: 5,
                                animationSpeed: 1000,
                                autoPlay: true,
                                autoPlaySpeed: 3000,
                                pauseOnHover: true,
                                enableResponsiveBreakpoints: true,
                                responsiveBreakpoints: {
                                    portrait: {
                                        changePoint: 480,
                                        visibleItems: 2
                                    },
                                    landscape: {
                                        changePoint: 640,
                                        visibleItems: 3
                                    },
                                    tablet: {
                                        changePoint: 768,
                                        visibleItems: 3
                                    }
                                }
                            });
                        });
                    </script>
                    <!---->
                </div>
            </div>
            <!--//end-bottom-->



            <div class="foot_newsleter_bg">
                <div class="container">
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">



                        <div class="col-md-4">
                            <div class="row">
                                <div class="news_letter_style1">Newsletter Subscription</div>
                                <div class="news_letter_style2">Provide your email address and get notified about our latest products and awesome offers.</div>
                            </div>
                        </div>
                        <br>



                        <div class="col-md-2">

                            <div>
                                <asp:Label ID="lblMessage" runat="server" CssClass="label label-success"></asp:Label>

                                <asp:TextBox ID="txtFName" runat="server" placeholder="First Name"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvFname" runat="server" ControlToValidate="txtFName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="N"></asp:RequiredFieldValidator>

                            </div>



                        </div>

                        <div class="col-md-2">
                            <asp:TextBox ID="txtLName" runat="server" placeholder="Last Name"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="rfvLname" runat="server" ControlToValidate="txtLName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="N"></asp:RequiredFieldValidator>

                        </div>



                        <div class="col-md-4 ">
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email-Id"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="N"></asp:RequiredFieldValidator>
                            <asp:Button ID="btnSubmit" runat="server" Text="Subscribe" CssClass="" OnClick="btnSubmit_Click1" ValidationGroup="N" />



                        </div>
                    </asp:Panel>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
