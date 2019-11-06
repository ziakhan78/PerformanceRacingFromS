<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="bargain_basement.aspx.cs" Inherits="bargain_basement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!--dropdown-->
    <script src="js/jquery.easydropdown.js"></script>
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


    <!--dropdown-->
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



    <style>
        .rbl input[type="radio"], input[type="checkbox"] {
            font-family: 'Open Sans', sans-serif;
            font-weight:normal;
            font-size: 14px;
            color: #666666;
        }


        input[type=checkbox] {
            display: none;           
        }
            /* to hide the checkbox itself */
            input[type=checkbox] + label:before {
                font-family: FontAwesome;
                display: inline-block;
            }

            input[type=checkbox] + label:before {
                content: "\f096";

            }
            /* unchecked icon */
            input[type=checkbox] + label:before {
                letter-spacing: 10px;

            }
            /* space between checkbox and label */

            input[type=checkbox]:checked + label:before {
                content: "\f046";

            }
            /* checked icon */
            input[type=checkbox]:checked + label:before {
                letter-spacing: 5px;

            }
        /* allow space for check mark */
    </style>

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
                    <h2>Bargain Basment</h2>
                </div>

               <ul class="breadcrumb">
                  <li><a href="default.aspx">Home</a></li>                
                   
                    <li class="active">Bargain Basment</li>
                </ul>

            </div>
        </div>
    </div>



    <div class="container">



        <div class="row">
            <div class="col-md-3 single-right">

            

                <div class="red_strip stydhy"><span class="glyphicon glyphicon-align-justify">&nbsp;</span>Search Options</div>

                <div class="w_sidebar">
                    <section class="sky-form">
                        <h4>Manufacturer</h4>
                        <div class="row1 scroll-pane">
                            <div class="col col-4">
                                <%--<label class="checkbox">
                                    <input type="checkbox" name="checkbox" checked=""><i></i>All Accessories</label>--%>
                            </div>
                            <div class="col col-4">

                                <asp:CheckBoxList ID="chkManufacturer" runat="server" DataSourceID="dsManufacturers" DataTextField="manufacturer_name" DataValueField="id">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="dsManufacturers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [manufacturer_name] FROM [manufacturer_master_tbl] ORDER BY [manufacturer_name]"></asp:SqlDataSource>


                            </div>
                        </div>
                    </section>
                    <section class="sky-form">
                        <h4>Brand</h4>
                        <div class="row1 row2 scroll-pane">

                            <div class="col col-4">
                                <asp:CheckBoxList ID="chkBrands" runat="server" DataSourceID="dsBrands" DataTextField="brand_name" DataValueField="id">
                                </asp:CheckBoxList>
                                <asp:SqlDataSource ID="dsBrands" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [brand_name] FROM [brand_master_tbl] ORDER BY [brand_name]"></asp:SqlDataSource>

                            </div>
                        </div>
                    </section>


                </div>

            </div>




            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>


                    <div class="col-md-9">

                       <%-- <div class="bcrumb">
                            <ol class="breadcrumb">
                                <li><a href="default.aspx">Home</a></li>
                                <li><a href="products.aspx">Products</a></li>
                                <li>
                                    <asp:Label ID="lblCatName" runat="server"></asp:Label></li>
                            </ol>
                        </div>--%>

                        <div class="product-filter">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="display">
                                        <a href="products.aspx" class="active"><i class="fa fa-th" title="Grid View"></i></a>
                                        <a href="products_listview.aspx"><i class="fa fa-th-list" title="List View"></i></a>

                                    </div>
                                </div>
                              
                               
                               
                            </div>
                        </div>
                        <div>
                            <h4>
                        <asp:Label ID="lblSearchValue" runat="server"></asp:Label></h4>
                        </div>

                        <div class="row">
                            <div class="product-one">

                                <telerik:RadListView runat="server" ID="RadListView1" AllowPaging="True" DataKeyNames="id" PageSize="12" OnItemDataBound="DataList1_ItemDataBound" OnPageIndexChanged="RadListView1_PageIndexChanged">

                                    <ItemTemplate>
                                        <div class="col-md-3 col-sm-6 product-left" style="padding-bottom: 25px;">
                                            <div class="product-main simpleCart_shelfItem">                                             

                                                <a href="#" class="mask">
                                                    <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                    <asp:Image ID="img1" runat="server" Style="height: auto; width: 270px;" CssClass="img-responsive zoom-img" />
                                                    <%-- <img class="img-responsive zoom-img" src="images/31-tm_home_default.jpg" alt="" />--%></a>
                                                <div class="product-bottom">
                                                    <h3><%# Eval("product_name") %></h3>
                                                    <p>
                                                        <i class="fa fa-inr"></i>
                                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("purchase_price", "{0:n0}") %>'></asp:Label><br />
                                                        <asp:Label ID="lblDisPrice" runat="server" Text='<%# Eval("selling_price", "{0:n0}") %>'></asp:Label>
                                                    </p>
                                                    <a href="#" class="btn btn-default btn-circle" title="Add to Cart" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-shopping-cart"></i></a>&nbsp;                                    
                                            &nbsp;
                                             <asp:LinkButton ID="lnkBtnWishList" runat="server" title="Add to Wishlist" data-toggle="tooltip" CssClass="btn btn-default btn-circle" CommandArgument='<%# Eval("id") %>' CommandName="AddtoWishlist"><i class="glyphicon glyphicon-heart"></i></asp:LinkButton>

                                                </div>

                                            </div>
                                        </div>

                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <div class="RadListView RadListView_<%# Container.Skin %>">
                                            <div class="rlvEmpty">
                                                There are no items to be displayed.
                                            </div>
                                        </div>
                                    </EmptyDataTemplate>
                                    <LayoutTemplate>
                                        <div class="RadListView RadListViewFloated RadListView_<%# Container.Skin %>">
                                            <div class="rlvFloated rlvAutoScroll">
                                                <div id="itemPlaceholder" runat="server">
                                                </div>
                                            </div>
                                            <telerik:RadDataPager ID="RadDataPager1" runat="server" PageSize="12" CssClass="pager" Visible="<%# Container.PageCount != 1%>" Width="99%">
                                                <Fields>

                                                    <telerik:RadDataPagerButtonField FieldType="FirstPrev" />
                                                    <telerik:RadDataPagerButtonField FieldType="Numeric" />
                                                    <telerik:RadDataPagerButtonField FieldType="NextLast" />
                                                    <telerik:RadDataPagerPageSizeField Visible="false" />
                                                    <telerik:RadDataPagerGoToPageField Visible="true" />


                                                    <telerik:RadDataPagerTemplatePageField HorizontalPosition="RightFloat" Visible="true">
                                                        <PagerTemplate>
                                                            <div style="float: right; width: 100%;">
                                                                Items
                                                        <asp:Label runat="server" ID="CurrentPageLabel" Text="<%# Container.Owner.StartRowIndex+1%>" />
                                                                to
                                                        <asp:Label runat="server" ID="TotalPagesLabel" Text="<%# Container.Owner.TotalRowCount > (Container.Owner.StartRowIndex+Container.Owner.PageSize) ? Container.Owner.StartRowIndex+Container.Owner.PageSize : Container.Owner.TotalRowCount %>" />
                                                                of
                                                        <asp:Label runat="server" ID="TotalItemsLabel" Text="<%# Container.Owner.TotalRowCount%>" />
                                                                Total
                                                                <br />
                                                            </div>
                                                        </PagerTemplate>
                                                    </telerik:RadDataPagerTemplatePageField>
                                                </Fields>
                                            </telerik:RadDataPager>
                                        </div>
                                    </LayoutTemplate>
                                </telerik:RadListView>

                                <div class="clearfix"></div>
                                <asp:Label ID="lblMsg" runat="server" CssClass="txt_validation"></asp:Label>
                            </div>

                            <%-- <div class="product-one">


                        <div class="col-md-3 col-sm-6 product-left">
                            <div class="product-main simpleCart_shelfItem">
                                <a href="#" class="mask">
                                    <img class="img-responsive zoom-img" src="images/31-tm_home_default.jpg" alt="" /></a>
                                <div class="product-bottom">
                                    <h3>Sidi Vertigo Corsa Air Boots</h3>
                                    <p><i class="fa fa-inr"></i>1,950</p>
                                    <button type="button" class="btn btn-default btn-circle" title="Add to Cart" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-shopping-cart"></i></button>
                                    &nbsp;
                                    <button type="button" class="btn btn-default btn-circle" title="Wishlist" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-heart"></i></button>
                                </div>

                            </div>
                        </div>


                        <div class="clearfix"></div>
                    </div>--%>
                        </div>
                    </div>
                    <!--end col-md-9-->

                </ContentTemplate>
            </asp:UpdatePanel>



        </div>
        <div class="clearfix"></div>

    </div>

</asp:Content>

