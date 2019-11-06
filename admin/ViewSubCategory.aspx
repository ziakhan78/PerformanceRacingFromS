<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="ViewSubCategory.aspx.cs" Inherits="Admin_ViewSubCategory"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
function SelectAllCheckboxes(spanChk){

// Added as ASPX uses SPAN for checkbox
var oItem = spanChk.children;
var theBox=(spanChk.type=="checkbox")?spanChk:spanChk.children.item[0];
xState=theBox.checked;

elm=theBox.form.elements;
for(i=0;i<elm.length;i++)
if(elm[i].type=="checkbox" && elm[i].id!=theBox.id)
{
//elm[i].click();
if(elm[i].checked!=xState)
elm[i].click();
//elm[i].checked=xState;
}
}

</script>
<script type="text/javascript">

 function confirm_delete()
{
  if (confirm("Subcategory and their products are deleted?")==true)
    return true;
  else
    return false;
}

</script>

<script type="text/javascript">
   var TargetBaseControl = null;
        
   window.onload = function()
   {
      try
      {
         //get target base control.
         TargetBaseControl = 
           document.getElementById('<%= this.GridViewSubcategory.ClientID %>');
      }
      catch(err)
      {
         TargetBaseControl = null;
      }
   }
        
   function TestCheckBox()
   {              
      if(TargetBaseControl == null) return false;
      
      //get target child control.
      var TargetChildControl = "chkActive";
            
      //get all the control of the type INPUT in the base control.
      var Inputs = TargetBaseControl.getElementsByTagName("input"); 
            
      for(var n = 0; n < Inputs.length; ++n)
         if(Inputs[n].type == 'checkbox' && 
            Inputs[n].id.indexOf(TargetChildControl,0) >= 0 && 
            Inputs[n].checked)
          return true;        
            
      alert('Select at least one checkbox!');
      return false;
   }
</script>

    <style type="text/css">
        .style1
        {
            width: 687px;
           
        }
        .style2
        {
            width: 378px;        
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<table class="txt" style="width: 100%;" align="center" cellpadding="0" cellspacing="5">
       

     <tr>
            <td class="header_title" colspan="2">Sub-Category List</td>             
        </tr>


        <tr>            
            <td align="left" valign="top" class="style2"><asp:Button ID="btnAdd" runat="server" 
                    CssClass="btn" Text="Add Sub-Category" 
                    onclick="btnAdd_Click" Width="111px" />
&nbsp;<asp:Button ID="btnCStatus" runat="server" CssClass="btn"  Text="Change Status" Width="107px" onclick="btnCStatus_Click" />&nbsp;<asp:Button 
                    ID="btnDelete" runat="server" CssClass="btn" Text="Delete Sub-Category" 
                    onclick="btnDelete_Click" Width="131px" /></td>
            <td align="right" valign="top" class="txt">&nbsp;<b>Sort : </b>
                <asp:DropDownList ID="DDLCategory" runat="server" CssClass="txtBox" Width="160px" 
                    AutoPostBack="True" 
                    onselectedindexchanged="DDLCategory_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="left">
                <asp:GridView ID="GridViewSubcategory" runat="server" 
                    AutoGenerateColumns="False" CssClass="dataGrid" Width="655px" CellPadding="4" 
                    ForeColor="#92294A" GridLines="None" AllowPaging="True" 
                    AllowSorting="True" DataKeyNames="sid" 
                    onpageindexchanging="GridViewSubcategory_PageIndexChanging" 
                    onsorting="GridViewSubcategory_Sorting" PageSize="20" 
                    onselectedindexchanged="GridViewSubcategory_SelectedIndexChanged">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>                
                
                
                
                 <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="80px"  ItemStyle-Width="80px">
                  <HeaderTemplate >
                    <asp:CheckBox id="chkAll" onclick="javascript:SelectAllCheckboxes(this);" runat="server" AutoPostBack="false" ToolTip="Select/Deselect All" TextAlign="right" /> 
                
                 </HeaderTemplate>
            <ItemTemplate>
            <asp:Label ID="lblsid" runat="server" Text='<%# Eval("sid") %>' Visible="false"></asp:Label>              
               <asp:CheckBox id="chkActive" Runat="server" TextAlign="Left"></asp:CheckBox>
            </ItemTemplate>
            
                     <HeaderStyle HorizontalAlign="Left" Width="80px" />
                     <ItemStyle HorizontalAlign="Left" Width="80px" />
            
        </asp:TemplateField>

                
                <asp:TemplateField HeaderText="Subcategory Name" SortExpression="subcat_Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="420px"  ItemStyle-Width="420px">
                <ItemTemplate>                    
                <%# Eval("subcat_Name") %>                
                </ItemTemplate>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Status" SortExpression="status" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="75px"  ItemStyle-Width="75px">
                <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                </ItemTemplate>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                
                
                 <asp:TemplateField HeaderText="Update" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="80px"  ItemStyle-Width="80px">
                <ItemTemplate>
                <a href='AddSubCategory.aspx?sid=<%# Eval("sid") %>'>update</a> 
                </ItemTemplate>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                
                    <asp:TemplateField></asp:TemplateField>
                
                </Columns>
                      <PagerStyle HorizontalAlign="right" Font-Bold="true" />
                    <EmptyDataTemplate>
                        <asp:Label ID="Label1" runat="server" Text="There are no records."></asp:Label>
                    </EmptyDataTemplate>
                   <SelectedRowStyle  />
                    <HeaderStyle HorizontalAlign="Left" BackColor="#705e36" ForeColor="White" />
                    <EditRowStyle  />
                    <AlternatingRowStyle BackColor="#ded3bd" ForeColor="#705e36" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
							<td class="txt" align="center" colspan="3" height="56" style="width:655px;">
								<asp:Label id="lblSearch" runat="server" Font-Size="12pt" Font-Bold="True">No 
                                Record Exists To This Criteria</asp:Label></td>
						</tr>
               
        
    </table>
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>

