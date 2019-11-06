<%@ Page Language="C#" AutoEventWireup="true" CodeFile="privacy_policy.aspx.cs" Inherits="admin_privacy_policy" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>:: Tronica Privacy Policy ::</title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }

        .auto-style3 {
            text-align: left;
        }

        #popup_holder
{
	width:825px;
	
	/* IE10 Consumer Preview */ 
background-image: -ms-linear-gradient(top left, #B9E5FB 0%, #DCF2FD 100%);

/* Mozilla Firefox */ 
background-image: -moz-linear-gradient(top left, #B9E5FB 0%, #DCF2FD 100%);

/* Opera */ 
background-image: -o-linear-gradient(top left, #B9E5FB 0%, #DCF2FD 100%);

/* Webkit (Safari/Chrome 10) */ 
background-image: -webkit-gradient(linear, left top, right bottom, color-stop(0, #B9E5FB), color-stop(1, #DCF2FD));

/* Webkit (Chrome 11+) */ 
background-image: -webkit-linear-gradient(top left, #B9E5FB 0%, #DCF2FD 100%);

/* W3C Markup, IE10 Release Preview */ 
background-image: linear-gradient(to bottom right, #B9E5FB 0%, #DCF2FD 100%);
}
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div id="popup_holder" style="overflow-y:auto;" >


        <table border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
            <tr><td  colspan="4"><img src="../admin_icons/popup_header_1.jpg" style="border:none" /></td></tr>
            <tr>
                <td colspan="4" class="header_title">Privacy Policy</td>
            </tr>

            <tr>
                <td colspan="4" >Privacy Policy Text Comes here</td>
            </tr>


            <tr>
                <td colspan="4" align="center"><a href="javascript:self.close()">
                    <img alt="" border="0" src="../admin_icons/close.jpg" /></a></td>
            </tr>

        </table>



       </div>
    </form>
</body>
</html>

