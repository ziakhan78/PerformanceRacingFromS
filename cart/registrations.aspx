<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="registrations.aspx.cs" Inherits="cart_registrations" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .rbl input[type="radio"], input[type="checkbox"] {
            margin-left: 7px;
            margin-right: 2px;
        }
    </style>
    <link href="../css/programmer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <section class="">
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="block-title"><strong>Billing Address</strong> </div>
                        <div class="page_temp_contact">

                             
                            <div class="inputname">
                                <asp:RadioButtonList ID="rbtnCustType" runat="server" CssClass="rbl"
                                    RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnCustType_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Text="Individual" Value="Individual">Individual</asp:ListItem>
                                    <asp:ListItem Text="Company" Value="Company">Company</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>


                            <div id="compDiv" runat="server">

                                 <div class="textname">Comp Name <span>* </span></div>
                            <div class="inputname">
                                <asp:TextBox ID="txtCompName" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCompName" runat="server"
                                    ControlToValidate="txtCompName" Display="Dynamic" ErrorMessage="Can't left blank !"
                                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                            </div>

                                  <div class="textname">GSTIN No. <span>* </span></div>
                            <div class="inputname">
                                <asp:TextBox ID="txtGstin" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvGstin" runat="server"
                                    ControlToValidate="txtGstin" Display="Dynamic" ErrorMessage="Can't left blank !"
                                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                            </div>

                            </div>



                            <div class="textname">First Name <span>* </span></div>
                            <div class="inputname">
                                <asp:TextBox ID="txtFName" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVBFname" runat="server"
                                    ControlToValidate="txtFName" Display="Dynamic" ErrorMessage="Can't left blank !"
                                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                            </div>
                            <div class="textname">Last Name <span>* </span></div>
                            <div class="inputname">
                                <asp:TextBox ID="txtLName" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVBFname1" runat="server" ControlToValidate="txtLName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
                            </div>
                            <div class="textname">Gender <span>* </span></div>
                            <div class="inputname">
                                <asp:RadioButtonList ID="rbtnGender" runat="server" CssClass="rbl"
                                    RepeatDirection="Horizontal" AutoPostBack="True">
                                    <asp:ListItem Selected="True">Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="textname">Email <span>*</span></div>
                            <div class="inputname">
                                <asp:TextBox ID="txtEmailId" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVEmail" runat="server"
                                    ControlToValidate="txtEmailId" Display="Dynamic" ErrorMessage="Can't left blank !"
                                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CVEmail" runat="server"
                                    ControlToValidate="txtEmailId" ErrorMessage="EmailId Allready Exist."
                                    ValidationGroup="C"
                                    CssClass="txt_validation" Display="Dynamic" OnServerValidate="CVEmail_ServerValidate"></asp:CustomValidator>
                                <asp:RegularExpressionValidator ID="REVEmail" runat="server"
                                    ControlToValidate="txtEmailId" Display="Dynamic"
                                    ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="C" CssClass="txt_validation"></asp:RegularExpressionValidator>
                            </div>


                            <%--    <div class="textname">Address Type <span>* </span></div>
                    <div class="inputname">
                        <asp:RadioButtonList ID="rbtnSAddType" runat="server"
                            RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnSAddType_SelectedIndexChanged">
                            <asp:ListItem Selected="True">Home</asp:ListItem>
                            <asp:ListItem>Business</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>--%>

                            <div class="textname">Mobile <span>*</span></div>
                            <div class="inputname">
                                <asp:TextBox ID="txtMobileCc" runat="server" Width="40px"
                                    MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                &nbsp;-
                
                         <telerik:RadNumericTextBox ID="txtMobile" runat="server" MaxLength="10" Width="110px" CssClass="txtBox" Skin="Silk">
                             <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                         </telerik:RadNumericTextBox>

                                <asp:RequiredFieldValidator ID="RFVMobile" runat="server"
                                    ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Can't left blank !"
                                    ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>

                            </div>

                            <div class="textname">Phone No. </div>
                            <div class="inputname">
                                <asp:TextBox ID="txtPhoneCc" runat="server" Width="40px"
                                    MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                &nbsp;-
                <asp:TextBox ID="txtPhoneAc" runat="server" Width="50px"
                    MaxLength="4" CssClass="txtBox"></asp:TextBox>
                                &nbsp;-
                 <telerik:RadNumericTextBox ID="txtPhone" runat="server" MaxLength="8" Width="100px" CssClass="txtBox" Skin="Silk">
                     <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                 </telerik:RadNumericTextBox>
                            </div>




                            <div class="textname">Current Bike Owned</div>
                            <div class="inputname">
                                <asp:DropDownList ID="ddlBikes" runat="server" AppendDataBoundItems="True" CssClass="txtBox" DataSourceID="DSBikes" DataTextField="manufacturer_name" DataValueField="id">
                                    <asp:ListItem Text="Select" Value="Select">Select Bike</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="inputname">
                                <asp:TextBox ID="txtModel" runat="server" ValidationGroup="C" CssClass="txtBox" placeholder="Enter Bike Model"></asp:TextBox>
                            </div>
                            <div class="inputname">
                                <asp:DropDownList ID="DDLYears" runat="server" AutoPostBack="True" CssClass="txtBox" AppendDataBoundItems="true">
                                    <asp:ListItem Value="Select" Text="Select Year"></asp:ListItem>
                                </asp:DropDownList>
                            </div>






                            <div class="page_temp_contact">
                                <br>
                                <div class="textname">Address Line 1 <span>* </span></div>
                                <div class="inputname">
                                    <asp:TextBox ID="txtAddress1" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVBFname0" runat="server"
                                        ControlToValidate="txtAddress1" Display="Dynamic" ErrorMessage="Can't left blank !"
                                        ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                </div>

                                <div class="textname">Address Line 2</div>
                                <div class="inputname">
                                    <asp:TextBox ID="txtAddress2" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                </div>

                                <div class="textname">City <span>* </span></div>
                                <div class="inputname">
                                    <asp:TextBox ID="txtCity" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVBcity" runat="server"
                                        ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Can't left blank !"
                                        ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                </div>

                                <div class="textname">Zip Code <span>*</span></div>
                                <div class="inputname">
                                    <telerik:RadNumericTextBox ID="txtZip" runat="server" MaxLength="6" Width="100px" CssClass="txtBox" Skin="Silk">
                                        <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                    </telerik:RadNumericTextBox>
                                    <asp:RequiredFieldValidator ID="RFVBZip" runat="server"
                                        ControlToValidate="txtZip" Display="Dynamic" ErrorMessage="Can't left blank !"
                                        ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                </div>

                                <div class="textname">Country <span>*</span></div>
                                <div class="inputname">
                                    <asp:DropDownList ID="DDLCountry" runat="server" Height="30px" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="DDLCountry_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" InitialValue="Select"
                                        ControlToValidate="DDLCountry" Display="Dynamic" ErrorMessage="Select Country"
                                        ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                </div>

                                <div class="textname">State <span>* </span></div>
                                <div class="inputname">
                                    <asp:DropDownList ID="DDLState" runat="server" Height="30px" CssClass="txtBox" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select">Select</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvBstate" runat="server" InitialValue="0"
                                        ControlToValidate="DDLState" Display="Dynamic" ErrorMessage="Select State"
                                        ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <asp:CheckBox ID="chkShippAsBill" runat="server" CssClass="rbl" Text="Use billing information for your shipping information"
                            AutoPostBack="True" OnCheckedChanged="chkShippAsBill_CheckedChanged" />

                    </div>



                    <div class="col-lg-6 col-md-6 col-sm-12">

                        <div class="block-title"><strong>Shipping Address</strong> </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">





                            <div class="row">


                                <div class="page_temp_contact">

                                    <div class="textname">First Name <span>* </span></div>
                                    <div class="inputname">
                                        <asp:TextBox ID="txtSFname" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSFname" runat="server"
                                            ControlToValidate="txtSFname" Display="Dynamic" ErrorMessage="Can't left blank !"
                                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="textname">Last Name <span>* </span></div>
                                    <div class="inputname">
                                        <asp:TextBox ID="txtSLName" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSLname" runat="server" ControlToValidate="txtSLName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="textname">Mobile Number <span>*</span></div>
                                    <div class="inputname">
                                        <asp:TextBox ID="txtSMobileCc" runat="server"
                                            Width="40px" MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                        &nbsp;-
                  <telerik:RadNumericTextBox ID="txtSMobile" runat="server" MaxLength="10" Width="110px" CssClass="txtBox" Skin="Silk">
                      <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                  </telerik:RadNumericTextBox>
                                        <asp:RequiredFieldValidator ID="RFVSmobile" runat="server"
                                            ControlToValidate="txtSMobile" Display="Dynamic" ErrorMessage="Can't left blank !"
                                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>

                                    </div>



                                    <div class="textname">Phone Number </div>
                                    <div class="inputname">
                                        <asp:TextBox ID="txtSPhoneCc" runat="server" Width="40px"
                                            MaxLength="3" CssClass="txtBox"></asp:TextBox>
                                        &nbsp;-
                <asp:TextBox ID="txtSPhoneAc" runat="server" Width="50px"
                    MaxLength="4" CssClass="txtBox"></asp:TextBox>
                                        &nbsp;-
                <telerik:RadNumericTextBox ID="txtSPhone" runat="server" MaxLength="8" Width="100px" CssClass="txtBox" Skin="Silk">
                    <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                </telerik:RadNumericTextBox>
                                    </div>


                                </div>



                                <div class="page_temp_contact">
                                    <br>

                                    <div class="textname">Address Line 1 <span>* </span></div>
                                    <div class="inputname">
                                        <asp:TextBox ID="txtSAddress1" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSadd1" runat="server"
                                            ControlToValidate="txtSAddress1" Display="Dynamic" ErrorMessage="Can't left blank !"
                                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="textname">Address Line 2</div>
                                    <div class="inputname">
                                        <asp:TextBox ID="txtSAddress2" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                    </div>
                                    <div class="textname">City <span>* </span></div>
                                    <div class="inputname">
                                        <asp:TextBox ID="txtSCity" runat="server" ValidationGroup="C" CssClass="txtBox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ControlToValidate="txtSCity" Display="Dynamic" ErrorMessage="Can't left blank !"
                                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="textname">Zip Code <span>*</span></div>
                                    <div class="inputname">
                                        <telerik:RadNumericTextBox ID="txtSZip" runat="server" MaxLength="6" Width="100" CssClass="txtBox" Skin="Silk">
                                            <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                        </telerik:RadNumericTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                            ControlToValidate="txtSZip" Display="Dynamic" ErrorMessage="Can't left blank !"
                                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="textname">Country <span>*</span></div>
                                    <div class="inputname">
                                        <asp:DropDownList ID="DDLSCountry" runat="server" Height="30px"
                                            CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="DDLSCountry_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSCountry" runat="server"
                                            ControlToValidate="DDLSCountry" Display="Dynamic" InitialValue="Select" ErrorMessage="Select Country !"
                                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                    </div>


                                    <div class="textname">State <span>*</span></div>
                                    <div class="inputname">
                                        <asp:DropDownList ID="DDLSState" runat="server" Height="30px" CssClass="txtBox">
                                            <asp:ListItem Value="0" Text="Select">Select</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSState" runat="server" InitialValue="0"
                                            ControlToValidate="DDLSState" Display="Dynamic" ErrorMessage="Select State"
                                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                    </div>





                                </div>

                            </div>






                        </div>









                    </div>
                </div>

                <br />

                <div class="text-center">
                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="addtowish" ValidationGroup="C" OnClick="btnAdd_Click">Submit</asp:LinkButton>
                    <asp:LinkButton ID="btnUpdate" runat="server" CssClass="addtowish" ValidationGroup="C" OnClick="btnUpdate_Click">Save And Continue</asp:LinkButton><br />
                    <asp:SqlDataSource ID="DSBikes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [manufacturer_master_tbl] ORDER BY [manufacturer_name]"></asp:SqlDataSource>

                    <br />
                </div>


            </div>



        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>

