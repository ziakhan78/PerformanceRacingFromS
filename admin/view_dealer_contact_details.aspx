<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_dealer_contact_details.aspx.cs" Inherits="admin_view_dealer_contact_details" %>

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

        <div style="overflow: auto; width: 650px;">


            <table style="width: 630px;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">


                <tr>
                    <td colspan="2" class="header_title">View Dealer Contact Details</td>
                </tr>



                <tr>
                    <td class="auto-style2">Company Name :</td>
                    <td>
                        <asp:Label ID="lblCompany" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Name :</td>
                    <td>
                        <asp:Label ID="lblName" runat="server"></asp:Label></td>
                </tr>   
                
                <tr>
                    <td class="auto-style2">Designation :</td>
                    <td>
                        <asp:Label ID="lblDesignation" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Mobile No. :</td>
                    <td>
                        <asp:Label ID="lblMobile" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style2">Email-Id :</td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                </tr>

                  <tr>
                    <td class="auto-style2">Phone :</td>
                    <td>
                        <asp:Label ID="lblPhone" runat="server"></asp:Label></td>
                </tr>

                  <tr>
                    <td class="auto-style2">Phone- Ext. No. :</td>
                    <td>
                        <asp:Label ID="lblPhoneExt" runat="server"></asp:Label></td>
                </tr>




                <tr>
                    <td colspan="2" align="center"><a href="javascript:self.close()" class="btn">Close</a></td>
                </tr>

            </table>



        </div>
    </form>
</body>
</html>

