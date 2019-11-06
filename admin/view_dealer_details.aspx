﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_dealer_details.aspx.cs" Inherits="admin_view_dealer_details" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>:: Performance Racing | Admin ::</title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <link href="../css/small_984.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="../css/medium_984_1280.css" rel="stylesheet" type="text/css" media="all and (max-width:1280px) and (min-width:984px)" />
    <link href="../css/large_1280.css" rel="stylesheet" type="text/css" media="all and (max-width:1920px) and (min-width:1280px)" />
    <!-- Width constraint for Tablet -->

    <script type="text/javascript">
        function reloadPage() {
            window.location.reload()
        }
    </script>


    <style type="text/css">
        .auto-style2 {
            text-align: right;
            width: 150px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div style="overflow: auto; height: 550px; width: 650px;">


            <table style="width: 630px;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">


                <tr>
                    <td colspan="2" class="header_title">View Dealer Details</td>
                </tr>



                <tr>
                    <td class="auto-style2">Company Name :</td>
                    <td>
                        <asp:Label ID="lblCompany" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Address :</td>
                    <td>
                        <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                </tr>   
                
                <tr>
                    <td class="auto-style2">Landmark :</td>
                    <td>
                        <asp:Label ID="lblLandmark" runat="server"></asp:Label></td>
                </tr>

                  <tr>
                    <td class="auto-style2">Pin :</td>
                    <td>
                        <asp:Label ID="lblPin" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">City :</td>
                    <td>
                        <asp:Label ID="lblCity" runat="server"></asp:Label></td>
                </tr>
                         

              
                <tr>
                    <td class="auto-style2">State :</td>
                    <td>
                        <asp:Label ID="lblState" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Mobile No.1 :</td>
                    <td>
                        <asp:Label ID="lblmob1" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style2">Mobile No.2 :</td>
                    <td>
                        <asp:Label ID="lblMob2" runat="server"></asp:Label></td>
                </tr>







                <tr>
                    <td class="auto-style2">Phone 1 :</td>
                    <td>
                        <asp:Label ID="lblPhone1" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style2">Phone 2 :</td>
                    <td>
                        <asp:Label ID="lblPhone2" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Fax :</td>
                    <td>
                        <asp:Label ID="lblFax" runat="server"></asp:Label></td>
                </tr>

                

                 <tr>
                    <td class="auto-style2">Working Days :</td>
                    <td>
                        <asp:Label ID="lblWorkingDays" runat="server"></asp:Label></td>
                </tr>

                   <tr>
                    <td class="auto-style2">Working Time :</td>
                    <td>
                        <asp:Label ID="lblWorkingTime" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Closed On :</td>
                    <td>
                        <asp:Label ID="lblClosedOn" runat="server"></asp:Label></td>
                </tr>




                <tr>
                    <td class="auto-style2">Vat No. :</td>
                    <td>
                        <asp:Label ID="lblVatNo" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Pan No. :</td>
                    <td>
                        <asp:Label ID="lblPanNo" runat="server"></asp:Label></td>
                </tr>



                <tr>
                    <td class="auto-style2">Website :
                    </td>
                    <td>
                        <asp:Label ID="lblWebsite" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Brand :
                    </td>
                    <td>
                        <asp:Label ID="lblBrand" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Email-Id :</td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                </tr>

                  <tr>
                    <td class="auto-style2">Credit Facility :</td>
                    <td>
                        <asp:Label ID="lblCreditFacility" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Credit Period :</td>
                    <td>
                        <asp:Label ID="lblCreditPeriod" runat="server"></asp:Label></td>
                </tr>


                <tr>
                    <td class="auto-style2">Credit Limit :</td>
                    <td>
                        <asp:Label ID="lblCreditLimit" runat="server"></asp:Label></td>
                </tr>




                <tr>
                    <td colspan="2" align="center"><a href="javascript:self.close()" class="btn">Close</a></td>
                </tr>

            </table>



        </div>
    </form>
</body>
</html>

