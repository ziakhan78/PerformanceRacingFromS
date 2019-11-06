<%@ Page Title="Bargain Basement" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="BargainBasement.aspx.cs" Inherits="BargainBasement" %>

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
            font-weight: normal;
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

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div class="col-md-12">

                        <div class="row">
                            <div class="product-one">

                                <telerik:RadListView runat="server" ID="RadListView1" AllowPaging="True" DataKeyNames="pid" PageSize="12" OnItemDataBound="DataList1_ItemDataBound" OnPageIndexChanged="RadListView1_PageIndexChanged">

                                    <ItemTemplate>
                                        <div class="col-md-3 col-sm-6 product-left" style="padding-bottom: 25px;">
                                            <div class="product-main simpleCart_shelfItem">

                                                <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("selling_price") %>" class="mask">
                                                    <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                    <asp:Image ID="img1" runat="server" Style="height: auto; width: 270px;" CssClass="img-responsive zoom-img" /></a>
                                                <div class="product-bottom">
                                                    <h3 style="height: 30px;"><%# Eval("product_name") %></h3>
                                                    <p>
                                                        <strong>
                                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblDisPrice" runat="server" Text='<%# Eval("selling_price", "{0:n0}") %>'></asp:Label>
                                                        </strong>
                                                    </p>
                                                    <a href="product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>&dis_price=<%# Eval("selling_price") %>" class="btn btn-default btn-circle" title="Add to Cart" data-toggle="tooltip" data-original-title="Default tooltip"><i class="glyphicon glyphicon-shopping-cart"></i></a>
                                                    &nbsp;<asp:LinkButton ID="lnkBtnWishList" runat="server" title="Add to Wishlist" data-toggle="tooltip" CssClass="btn btn-default btn-circle" CommandArgument='<%# Eval("pid") %>' CommandName="AddtoWishlist"><i class="fa fa-heart"></i></asp:LinkButton>
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
                                <asp:Label ID="lblMsg" runat="server" CssClass="txt_validation"></asp:Label>  </div>

                           
                        </div>
                    </div>
                  

                </ContentTemplate>
            </asp:UpdatePanel>



        </div>
        <div class="clearfix"></div>

    </div>

</asp:Content>

