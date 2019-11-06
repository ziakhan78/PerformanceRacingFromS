<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCustomerDetails.aspx.cs" Inherits="Admin_ViewCustomerDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Performance Racing | Customer's Details</title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <link href="../css/xl.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            width: 619px;
        }

        .style2 {
            width: 120px;
        }

        .style3 {
            width: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="txt1">

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id"
                DataSourceID="dsCustomerDe" Width="630px">

                <ItemTemplate>
                    <table class="style1" align="right" class="txt">

                            <tr>
                    <td colspan="3" class="header_title">View Customer Details</td>
                </tr>


                        <tr>
                            <td colspan="3">
                                <asp:Panel ID="BillPanel" runat="server" GroupingText="Billing Address">
                                    <table>
                                        <tr>
                                            <td align="right" class="style2">Name</td>
                                            <td class="style3">:</td>
                                            <td>                                                
                                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("billFName") %>' />
                                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("billLName") %>' />
                                            </td>
                                        </tr>
                                       <%-- <tr>
                                            <td align="right" class="style2">Company Name</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="CompanyNameLabel" runat="server"
                                                    Text='<%# Bind("CompanyName") %>' />
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td align="right" class="style2">Address Line1</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillAddress1Label" runat="server"
                                                    Text='<%# Bind("billAddress1") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Address Line2</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillAddress2Label" runat="server"
                                                    Text='<%# Bind("billAddress2") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">City</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillCityLabel" runat="server" Text='<%# Bind("billCity") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Zip</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillZipLabel" runat="server" Text='<%# Bind("billZip") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Phone Number </td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillPhone1Label" runat="server"
                                                    Text='<%# Bind("billPhoneCC") %>' />
                                                -<asp:Label ID="BillPhone2Label" runat="server"
                                                    Text='<%# Bind("billPhoneAC") %>' />
                                                -<asp:Label ID="BillPhone3Label" runat="server"
                                                    Text='<%# Bind("billPhone") %>' />
                                            </td>
                                        </tr>
                                    <%--    <tr>
                                            <td align="right" class="style2">Phone Number 2</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillSecondPhone1Label" runat="server"
                                                    Text='<%# Bind("BillSecondPhone1") %>' />
                                                -<asp:Label ID="BillSecondPhone2Label" runat="server"
                                                    Text='<%# Bind("BillSecondPhone2") %>' />
                                                -<asp:Label ID="BillSecondPhone3Label" runat="server"
                                                    Text='<%# Bind("BillSecondPhone3") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Fax Number</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillFax1Label" runat="server" Text='<%# Bind("BillFax1") %>' />
                                                -<asp:Label ID="BillFax2Label" runat="server" Text='<%# Bind("BillFax2") %>' />
                                                -<asp:Label ID="BillFax3Label" runat="server" Text='<%# Bind("BillFax3") %>' />
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td align="right" class="style2">Mobile Number</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillMobile1Label" runat="server"
                                                    Text='<%# Bind("billMobileCC") %>' />
                                                -<asp:Label ID="BillMobile2Label" runat="server"
                                                    Text='<%# Bind("billMobile") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">State</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillStateLabel" runat="server" Text='<%# Bind("state_name") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Country</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="BillCountryLabel" runat="server"
                                                    Text='<%# Bind("country_name") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Email</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("email") %>' />
                                            </td>
                                        </tr>
                                       
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>



                        <tr>
                            <td colspan="3">
                                <asp:Panel ID="Panel1" runat="server" GroupingText="Shipping Address">
                                    <table>

                                       <%-- <tr>
                                            <td align="right" class="style2">Company Name</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="SCompanyNameLabel" runat="server"
                                                    Text='<%# Bind("SCompanyName") %>' />
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td align="right" class="style2">Name</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="sFNameLabel" runat="server" Text='<%# Bind("sFName") %>' />
                                                <asp:Label ID="sLNameLabel" runat="server" Text='<%# Bind("sLName") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Address Line 1</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="sAddress1Label" runat="server" Text='<%# Bind("sAddress1") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Address Line 2</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="sAddress2Label" runat="server" Text='<%# Bind("sAddress2") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">City</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="sCityLabel" runat="server" Text='<%# Bind("sCity") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Zip</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="sZipLabel" runat="server" Text='<%# Bind("sZip") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Phone Number</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="sPhone1Label" runat="server" Text='<%# Bind("sPhoneCc") %>' />
                                                -<asp:Label ID="sPhone2Label" runat="server" Text='<%# Bind("sPhoneAc") %>' />
                                                -<asp:Label ID="sPhone3Label" runat="server" Text='<%# Bind("sPhone") %>' />
                                            </td>
                                        </tr>
                               
                                      <%--  <tr>
                                            <td align="right" class="style2">State</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="sStateLabel" runat="server" Text='<%# Bind("sState") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Country</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:Label ID="sCountryLabel" runat="server" Text='<%# Bind("sCountry") %>' />
                                            </td>
                                        </tr>--%>
                                    <%--    <tr>
                                            <td align="right" class="style2">Status</td>
                                            <td class="style3">:</td>
                                            <td>
                                                <asp:CheckBox ID="StatusCheckBox" runat="server"
                                                    Checked='<%# Bind("Status") %>' Enabled="false" />
                                            </td>
                                        </tr>--%>
                                      

                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>


                        
                <tr>
                    <td colspan="3" align="center"><a href="javascript:self.close()" class="btn">Close</a></td>
                </tr>


                    </table>
                    <br />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="dsCustomerDe" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                SelectCommand="SELECT * FROM View_Customers where status='1' and id = @id order by billFName, billLName asc">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="custID"
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
