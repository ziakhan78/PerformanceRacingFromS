<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="DealersProfile.aspx.cs" Inherits="DealersProfile" %>

<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                    <h2>Dealers - Profile</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active">Dealers Profile</li>
                </ul>


            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">

            <div class="col-lg-3 col-md-3 col-sm-12">
                <div class="red_strip stydhy">Dealers</div>
                <div class="gray_box_01">
                    <ul class="cate_drop">
                        <li><a href="DealersProfile.aspx">Profile</a></li>
                        <li><a href="DealersAccounts.aspx">Accounts</a></li>

                        <li><a href="DealersOrders.aspx">Orders</a></li>
                    </ul>
                </div>



            </div>

            <div class="col-lg-9 col-md-9 col-sm-12 ">

                <div>
                    <div class="" style="margin-bottom: 30px;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

                            <ContentTemplate>

                                <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAdd">
                                    <table class="txt" style="width: 100%;" align="center" cellpadding="6" cellspacing="6">
                                        

                                        <tr>
                                            <td align="right" class="style7">Dealers :</td>
                                            <td class="style10">
                                                <asp:Label ID="lblDealer" runat="server"></asp:Label>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td align="right" class="style7">
                                                <span class="style12">*</span>
                                                First Name :</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txtFName" runat="server" Width="200px" ValidationGroup="P"
                                                    CssClass="txtBox"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVFname" runat="server"
                                                    ControlToValidate="txtFName" Display="Dynamic" ErrorMessage="Can't left blank !"
                                                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="right" class="style7"><span class="style12">*</span> Last Name :</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txtLName" runat="server" Width="200px" ValidationGroup="P"
                                                    CssClass="txtBox"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVLastname" runat="server" ControlToValidate="txtLName" CssClass="validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr id="trBCompName" runat="server">
                                            <td align="right" class="style7">Designation :</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txtDesignation" runat="server" Width="350px" ValidationGroup="P"
                                                    CssClass="txtBox"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="right" valign="top" class="style7">
                                                <span class="style12">*</span>
                                                Mobile No. :</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txtMobileCC" runat="server" CssClass="txtBox" Width="35px"
                                                    MaxLength="3"></asp:TextBox>
                                                -
                <asp:TextBox ID="txtMobile" runat="server" CssClass="txtBox"
                    Width="90px" MaxLength="10"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVmob" runat="server"
                                                    ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Can't left blank !"
                                                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="style7" align="right" valign="top">
                                                <span class="style12">*</span>
                                                Email :</td>
                                            <td class="style11">
                                                <asp:TextBox ID="txtEmailId" runat="server" Width="300px" ValidationGroup="P"
                                                    CssClass="txtBox"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVEmail" runat="server"
                                                    ControlToValidate="txtEmailId" Display="Dynamic" ErrorMessage="Can't left blank !"
                                                    ValidationGroup="C" CssClass="validation"></asp:RequiredFieldValidator>
                                                &nbsp;<asp:RegularExpressionValidator ID="REVEmail" runat="server"
                                                    ControlToValidate="txtEmailId" Display="Dynamic"
                                                    ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ValidationGroup="C" CssClass="validation"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td align="right" valign="top" class="style7">&nbsp;Phone No. :</td>
                                            <td class="style10">
                                                <asp:TextBox ID="txtPhoneCC" runat="server" CssClass="txtBox" Width="35px"
                                                    MaxLength="3"></asp:TextBox>
                                                -
                <asp:TextBox ID="txtPhoneAC" runat="server" CssClass="txtBox" Width="40px"
                    MaxLength="4"></asp:TextBox>
                                                -
                <asp:TextBox ID="txtPhone" runat="server" CssClass="txtBox" Width="90px"
                    MaxLength="8"></asp:TextBox>
                                                &nbsp;Ext. No.
                                                <asp:TextBox ID="txtExtNo" runat="server" CssClass="txtBox" Width="40px" MaxLength="4"></asp:TextBox>
                                            </td>
                                        </tr>




                                        <tr>
                                            <td class="style7">&nbsp;</td>
                                            <td class="style11">
                                                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-danger" Text="Save & Continue"
                                                    ValidationGroup="C" OnClick="btnAdd_Click" />
                                                <asp:SqlDataSource ID="DSSuppliers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Dealers_tbl] ORDER BY [CompanyName]"></asp:SqlDataSource>
                                                <br />
                                            </td>
                                        </tr>

                                    </table>
                                </asp:Panel>

                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnAdd" />
                            </Triggers>

                        </asp:UpdatePanel>
                    </div>

                    <div class="clearfix"></div>
                </div>

            </div>



        </div>

        <div class="clearfix"></div>
    </div>

</asp:Content>


