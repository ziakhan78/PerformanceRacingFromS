<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="DealersOrders.aspx.cs" Inherits="DealersOrders" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/uc_inner_banner.ascx" TagPrefix="uc1" TagName="uc_inner_banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
                    <h2>Dealers - Orders</h2>
                </div>

                <ul class="breadcrumb">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active">Dealers Orders</li>
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
                        <li class="selected"><a href="DealersOrders.aspx" class="selected">Orders</a></li>
                    </ul>                    
                    </div>
               


            </div>

            <div class="col-lg-9 col-md-9 col-sm-12 ">

               <div class="">
        <div class="" style="margin-bottom:30px;" >
             <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

                <ContentTemplate>

                    <telerik:RadGrid ID="RadGrid1" runat="server"
                        AllowPaging="True" AllowSorting="True" DataSourceID="dsOrders" GridLines="None"
                        Skin="Bootstrap" PageSize="25" CssClass="mainlinks">
                        <HeaderContextMenu EnableAutoScroll="True">
                        </HeaderContextMenu>
                        <HeaderStyle Font-Bold="True" />
                        <%-- <AlternatingItemStyle BackColor="#E9E0ED" />
                    <PagerStyle BackColor="#E9E0ED" />--%>
                        <MasterTableView AutoGenerateColumns="False" CellSpacing="-1" DataSourceID="dsOrders">
                            <RowIndicatorColumn>
                                
                            </RowIndicatorColumn>

                            <ExpandCollapseColumn Created="True">
                                
                            </ExpandCollapseColumn>
                            <CommandItemSettings ExportToPdfText="Export to Pdf" />
                            <Columns>

                                <telerik:GridTemplateColumn HeaderText="Sr.">
                                    <ItemTemplate>
                                        <%# Container.DataSetIndex +1 %>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Order No." SortExpression="OrderNo">
                                    <ItemTemplate>
                                     
                                 <a href="javascript:void(0)" onclick="MM_openBrWindow('popup/dealer_orders_details.aspx?CartID=<%# Eval("Cart_Id") %>&DealerID=<%# Eval("id") %>','01111','width=800, height=800')"><%# Eval("OrderNo") %></a>
                                       
                                    </ItemTemplate>
                                    <HeaderStyle Font-Underline="true"  />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn DataField="CreatedOn" AllowFiltering="false" HeaderText="Order Date" SortExpression="CreatedOn" UniqueName="CreatedOn" DataFormatString="{0:dd-MM-yyyy}">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                    <HeaderStyle HorizontalAlign="Left" Font-Underline="true"  />
                                    <ItemStyle HorizontalAlign="Left" />
                                </telerik:GridBoundColumn>

                                <%--   <telerik:GridBoundColumn DataField="CompanyName" AllowFiltering="false" HeaderText="Company Name" SortExpression="CompanyName" UniqueName="CompanyName">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Underline="true"  />
                                        <ItemStyle HorizontalAlign="Left"  />
                                    </telerik:GridBoundColumn>--%>

                                <telerik:GridTemplateColumn HeaderText="Dealer" SortExpression="CompanyName">
                                    <ItemTemplate>
                                        <a href="javascript:void(0)" onclick="MM_openBrWindow('admin/view_dealer_details.aspx?id=<%# Eval("id") %>','01111','width=650, height=550')"><%# Eval("CompanyName") %></a>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </telerik:GridTemplateColumn>


                                <telerik:GridTemplateColumn HeaderText="Order By" SortExpression="Name">
                                    <ItemTemplate>
                                        <a href="javascript:void(0)" onclick="MM_openBrWindow('admin/view_dealer_contact_details.aspx?id=<%# Eval("id") %>','01111','width=650, height=250')"><%# Eval("CompanyName") %></a>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </telerik:GridTemplateColumn>

                                <%--                                    <telerik:GridTemplateColumn HeaderText="Order By" SortExpression="Name">
                                        <ItemTemplate>
                                            <a href='DealerOrderDetails.aspx?CartID=<%# Eval("Cart_Id") %>&DealerID=<%# Eval("Dealer_Id") %>'><%# Eval("Name")%></a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Font-Underline="true"  />
                                        <ItemStyle HorizontalAlign="Left"  />
                                    </telerik:GridTemplateColumn>--%>




                                <telerik:GridTemplateColumn HeaderText="Email" SortExpression="email">
                                    <ItemTemplate>
                                        <a href='mailto:<%# Eval("EmailId") %>'><%# Eval("EmailId") %></a>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn DataField="Mobile" AllowFiltering="false" HeaderText="Mobile" SortExpression="Mobile" UniqueName="Mobile">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                    <HeaderStyle HorizontalAlign="Left" Font-Underline="true"  />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="City" AllowFiltering="false" HeaderText="City" SortExpression="City" UniqueName="City">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                    <HeaderStyle HorizontalAlign="Left" Font-Underline="true" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="Status" HeaderText="Status" AllowFiltering="false" HeaderStyle-Font-Underline="true"
                                    SortExpression="Status" UniqueName="Status">
                                    <HeaderStyle Font-Underline="True" />
                                </telerik:GridBoundColumn>

                                <%--     <telerik:GridTemplateColumn HeaderText="Status" SortExpression="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Cart_Id") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' Visible="false"></asp:Label>

                                            <asp:DropDownList ID="chkActive" runat="server" AutoPostBack="true" CssClass="txt" OnSelectedIndexChanged="chkActive_SelectedIndexChanged" >
                                                <asp:ListItem>Pending</asp:ListItem>                                               
                                                <asp:ListItem>Processing</asp:ListItem>
                                                <asp:ListItem>Completed</asp:ListItem>                                                
                                            </asp:DropDownList>

                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="60px"></ItemStyle>
                                    </telerik:GridTemplateColumn>--%>




                                <telerik:GridTemplateColumn HeaderText="Total Amounts" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="TotalAmount">
                                    <ItemTemplate>
                                        &#8377;&nbsp;<%# Eval("TotalAmount", "{0:N0}")%>
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top"  />
                                    <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Font-Underline="true" />
                                </telerik:GridTemplateColumn>





                            </Columns>
                            <EditFormSettings>
                                <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                </EditColumn>
                            </EditFormSettings>
                            <PagerStyle PageSizeControlType="RadComboBox" />
                        </MasterTableView>
                        <ItemStyle VerticalAlign="Top" />
                        <PagerStyle PageSizeControlType="RadComboBox" />
                        <FilterMenu EnableImageSprites="False">
                        </FilterMenu>

                    </telerik:RadGrid>

                   <%-- <asp:SqlDataSource ID="dsOrders" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                        SelectCommand="SELECT * from View_DealersOrder order by CreatedOn desc"></asp:SqlDataSource>--%>

                      <asp:SqlDataSource ID="dsOrders" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                        SelectCommand="SELECT * FROM [View_DealersOrder] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="did" Type="Object" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </ContentTemplate>


            </asp:UpdatePanel>
              </div>

        <div class="clearfix"></div>
    </div>

            </div>



        </div>

        <div class="clearfix"></div>
    </div>

</asp:Content>


