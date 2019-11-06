<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="add_events.aspx.cs" Inherits="admin_add_events" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            text-align: right;
            width:150px;
        }
    </style>
   
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
   
      <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
         
            <tr>
               <td colspan="5" class="header_title">Add Events Calendar
               </td>
            </tr>
           <tr>
              <td colspan="5" align="right"><span class="style2">*</span> Denotes Mandatory 
                  field.
                  </td>
            </tr> 
            
             <tr>
              <td valign="top" class="style3"><span class="style2">*</span> Event Name</td>
              <td class="style1" valign="top"  >:</td>
              <td colspan="3">
                  <asp:TextBox ID="txtEventName" runat="server" Width="450px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RFVEname" runat="server" 
                      ControlToValidate="txtEventName" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Please Enter Event Name" ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
              <td class="style3"><span class="style2">*</span> Event Date</td>
              <td class="style1">:</td>
              <td colspan="3">
                  <telerik:RadDatePicker ID="eventDate" Runat="server" 
                      Culture="English (United Kingdom)">
                      <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                          ViewSelectorText="x">
                      </Calendar>
                      <DatePopupButton HoverImageUrl="" ImageUrl="" />
                      <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy">
                      </DateInput>
                  </telerik:RadDatePicker>
                  <asp:RequiredFieldValidator ID="RFVEDate" runat="server" 
                      ControlToValidate="eventDate" CssClass="txt_validation" Display="Dynamic" 
                      ErrorMessage="Please Enter Event Date" ValidationGroup="A"></asp:RequiredFieldValidator>
              </td>
            </tr>
            
           
         
         
            
          <tr>
              <td valign="top" class="style3">Time</td>
              <td class="style1" valign="top">:</td>
              <td colspan="3"> <asp:DropDownList ID="DDLTimeH" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLTimeM" runat="server" CssClass="txt">
                    </asp:DropDownList>
                    - <asp:DropDownList ID="DDLTimeAMPM" runat="server" CssClass="txt">                        
                        <asp:ListItem>PM</asp:ListItem>
                        <asp:ListItem>AM</asp:ListItem>
                    </asp:DropDownList>
                                                                                            &nbsp;</td>
            </tr>
            
                      
            
             
            <tr>
                <td class="style3" valign="top">Venue</td>
                <td class="style1" valign="top">:</td>
                <td colspan="3">
                    <asp:TextBox ID="txtVenue1" runat="server" Width="450px"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td class="style3" valign="top"></td>
                <td class="style1" valign="top">&nbsp;</td>
                <td colspan="3">
                    <asp:TextBox ID="txtVenue2" runat="server" Width="450px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="style3" valign="top"></td>
                <td class="style1" valign="top">&nbsp;</td>
                <td colspan="3">
                    <asp:TextBox ID="txtVenue3" runat="server" Width="450px"></asp:TextBox></td>
            </tr>
            
              <tr>
                <td class="style3" valign="top">GPS Coordinates</td>
                <td class="style1" valign="top">:</td>
                <td valign="top" colspan="3">
                    Latitude
                    <asp:TextBox ID="txtGPSLati" runat="server"></asp:TextBox>&nbsp;Longitude
                    <asp:TextBox ID="txtGPSLongi" runat="server"></asp:TextBox>
                  </td>
            </tr>
            
              <tr>
                <td class="style3" valign="top">Upload Direction Map</td>
                <td class="style1" valign="top">:</td>
                <td colspan="3">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="455px" />
                  </td>
            </tr>
            
           
           <tr>
                <td class="style3" valign="top">Dress Code</td>
                <td class="style1" valign="top">:</td>
                <td colspan="3">
                    <asp:TextBox ID="txtDressCode" runat="server" Width="450px"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td class="style3" valign="top">Event Description</td>
                <td class="style1" valign="top">:</td>
                <td colspan="3"><telerik:RadEditor ID="txtEventDesc" Runat="server" Width="100%" Height="250px">
                      <Tools>
                            <telerik:EditorToolGroup Tag="MainToolbar">
                                  <telerik:EditorTool Name="SpellCheck"></telerik:EditorTool>
                                    <telerik:EditorTool Name="FindAndReplace"></telerik:EditorTool>
                                    <telerik:EditorTool Name="SelectAll"></telerik:EditorTool>
                                <telerik:EditorSplitButton Name="Undo">
                                </telerik:EditorSplitButton>
                                <telerik:EditorSplitButton Name="Redo">
                                </telerik:EditorSplitButton>
                                <telerik:EditorSeparator />
                                <telerik:EditorTool Name="Cut" />
                                <telerik:EditorTool Name="Copy" />
                                <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                                   <telerik:EditorTool Name="LinkManager" ShortCut="CTRL+K" />
                                <telerik:EditorTool Name="Unlink" ShortCut="CTRL+SHIFT+K" />
                            </telerik:EditorToolGroup>
                            <telerik:EditorToolGroup Tag="Formatting">
                                <telerik:EditorTool Name="Bold" />
                                <telerik:EditorTool Name="Italic" />
                                <telerik:EditorTool Name="Underline" />
                                <telerik:EditorSeparator />
                                <telerik:EditorSplitButton Name="ForeColor">
                                </telerik:EditorSplitButton>
                                <telerik:EditorSplitButton Name="BackColor">
                                </telerik:EditorSplitButton>
                                <telerik:EditorSeparator />
                                <telerik:EditorDropDown Name="FontName">
                                </telerik:EditorDropDown>
                                <telerik:EditorDropDown Name="RealFontSize">
                                </telerik:EditorDropDown>
                                <telerik:EditorTool Name="InsertUnorderedList" />
                                    <telerik:EditorTool Name="InsertOrderedList" />
                            </telerik:EditorToolGroup>
                        </Tools>
                    </telerik:RadEditor></td>
            </tr>
            
                     <tr>
                <td class="style3" valign="top">Upload Image</td>
                <td class="style1" valign="top">:</td>
                <td colspan="3">
                    <asp:FileUpload ID="FileUploadImage" runat="server" Width="455px" />
                         </td>
            </tr>      
            
             
            <tr>
              <td class="style3" >&nbsp;</td>
              <td class="style1">&nbsp;</td>
              <td colspan="3"><div align="left">
                  <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                      CssClass="btn" 
                      ValidationGroup="A" onclick="btnSubmit_Click"     />
                  &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" 
                      CssClass="btn" CausesValidation="False" />
                  <asp:SqlDataSource ID="DSDistClubNo" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT SUBSTRING(club_name,16,100) as Club_name,id from [DistrictClubsMeets_tbl] order by club_name asc">
                  </asp:SqlDataSource>
                  <asp:SqlDataSource ID="DSMembers" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConnString %>" 
                      SelectCommand="SELECT * FROM [View_Disttt3140Members] ORDER BY [Name]">
                  </asp:SqlDataSource>
                  </div></td>
            </tr>
            
           
          </table>
     
   </ContentTemplate>
   <Triggers>
   <asp:PostBackTrigger ControlID="btnSubmit" /></Triggers>
    </asp:UpdatePanel>
</asp:Content>




