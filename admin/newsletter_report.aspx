<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="newsletter_report.aspx.cs" Inherits="admin_newsletter_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table  width="100%" class="txt">
        <tr>           
               <td class="header_title">Export Newsletter
               </td>
        </tr>
        
         <tr>           
               <td >
            
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                       DataSourceID="SqlDataSource1" Width="900px">
                       <Columns>
                           <asp:BoundField DataField="ROW_NUMBER" HeaderText="Sr." HeaderStyle-Width="30px" ItemStyle-Width="30px" 
                               ReadOnly="True" SortExpression="ROW_NUMBER" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />                                                  
                           
                           <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="200px" ItemStyle-Width="200px">
                               <ItemTemplate >
                               <%# Eval("fname")%>  <%# Eval("lname")%>
                               </ItemTemplate>
                           </asp:TemplateField>
                           
                           <asp:BoundField DataField="emailid" HeaderText="Email-Id" HeaderStyle-Width="250px" ItemStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"
                               SortExpression="emailid" /> 
                                                     
                         
                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                         
                       </Columns>
                   </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                       SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY fname,lname ASC) AS ROW_NUMBER, *  FROM newsletter_tbl order by fname, lname">                     
                   </asp:SqlDataSource>            
               </td>
        </tr>
         <tr>
            <td align="center">
                <asp:Button ID="btnExporttoExcel" runat="server" 
                    onclick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn" />
            &nbsp;</td>
        </tr>
        </table>
</asp:Content>

