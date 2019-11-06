<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_brand_details.aspx.cs" Inherits="Admin_add_brand_details" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 102px;
        }
        .style2
        {
            width: 130px;
        }
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    
    <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

     <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title" align="center"><asp:Label ID="lblHeading" runat="server" ></asp:Label></td>
                </tr>

                <tr>
                    <td align="right" valign="top">&nbsp;</td>

                    <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                </tr>
     
      
      
        <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Brand Name  : </td>
           
            <td >
                <asp:DropDownList ID="DDLBrandName" runat="server" CssClass="txtBox" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="brand_name" DataValueField="id" >
                            <asp:ListItem Value="Select" Text="Select"></asp:ListItem>
                        </asp:DropDownList>
            </td>
           
        </tr>

         

         


          <tr>
            <td align="right" valign="top" style="text-align:right; vertical-align:top;" 
                class="style2" ><span class="auto-style1">*</span>Component(s) : </td>
           
            <td >
                <asp:CheckBoxList ID="chkComponents" runat="server" DataSourceID="SqlDataSource2" DataTextField="components" DataValueField="id" RepeatColumns="6" RepeatDirection="Horizontal">
                   
                </asp:CheckBoxList>
                
            </td>
           
        </tr>

        

        <tr>
            <td class="style2" ></td>
           
            <td align="left">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" 
                    onclick="btnSubmit_Click" ValidationGroup="O"  />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Reset" CssClass="btn" 
                    CausesValidation="False" onclick="btnCancel_Click" />
              
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [brand_name], [id] FROM [brand_master_tbl] ORDER BY [brand_name]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [components] FROM [components_master_tbl] ORDER BY [components]"></asp:SqlDataSource>
              
            </td>
        </tr>
       
    </table>
            </asp:Panel>
    </ContentTemplate>
    <Triggers>
    <asp:PostBackTrigger ControlID="btnSubmit"  />
    </Triggers>
    </asp:UpdatePanel>
</asp:Content>

