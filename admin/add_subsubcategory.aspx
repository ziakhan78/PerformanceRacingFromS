<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_subsubcategory.aspx.cs" Inherits="admin_add_subsubcategory" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center">Add Sub Sub Category</td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>

                 <tr>
                    <td align="right" valign="top" style="width: 170px;">
                        <span class="auto-style1">* </span>Select Category :</td>

                    <td>
                        <asp:DropDownList ID="ddlCat" runat="server" DataSourceID="dsCat" DataTextField="cat_name" DataValueField="cid" AppendDataBoundItems="true" CssClass="txtBox" AutoPostBack="True">
                            
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>
                         </td>
                </tr>

                  <tr>
                    <td align="right" valign="top" >
                        <span class="auto-style1">* </span>Select Sub Category :</td>

                    <td>
                        <asp:DropDownList ID="ddlSubCat" runat="server" DataSourceID="dsSubCat" DataTextField="subcat_name" DataValueField="sid"  CssClass="txtBox">
                          
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSubCat" runat="server" ControlToValidate="ddlSubCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>
                         </td>
                </tr>


                <tr>
                    <td align="right" valign="top" >
                        <span class="auto-style1">* </span>Add Sub Sub Category :</td>

                    <td>
                        <asp:TextBox ID="txtSubSubCatName" runat="server" Width="400px"
                            TextMode="SingleLine" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVcategory" runat="server"
                            ControlToValidate="txtSubSubCatName" Display="Dynamic" ErrorMessage="Can't be left blank !"
                            ValidationGroup="C" CssClass="txt_validation"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CVsubcategory" runat="server" ControlToValidate="txtSubSubCatName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CVsubcategory_ServerValidate" ValidationGroup="C"></asp:CustomValidator>
                    </td>
                </tr>

                


                <tr>
                    <td></td>

                    <td>
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit"
                            ValidationGroup="C" OnClick="btnAdd_Click" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" Text="Reset" />
                        <asp:SqlDataSource ID="dsSubCat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Subcategory_tbl] WHERE ([cid] = @cid) ORDER BY [subcat_name]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCat" Name="cid" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsCat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [Category_tbl] ORDER BY [cat_name]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
           <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>



