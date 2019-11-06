<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="DealersAccounts.aspx.cs" Inherits="DealersAccounts" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/JavaScript">
<!--
    function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
    }
    //-->
    </script>
    <style>
        .txt {
            font-family: Verdana;
            font-size: 11px;
            color: #000000;
            padding: 5px;
        }

        .style7 {
            width: 150px;
            vertical-align: middle;
            text-align: right;
        }

        .style8 {
        }

        .style9 {
            vertical-align: middle;
        }

        .style10 {
            text-align: left;
        }

        .style11 {
            text-align: left;
            vertical-align: middle;
        }

        .style12 {
            color: #FF0000;
        }

        .validation {
            color: #FF0000;
        }
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
                    <h2>Dealers - Account</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active">Dealers Account</li>
                </ul>


            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">

            <div class="col-lg-3 col-md-3 col-sm-12" style="height: 250px;">
                <div class="red_strip stydhy">Dealers</div>
                <div class="gray_box_01">
                    <ul class="cate_drop">
                        <li><a href="DealersProfile.aspx">Profile</a></li>
                        <li class="selected"><a href="DealersAccounts.aspx">Accounts</a></li>                     
                        <li><a href="DealersOrders.aspx">Orders</a></li>
                    </ul>
                </div>

            </div>

            <div class="col-lg-9 col-md-9 col-sm-12 ">

                    <div class="" style="margin-bottom:30px;" >
                    <div>
                        <asp:Label ID="lblCompany" runat="server" Text=""></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                    </div>

                     <div>
                        <asp:Label ID="lblCreditFacility" runat="server" Text=""></asp:Label>
                    </div>

                    <div>
                        <asp:Label ID="lblCreditLimit" runat="server" Text=""></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblCreditPeriod" runat="server" Text=""></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblDealerBalanceAmt" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="clearfix"></div>
                </div>

            </div>



        </div>

        <div class="clearfix"></div>
    </div>

</asp:Content>


