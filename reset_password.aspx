<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="reset_password.aspx.cs" Inherits="reset_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <link href="../css/programmer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="bs-example">
        <div class="container">
            <div class="row">

                <div class="main_heading_div">
                    <h2>Reset Password</h2>
                </div>

                <div style="height: 40px;"></div>

            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">

            <div class="text_paragraph" style="height: 300px;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:Panel ID="panelReset" runat="server" DefaultButton="btnSubmit">

                            <div class="container">
                               
                                <br />
                                <p>Please enter the desired password for your account below.</p>
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="email">New Password:</label>
                                        <div class="col-sm-10">

                                            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" MaxLength="12" Width="150px" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="pwd">Confirm Password:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="txtCPass" runat="server" CssClass="form-control" MaxLength="12" Width="150px" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCPass" runat="server" ControlToValidate="txtCPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CVPass" runat="server" ControlToCompare="txtPass" ControlToValidate="txtCPass" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Password mismatch !" ValidationGroup="C"></asp:CompareValidator>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <asp:LinkButton ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-danger" ValidationGroup="C" OnClick="btnSubmit_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </asp:Panel>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnSubmit" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
            <div class="clearfix"></div>



        </div>
    </div>
</asp:Content>



