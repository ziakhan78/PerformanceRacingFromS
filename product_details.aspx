<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="product_details.aspx.cs" Inherits="product_details3" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!--zoome script n css-->
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script src='http://code.jquery.com/jquery-1.9.1.min.js'></script>
    <script src='../js/jquery.elevateZoom-2.5.3.min.js'></script>
    <script src='../js/jquery.fancybox.js'></script>

    <style type="text/css">
        #gallery_01 img {
            border: 1px solid #eee;
            border-radius: 0px;
        }

        #gallery_01 {
            margin-top: 10px;
        }

        .active img {
            border: 1px solid #333 !important;
        }
    </style>


    <!--end of zoome script n css-->


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
    <script type="text/JavaScript">
<!--
    function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
    }
    //-->
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
                    <h2>Product Details</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="#"></a></li>
                </ul>


            </div>
        </div>
    </div>

    <div class="container">
        <div class="">
            <div class="bcrumb">
                <ol class="breadcrumb">
                    <li><a href="default.aspx">Home</a></li>
                    <li><a href="categories.aspx">
                        <asp:Label ID="lblCatName" runat="server"></asp:Label></a></li>
                    <li><a id="lnkCat" runat="server">
                        <asp:Label ID="lblSubCatName" runat="server"></asp:Label></a></li>
                    <li class="active">
                        <asp:Label ID="lblProductName" runat="server"></asp:Label></li>
                </ol>
            </div>
        </div>
    </div>



  <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>



            <div class="container">
                <div class="row">

                    <div class="col-lg-5 col-md-5 col-sm-5">
                        <div class="">

                            <div class="panel-zoom">
                                <%-- <img id="img_01" class="img-responsive" src="ProductsImages/image_1.jpg" data-zoom-image="ProductsImages/image_1.jpg" />--%>
                                <img id="img_01" src="<% =imagepath1 %>" data-zoom-image="<% =imagepath2 %>" class="img-responsive" />
                            </div>
                            <div class="clearfix" style="height: 10px;"></div>

                            <ul class="list-unstyled list-inline" id="gallery_01">
                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                    <ItemTemplate>

                                        <li>
                                            <%-- <a href="#" data-image="ProductsImages/image_1.jpg" data-zoom-image="ProductsImages/image_1.jpg">
                            <img class="img-responsive thumbnail" id="img_01" src="ProductsImages/image_1.jpg" style="height:77px; width:77px" />
                        </a>--%>

                                            <a href="#" data-image="ProductsImages/<%# Eval("images") %>" data-zoom-image="ProductsImages/<%# Eval("images") %>" style="width: 600px; height: 600px;">
                                                <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                <asp:Image ID="img1" runat="server" BorderWidth="0" Height="77px" Width="77px" />
                                            </a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <%-- <li><a href="#" data-image="ProductsImages/image_2.jpg" data-zoom-image="ProductsImages/image_2.jpg">
                            <img class="img-responsive thumbnail" id="img_02" src="ProductsImages/image_2.jpg" style="height:77px; width:77px" />
                        </a></li>

                        <li><a href="#" data-image="ProductsImages/image_3.jpg" data-zoom-image="ProductsImages/image_3.jpg">
                            <img class="img-responsive thumbnail" id="img_03" src="ProductsImages/image_3.jpg" style="height:77px; width:77px" />
                        </a></li>

                        <li><a href="#" data-image="ProductsImages/image_4.jpg" data-zoom-image="ProductsImages/image_4.jpg">
                            <img class="img-responsive thumbnail" id="img_04" src="ProductsImages/image_4.jpg" style="height:77px; width:77px" />
                        </a></li>

                        <li><a href="#" data-image="ProductsImages/image_5.jpg" data-zoom-image="ProductsImages/image_5.jpg">
                            <img class="img-responsive thumbnail" id="img_05" src="ProductsImages/image_5.jpg" style="height:77px; width:77px" />
                        </a></li>--%>
                            </ul>



                            <script>
                                $("#img_01").elevateZoom({ gallery: 'gallery_01', cursor: 'pointer', galleryActiveClass: 'active' });

                                //pass the images to Fancybox
                                $("#img_01").bind("click", function (e) {
                                    var ez = $('#img_01').data('elevateZoom');
                                    $.fancybox(ez.getGalleryList());
                                    return false;
                                });
                            </script>


                        </div>
                    </div>

                    <div class="col-lg-7 col-md-7 col-sm-7">
                        <div class="panel-smart">
                            <!-- Product Name Starts -->
                            <h2>
                                <asp:Label ID="lblProName" runat="server"></asp:Label></h2>
                            <!-- Product Name Ends -->
                            <div class="clearfix" style="height: 5px;"></div>
                            <!-- Manufacturer Starts -->


                            <ul class="list-unstyled manufacturer">
                                <li>
                                    <span>Brand:</span>
                                    <asp:Label ID="lblBrand" runat="server"></asp:Label>
                                </li>

                                <li>
                                    <asp:Label ID="lblMfg" runat="server"></asp:Label>
                                </li>

                                <li><span>Product Code:</span>
                                    <asp:Label ID="lblsku" runat="server"></asp:Label></li>
                                <!--						<li>
							<span>Availability:</span> <strong class="label label-danger">Out Of Stock</strong>
						</li>-->
                            </ul>

                            <!-- Manufacturer Ends -->

                            <p>
                                <asp:Label ID="lblShortDesc" runat="server"></asp:Label>
                            </p>
                            <hr>
                            <!-- Price Starts -->
                            <div class="price">
                                <span class="price-head">
                                    <asp:Label ID="lblPrice" runat="server"></asp:Label></span><asp:Label ID="lblGstText" runat="server"></asp:Label>
                                <span class="price-new">
                                    <asp:Label ID="lblDealerPrice" runat="server"></asp:Label>
                                    <asp:Label ID="lblDiscount" runat="server"></asp:Label></span>
                                <span class="price-old">
                                    <asp:Label ID="lblSave" runat="server"></asp:Label></span>
                            </div>
                            <!-- Price Ends -->
                            <hr>
                            <%--  <div class="price">
                      
                        <span class="price-new">
                            <asp:Label ID="lblDealerPrice" runat="server"></asp:Label></span>
                        
                    </div>
                    <hr>--%>

                            <!-- Available Options Starts -->

                            <div style="margin: 0 0 10px 0;">
                                <div class="btn-stock"><i class="fa fa-check"></i></div>
                                <span class="product_meta"><strong>Availability: </strong><span class="sku">
                                    <asp:Label ID="lblStock" runat="server"></asp:Label></span></span>
                            </div>
                            <div>
                                <div class="btn-stock"><i class="fa fa-truck"></i></div>
                                <span class="product_meta"><strong>Delivery Time: </strong><span class="sku">
                                    <asp:Label ID="lblDeliveryTime1" runat="server"></asp:Label></span></span>
                            </div>



                            <%--  <ul class="product-colors">
                                <h3 class="availability"><strong>Available Colors</strong></h3>
                              <%--  <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound1" OnItemCommand="Repeater2_ItemCommand">
                                    <ItemTemplate>
                                        <asp:Label ID="lblColorHexCode" runat="server" Text='<%# Eval("hex_code") %>' Visible="false"></asp:Label>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("color") %>' CommandName='SelectColor'>                                        
                                        <asp:Label ID="lblColorCode" runat="server" Height="32px" Width="32px" ></asp:Label></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <ul>
                                       
                                    </ul>

                                <asp:RadioButtonList ID="ddlColorRD" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="ddlColorRD_SelectedIndexChanged">                                   
                                </asp:RadioButtonList>

                                <li>
                                    <asp:RequiredFieldValidator ID="rfvColor" runat="server" ControlToValidate="ddlColor" ErrorMessage="Please Select Color!" InitialValue="Select" Style="color: #FF0000" ValidationGroup="AC"></asp:RequiredFieldValidator>
                                </li>

                            </ul>--%>

                            <div class="available">
                                <div >
                                    <ul>
                                        <li class="size-in">Colors:
                                <asp:DropDownList ID="ddlColor" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged">
                                </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvColor" runat="server" ControlToValidate="ddlColor" InitialValue="Colour" ErrorMessage="Please Select Colour!" ValidationGroup="AC" Style="color: #FF0000"></asp:RequiredFieldValidator>
                                        </li>
                                        <li class="size-in2" id="idSize" runat="server">Size:
                                          
                                            <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSize_SelectedIndexChanged">
                                            </asp:DropDownList><asp:RequiredFieldValidator ID="rfvSize" runat="server" ControlToValidate="ddlSize" InitialValue="Size" ErrorMessage="Please Select Size!" ValidationGroup="AC" Style="color: #FF0000"></asp:RequiredFieldValidator>
                                          

                                            <%-- <asp:DropDownList ID="ddlBootSize" runat="server" CssClass="size-in" AutoPostBack="True" OnSelectedIndexChanged="ddlBootSize_SelectedIndexChanged"></asp:DropDownList>--%>
                                            <%--  <asp:DropDownList ID="ddlSize" runat="server" CssClass="size-in" AutoPostBack="True" OnSelectedIndexChanged="ddlSize_SelectedIndexChanged">
                            <asp:ListItem Text="Select"></asp:ListItem>
                            <asp:ListItem Text="Small"></asp:ListItem>
                            <asp:ListItem Text="Medium"></asp:ListItem>
                            <asp:ListItem Text="Large"></asp:ListItem>
                            <asp:ListItem Text="Extra Large"></asp:ListItem>
                            <asp:ListItem Text="2XL"></asp:ListItem>
                            <asp:ListItem Text="3XL"></asp:ListItem>
                            <asp:ListItem Text="4XL"></asp:ListItem>
                            <asp:ListItem Text="5XL"></asp:ListItem>
                            <asp:ListItem Text="6XL"></asp:ListItem>
                        </asp:DropDownList>

                                            <asp:DropDownList ID="ddlBootSize" runat="server" CssClass="size-in" AutoPostBack="True" OnSelectedIndexChanged="ddlBootSize_SelectedIndexChanged">
                                                <asp:ListItem Text="Select"></asp:ListItem>
                                                <asp:ListItem Text="39"></asp:ListItem>
                                                <asp:ListItem Text="40"></asp:ListItem>
                                                <asp:ListItem Text="41"></asp:ListItem>
                                                <asp:ListItem Text="42"></asp:ListItem>
                                                <asp:ListItem Text="43"></asp:ListItem>
                                                <asp:ListItem Text="44"></asp:ListItem>
                                                <asp:ListItem Text="45"></asp:ListItem>
                                                <asp:ListItem Text="46"></asp:ListItem>
                                            </asp:DropDownList>--%>
                                              <%-- <asp:RequiredFieldValidator ID="rfvBootSize" runat="server" ControlToValidate="ddlBootSize" InitialValue="Select" ErrorMessage="Please Select Size!" ValidationGroup="AC" Style="color: #FF0000"></asp:RequiredFieldValidator>--%>

                                        </li>
                                    </ul>
                                </div>



                                <div class="quantity">
                                    <ul>
                                        <li class="size-in">Qty:
                                    <asp:DropDownList ID="ddlQty" runat="server" CssClass="" AutoPostBack="false">
                                    </asp:DropDownList>

                                        </li>
                                    </ul>
                                </div>


                            </div>

                            <div class="clearfix"></div>
                            <div style="margin: 10px 0 10px 0;">
                                <asp:Button ID="btnAddtoCart" runat="server" Text="Add to Cart" CssClass="btn" OnClick="btnAddtoCart_Click" ValidationGroup="AC" />

                                <asp:Button ID="lnkBtnWishList" runat="server" Text="Add to Wishlist" CssClass="btn" OnClick="lnkBtnWishList_Click" />
                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Size="18px" Font-Names="Oswald,sans-serif"></asp:Label>
                            </div>

                            <div style="margin: 10px 0 10px 0;">
                                <strong>Tags:</strong>
                                <asp:Label ID="lblProductTags" runat="server"></asp:Label>
                            </div>
                            <div>
                                <div class="btn-stock"><i class="fa fa-envelope"></i></div>
                                <span class="product_meta">Email to a Friend</span>
                            </div>
                            <div style="margin: 10px 0 0px 0;">
                                <%--<img src="images/social_img.jpg" alt="" />--%>
                                <telerik:RadSocialShare ID="RadSocialShare1" runat="server">
                                    <MainButtons>
                                        <telerik:RadSocialButton SocialNetType="ShareOnFacebook"></telerik:RadSocialButton>
                                        <telerik:RadSocialButton SocialNetType="ShareOnTwitter"></telerik:RadSocialButton>
                                        <telerik:RadSocialButton SocialNetType="ShareOnPinterest" UrlToShare="http://demos.telerik.com/aspnet-ajax/Common/Images/SiteNav/telerik-logo.png" TitleToShare=".NET UI Controls, Reporting, Visual Studio Tools, Agile Project Management, Automated Testing, ASP.NET Web CMS by Telerik"></telerik:RadSocialButton>
                                        <telerik:RadSocialButton SocialNetType="GoogleBookmarks"></telerik:RadSocialButton>
                                        <telerik:RadSocialButton SocialNetType="LinkedIn"></telerik:RadSocialButton>
                                        <telerik:RadSocialButton SocialNetType="MailTo"></telerik:RadSocialButton>
                                        <telerik:RadSocialButton SocialNetType="SendEmail"></telerik:RadSocialButton>
                                    </MainButtons>
                                </telerik:RadSocialShare>
                            </div>

                            <div style="margin: 5px 0 5px 0;">
                                <img src="images/ico1.jpg" width="39" height="42" alt="" /><span class="product_meta">100% Genuine & Quality Products</span>
                            </div>



                            <div>
                                <span class="product_meta">Review
                            <asp:Label ID="lblReviews" runat="server" Text="0"></asp:Label>
                                    <telerik:RadRating ID="RadRating2" runat="server" DbValue="0" ReadOnly="true">
                                        <Items>
                                            <telerik:RadRatingItem Value="1" ToolTip="Bad"></telerik:RadRatingItem>
                                            <telerik:RadRatingItem Value="2" ToolTip="Poor"></telerik:RadRatingItem>
                                            <telerik:RadRatingItem Value="3" ToolTip="Regular"></telerik:RadRatingItem>
                                            <telerik:RadRatingItem Value="4" ToolTip="Good"></telerik:RadRatingItem>
                                            <telerik:RadRatingItem Value="5" ToolTip="Gorgeues"></telerik:RadRatingItem>
                                        </Items>
                                    </telerik:RadRating>
                                </span>

                                <div id="btnRateThisProduct" runat="server">
                                    <a href="javascript:void(0)" onclick="MM_openBrWindow('product_review_popup.aspx','01111','width=650, height=500')" class="addtowish">Rate This Product</a>
                                </div>
                                <br />
                            </div>


                            <%-- <div style="height: auto; border-bottom: 1px solid #c9c7c7; border-top: 1px solid #c9c7c7;">
                        <asp:Panel ID="Panel2" runat="server" DefaultButton="btnCheckPincode">
                            <div id="addtocart_button">
                                <div style="padding: 6px 0 0 0;">
                                    Delivery Availability

                        <telerik:RadNumericTextBox ID="txtPincode" runat="server" MaxLength="6" Width="90px" EmptyMessage="Enter Pincode">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                        </telerik:RadNumericTextBox>
                                    <asp:LinkButton ID="btnCheckPincode" runat="server" CssClass="btn btn-danger btn-sub" OnClick="btnCheckPincode_Click"><i class="fa fa-paper-plane"></i> Submit</asp:LinkButton>
                                </div>
                            </div>
                            <asp:Panel ID="Panel1" runat="server">
                                <ul style="list-style: none;">
                                    <li>
                                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                    </li>

                                    <li>
                                        <asp:Label ID="lblCod" runat="server"></asp:Label>
                                    </li>

                                    <li>
                                        <asp:Label ID="lblFreeShiping" runat="server"></asp:Label>
                                    </li>

                                    <li>
                                        <asp:Label ID="lblDeliveryTime" runat="server"></asp:Label>
                                    </li>
                                </ul>
                            </asp:Panel>
                        </asp:Panel>

                    </div>--%>
                        </div>
                    </div>


                </div>

                <div class="clearfix"></div>
            </div>

    <%--    </ContentTemplate>
    </asp:UpdatePanel>--%>
    <div class="container">
        <div class="row">

            <div class="tabs">
                <ul class="menu_drop">

                    <li class="item1"><a href="#">
                        <img src="images/arrow.png" alt=""><strong>Description</strong></a>
                        <ul>
                            <li class="subitem1" style="background-color: #fff; padding: 10px 0 10px 0;">
                                <asp:Label ID="lblProDesc" runat="server"></asp:Label>
                            </li>
                        </ul>
                    </li>
                    <li class="item2"><a href="#">
                        <img src="images/arrow.png" alt=""><strong>Fitment</strong></a>
                        <ul>
                            <li class="subitem2" style="background-color: #fff; padding: 10px 0 10px 0;">
                                <asp:Label ID="lblFitment" runat="server"></asp:Label><br />
                                <asp:Label ID="lblManufacturer" runat="server"></asp:Label><br />
                                <%# Eval("review_title") %>
                                <asp:Label ID="lblModel" runat="server"></asp:Label>
                            </li>

                        </ul>
                    </li>
                    <li class="item3"><a href="#">
                        <img src="images/arrow.png" alt=""><strong>Warranty</strong>  </a>

                        &nbsp;&nbsp;<ul>
                            <li class="subitem2" style="background-color: #fff; padding: 10px 0 10px 0;">
                                <asp:Label ID="lblWarranty" runat="server"></asp:Label>
                            </li>

                        </ul>

                    </li>

                    <li class="item4"><a href="#">
                        <img src="images/arrow.png" alt=""><strong>Returns</strong>  </a>

                        &nbsp;&nbsp;<ul>
                            <li class="subitem2" style="background-color: #fff; padding: 10px 0 10px 0;">
                                <asp:Label ID="lblReturns" runat="server"></asp:Label>
                            </li>

                        </ul>

                    </li>

                    <li class="item5"><a href="#">
                        <img src="images/arrow.png" alt=""><strong>Care</strong>  </a>

                        &nbsp;&nbsp;<ul>
                            <li class="subitem2" style="background-color: #fff; padding: 10px 0 10px 0;">
                                <asp:Label ID="lblCare" runat="server"></asp:Label>
                            </li>

                        </ul>

                    </li>


                    <li class="item7"><a href="#">
                        <img src="images/arrow.png" alt=""><strong>  Product Review</strong>  </a>

                        &nbsp;&nbsp;<ul>
                            <li class="subitem2" style="background-color: #fff; padding-top: 7px;">
                                <asp:DataList ID="DataList2" runat="server" Width="100%" OnItemDataBound="DataList2_ItemDataBound">
                                    <ItemTemplate>
                                        <div style="padding-bottom: 0px;">
                                            <asp:Label ID="lblRating" runat="server" Text='<%# Eval("rating") %>' Visible="false"></asp:Label>
                                            <telerik:RadRating ID="RadRating3" runat="server" DbValue="0" ReadOnly="true">
                                                <Items>
                                                    <telerik:RadRatingItem Value="1" ToolTip="Bad"></telerik:RadRatingItem>
                                                    <telerik:RadRatingItem Value="2" ToolTip="Poor"></telerik:RadRatingItem>
                                                    <telerik:RadRatingItem Value="3" ToolTip="Regular"></telerik:RadRatingItem>
                                                    <telerik:RadRatingItem Value="4" ToolTip="Good"></telerik:RadRatingItem>
                                                    <telerik:RadRatingItem Value="5" ToolTip="Gorgeues"></telerik:RadRatingItem>
                                                </Items>
                                            </telerik:RadRating>
                                        </div>

                                        <div style="padding-left: 5px;">
                                            <span style="font-weight: bold;">
                                                <%# Eval("review_title") %></span>
                                        </div>

                                        <div style="padding-left: 5px;">
                                            <%# Eval("Review") %>
                                        </div>
                                        <div style="padding-left: 5px; padding-bottom: 12px;">
                                            <span style="font-style: italic;"><%# Eval("Username") %>, <%# Eval("billCity") %>
                                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("added_date") %>'></asp:Label></span>
                                        </div>
                                        <div>
                                        </div>
                                        <div>
                                            <hr style="width: 100%; margin-bottom: 10px;" />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>

                            </li>

                        </ul>

                    </li>




                    <%# Eval("Review") %>
                </ul>
            </div>



        </div>
    </div>



    <div class="container">

        <div class="row">

            <div class="related-products">
                <div class="related_red">
                    <h2>Related Products</h2>
                </div>
            </div>



            <div class="">
                <asp:Repeater ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound1" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>


                        <div class="col-md-3 ">
                            <div class="product-main simpleCart_shelfItem">
                                <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_percentage_amt") %>">
                                    <asp:Image ID="img1" runat="server" BorderWidth="0" CssClass="img-responsive zoom-img" /></a>



                                <div class="product-bottom">
                                    <h3><a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_percentage_amt") %>"><%# Eval("product_name") %></a></h3>
                                    <p>
                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price", "{0:n0}") %>'></asp:Label><br />
                                        <asp:Label ID="lblDisPrice" runat="server" Text='<%# Eval("discount_percentage_amt", "{0:n0}") %>'></asp:Label>
                                    </p>

                                    <%-- <button type="button" class="btn btn-default btn-circle"><i class="glyphicon glyphicon-shopping-cart"></i></button>
                            <button type="button" class="btn btn-default btn-circle"><i class="glyphicon glyphicon-heart"></i></button>--%>

                                    <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("discount_percentage_amt") %>" class="btn btn-default btn-circle" title="Add to Cart" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-shopping-cart"></i></a>&nbsp;
                                     <asp:LinkButton ID="lnkBtnWishList" runat="server" title="Add to Wishlist" data-toggle="tooltip" CssClass="btn btn-default btn-circle" CommandArgument='<%# Eval("pid") %>' CommandName="AddtoWishlist"><i class="glyphicon glyphicon-heart"></i></asp:LinkButton>



                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


                <div class="clearfix"></div>
            </div>

        </div>

    </div>



</asp:Content>

