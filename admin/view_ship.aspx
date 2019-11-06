<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_ship.aspx.cs" Inherits="Admin_view_ship" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
  <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">
       
         <tr>
          <td colspan="3" class="header_title">View Shipping Charges</td>             
        </tr>		
        
              <!-- search and sort start -->
			
			<tr>
			   <td valign="top" class="style5">
						<table>						
						<tr>
						<td valign="top" align="center" style=" width:195px; BORDER-RIGHT: #f4f4f4 1px solid; BORDER-TOP: #f4f4f4 1px solid; BORDER-LEFT: #f4f4f4 1px solid; BORDER-BOTTOM: #f4f4f4 1px solid" bgColor="#f4f4f4" height="4" >
						<b>&nbsp; ::&nbsp;Alphabetic Search&nbsp;::</b>
						</td>
						</tr>
						<tr>
							<td >
								<table style="BORDER-COLLAPSE: collapse;" borderColor="#f4f4f4" cellSpacing="0" cellPadding="0" bgColor="#ffffff" border="1" class="txt" >
									<tr>
										<td id="TDA" onmouseover="this.style.backgroundColor='#D4D4D2'" 
                                            onmouseout="this.style.backgroundColor='#f9f9f9'" align="center" >
											<asp:LinkButton id="LnkA" Runat="server"  onclick="LnkA_Click" CssClass="txtSearch" >A</asp:LinkButton></td>
										<td id="TD1" onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#f9f9f9'"
											align="center" >
											<asp:LinkButton id="LnkB" Runat="server" 
                                                onclick="LnkB_Click" CssClass="txtSearch" >B</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkC" Runat="server" 
                                                onclick="LnkC_Click" CssClass="txtSearch" >C</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkD" Runat="server" 
                                                onclick="LnkD_Click" CssClass="txtSearch" >D</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkE" Runat="server" 
                                                onclick="LnkE_Click" CssClass="txtSearch" >E</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkF" Runat="server" 
                                                onclick="LnkF_Click" CssClass="txtSearch" >F</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkG" Runat="server" 
                                                onclick="LnkG_Click" CssClass="txtSearch" >G</asp:LinkButton></td>
									</tr>
									<tr>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkH" Runat="server" 
                                                onclick="LnkH_Click" CssClass="txtSearch" >H</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkI" Runat="server" 
                                                onclick="LnkI_Click" CssClass="txtSearch" >I</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkJ" Runat="server" 
                                                onclick="LnkJ_Click" CssClass="txtSearch" >J</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkK" Runat="server" 
                                                onclick="LnkK_Click" CssClass="txtSearch" >K</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkL" Runat="server" 
                                                onclick="LnkL_Click" CssClass="txtSearch" >L</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkM" Runat="server" 
                                                onclick="LnkM_Click" CssClass="txtSearch" >M</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
									      <asp:LinkButton id="LnkN" Runat="server" onclick="LnkN_Click" CssClass="txtSearch" >N</asp:LinkButton></td>
									</tr>
									<tr>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkO" Runat="server" 
                                                onclick="LnkO_Click" CssClass="txtSearch" >O</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkP" Runat="server" 
                                                onclick="LnkP_Click" CssClass="txtSearch" >P</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkQ" Runat="server" 
                                                onclick="LnkQ_Click" CssClass="txtSearch" >Q</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkR" Runat="server" 
                                                onclick="LnkR_Click" CssClass="txtSearch" >R</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkS" Runat="server" 
                                                onclick="LnkS_Click" CssClass="txtSearch" >S</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkT" Runat="server" 
                                                onclick="LnkT_Click" CssClass="txtSearch" >T</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" style="height: 20px" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkU" Runat="server" 
                                                onclick="LnkU_Click" CssClass="txtSearch" >U</asp:LinkButton></td>
									</tr>
									<tr>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkV" Runat="server" 
                                                onclick="LnkV_Click" CssClass="txtSearch" >V</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkW" Runat="server" 
                                                onclick="LnkW_Click" CssClass="txtSearch" >W</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkX" Runat="server" 
                                                onclick="LnkX_Click" CssClass="txtSearch" >X</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkY" Runat="server" 
                                                onclick="LnkY_Click" CssClass="txtSearch" >Y</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="LnkZ" Runat="server" 
                                                onclick="LnkZ_Click" CssClass="txtSearch" >Z</asp:LinkButton></td>
										<td onmouseover="this.style.backgroundColor='#D4D4D2'" onmouseout="this.style.backgroundColor='#F9F9F9'"
											align="center" >
											<asp:LinkButton id="Linkbutton1" Runat="server" 
                                                onclick="Linkbutton1_Click" CssClass="txtSearch" >ALL</asp:LinkButton>
                                                </td>
										
									</tr>
								</table>
							</td>
						</tr>						
						</table>
						</td>
			   <td valign="top" width="300px" align="right">
						<table style="text-align:right;" width="300px">
						
						<tr>
						<td valign="top" align="center" style=" border: 1px solid #f4f4f4;" 
                                bgColor="#f4f4f4" class="style1" >
						<b>&nbsp; ::&nbsp;Search By ::</b>
						</td>
						</tr>
						<tr>
							
							<td valign="top" align="right" width="100%">
								<table width="100%">
								
								
								<tr>
										<td  vAlign="top" borderColor="#ffffff" align="left"  >
                                           <asp:RadioButtonList ID="rbtnSearch" runat="server" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem Selected="True" Value="0">State Name</asp:ListItem>                                               
                                               
                                                
                                            </asp:RadioButtonList>
                                           
                                        </td>
									</tr>
									
									
									
									<tr>
										<td  vAlign="top" borderColor="#ffffff" align="left"  >
                                            <asp:TextBox ID="txtName" runat="server" BorderColor="#E0E0E0" 
                                                BorderStyle="Solid" CssClass="txtBox" Width="300px"></asp:TextBox>
                                        </td>
									</tr>
									<tr>
										<td align="left" >
                                            <asp:Button ID="btnSearch" runat="server" CssClass="btn" 
                                                onclick="btnSearch_Click" Text="Search" />
                                        </td>
									</tr>
								</table>
							</td>
						</tr>
						</table>
						</td>						
			</tr>			
					
			<!-- search and sort end -->
			<!-- sort start -->
         <tr>
        <td colspan="3" align="left">
        <asp:Panel ID="Pid" runat="server" GroupingText="Sorting Category">
        <table>
        <tr>
        
      
       
            <td align="right" valign="middle" ><b>Sort By :</b></td>            
             <td width="110" colspan="2" style="margin-left: 40px"><b>
                 <asp:RadioButtonList ID="rbtnSort" runat="server" 
                     RepeatDirection="Horizontal" AutoPostBack="True" 
                     onselectedindexchanged="rbtnSort_SelectedIndexChanged">
                     <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                     <asp:ListItem Value="1">State</asp:ListItem>
                 </asp:RadioButtonList></b>
              </td>
              <td align="left"> <asp:DropDownList ID="DDLState" runat="server" DataSourceID="DSState" AppendDataBoundItems="false" 
                DataTextField="state_name" DataValueField="state_id" AutoPostBack="True" 
                      onselectedindexchanged="DDLState_SelectedIndexChanged" CssClass="txtBox">
                      <asp:ListItem Text="Select state name" Value="0">Select state name</asp:ListItem>
            </asp:DropDownList></td>
                </tr>
        </table>
              
               </asp:Panel>
        </td></tr> 
        <!-- sort end -->
        
        <tr>
            <td colspan="3">
                            
                <telerik:radgrid ID="RadGrid1" runat="server" 
                    AllowPaging="True" AllowSorting="True" DataSourceID="dscat" 
                    Skin="Default" PageSize="25" CssClass="mainlinks" 
                    >
<HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>


<MasterTableView autogeneratecolumns="False" cellspacing="-1" datasourceid="dscat">
    <CommandItemSettings ExportToPdfText="Export to Pdf" />
    <Columns>
     
<telerik:GridBoundColumn DataField="state_name" HeaderText="State Name" 
            SortExpression="state_name" UniqueName="state_name">
            <ItemStyle HorizontalAlign="Left" Width="320px" />
            <HeaderStyle HorizontalAlign="Left" Font-Underline="true" Width="320px"  />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="min_wt" HeaderText="Min Weight(Kgs.)" 
            SortExpression="min_wt" UniqueName="min_wt">
            <ItemStyle HorizontalAlign="Right" Width="125px" />
            <HeaderStyle HorizontalAlign="Center" Font-Underline="true" Width="125px" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="max_wt" HeaderText="Max Weight(Kgs.)" 
            SortExpression="max_wt" UniqueName="max_wt">
            <ItemStyle HorizontalAlign="Right" Width="125px" />
            <HeaderStyle HorizontalAlign="Center" Font-Underline="true" Width="125px" />
        </telerik:GridBoundColumn>       
     
       
        <telerik:GridTemplateColumn HeaderText="Shipping Charges" SortExpression="ShipCharge">
            <ItemTemplate>
               <img src="../Admin_Icons/rupee.gif" alt="" />&nbsp;<%# Eval("ShipCharge", "{0:N}")%>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" Width="170px" />
            <HeaderStyle HorizontalAlign="Center" Width="170px" Font-Underline="true" />
           
       </telerik:GridTemplateColumn>
       
        
        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">        
                <ItemTemplate>
                    <a href="UpdateShip.aspx?ShipID=<%#Eval("ship_map_id") %>">Edit</a> 
                </ItemTemplate>            
                <HeaderStyle HorizontalAlign="Center"  />
                <ItemStyle HorizontalAlign="Center"  Width="40px" />        
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">        
                <ItemTemplate>
                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                    </cc1:ConfirmButtonExtender>                
                    <asp:ImageButton ID="imgDeleteP" CommandName="Delete" 
                        CommandArgument='<%# Eval("ship_map_id") %>' runat="Server" 
                        AlternateText="Delete" ImageUrl="../images/delete.gif" ToolTip="Delete" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center"  />
                <ItemStyle HorizontalAlign="Center"  Width="40px" /> 
            </telerik:GridTemplateColumn>
            
            
    </Columns>
</MasterTableView>
                   
                    <HeaderStyle Font-Bold="True" />
                   
                </telerik:radgrid>
                <asp:SqlDataSource ID="DSState" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                    SelectCommand="SELECT * FROM [State_tbl] WHERE ([country_id] = @country_id) ORDER BY [state_name]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="99" Name="country_id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dscat" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                    
                    
                    
                    SelectCommand="SELECT ship_map_id, country_id, state_id, min_wt, max_wt, ShipCharge, state_name FROM View_State_Shipping ORDER BY state_name asc" 
                    >
                    
                </asp:SqlDataSource>
            
            </td>
            
        </tr>
        
        <tr style="cursor:pointer">        
            <td align="center" colspan="3">
                <asp:Label ID="lblError" runat="server" Text="No records to display" 
                    Visible="false" style="font-weight: 700"></asp:Label>
            </td>
		</tr>
        
        
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


