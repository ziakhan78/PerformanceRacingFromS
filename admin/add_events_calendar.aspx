<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_events_calendar.aspx.cs" Inherits="admin_add_events_calendar" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

      <table style="width:100%;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5" >
       
        <tr>
            <td colspan="3" class="header_title" align="center">Add Events Calendar</td>             
        </tr>
        
        <tr>
            <td align="right" class="style6" valign="top">
                &nbsp;</td>
            <td class="style2" valign="top">
                &nbsp;</td>
            <td class="style2" align="right"><span class="style1">*</span> Denotes mandatory fields</td>
        </tr>
        <tr>
            <td align="left"  valign="top" colspan="3" class="header_subtitle">
                Event Date &amp; Time</td>
        </tr>
        
      
        
        <tr>
            <td align="right"  valign="top">
                <span class="style1">* </span>Event Start Date</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5">
                <telerik:RadDatePicker ID="StartDate" Runat="server">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>
                                    </telerik:RadDatePicker>
                <asp:RequiredFieldValidator ID="RFVSdate" runat="server" 
                    ControlToValidate="StartDate" Display="Dynamic" 
                    ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td align="right"  valign="top">
                Event End Date</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5">
                <telerik:RadDatePicker ID="EndDate" Runat="server">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>
                                    </telerik:RadDatePicker>
            </td>
        </tr>
        
        <tr>
            <td align="right"  valign="top">
                <span class="style1">&nbsp;</span>Event Start Time</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5"><asp:DropDownList ID="DDLsh" runat="server"></asp:DropDownList>
            <asp:DropDownList ID="DDLsm" runat="server"></asp:DropDownList>
             <asp:DropDownList ID="DDLsampm" runat="server">
            <asp:ListItem Value="AM">AM</asp:ListItem>
            <asp:ListItem Value="PM">PM</asp:ListItem>
            </asp:DropDownList></td>
        </tr>
        
        <tr>
            <td align="right"  valign="top">
                Event End Time</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5"><asp:DropDownList ID="DDLeh" runat="server"></asp:DropDownList>
            <asp:DropDownList ID="DDLem" runat="server"></asp:DropDownList>
             <asp:DropDownList ID="DDLeampm" runat="server">
            <asp:ListItem Value="AM">AM</asp:ListItem>
            <asp:ListItem Value="PM">PM</asp:ListItem>
            </asp:DropDownList></td>
        </tr>
        
       <%-- <tr >
            <td align="left"  valign="top" colspan="3" class="txt_SubTitle">
               Recurring Events</td>
        </tr>            
        
          <tr >
            <td align="right" valign="top">
                Frequency</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5">
                <asp:DropDownList ID="DDLFrequency" runat="server" CssClass="txt" Height="22px"
                                        Width="172px" OnSelectedIndexChanged="DDLFrequency_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>Daily</asp:ListItem>
                                        <asp:ListItem>Weekly</asp:ListItem>
                                        <asp:ListItem>Monthly</asp:ListItem>
              </asp:DropDownList>
            </td>
        </tr>        
          <tr id="trDaily" runat="server">
            <td align="right"  valign="top">
                </td>
            <td  valign="top" class="style3" >
                </td>
                                <td style="height: 22px" >
                                    <asp:CheckBox ID="chkWeekdays" runat="server" Text="Weekdays" />
                                    <asp:CheckBox ID="chkWeekends" runat="server" Text="Weekends" /></td>
                            </tr>
          <tr id="trWeekly" runat="server">
                              <td align="right"  valign="top">
                </td>
            <td  valign="top" class="style3" ></td>
                                <td style="height: 22px" >
                                    <asp:CheckBox ID="chkSun" runat="server" Text="Sunday" />
                                    <asp:CheckBox ID="chkMon" runat="server" Text="Monday" />
                                    <asp:CheckBox ID="chkTue" runat="server" Text="Tuesday" />
                                    <asp:CheckBox ID="chkWed" runat="server" Text="Wednesday" />
                                    <asp:CheckBox ID="chkThu" runat="server" Text="Thursday" />
                                    <asp:CheckBox ID="chkFri" runat="server" Text="Friday" />
                                    <asp:CheckBox ID="chkSat" runat="server" Text="Saturday" />
                                    
                               </td>
                            </tr>
          <tr id="trMonthly" runat="server">
                               <td align="right"  valign="top">
                </td>
            <td  valign="top" class="style3" ></td>
                                <td style="height: 22px" >
                                    <asp:CheckBoxList ID="chkMonthly" runat="server" RepeatColumns="16" RepeatDirection="Horizontal" CssClass="txt">
                                    </asp:CheckBoxList>
                                    <asp:CheckBox ID="chkEvery" runat="server" Text="Every" />
                                    
                               </td>
                            </tr>   --%>
                            
                            
                            
                    <tr>
            <td align="left"  valign="top" colspan="3" class="header_subtitle">
               Event details  </td>
        </tr>
               <tr>
            <td align="right"  valign="top">
                <span class="style1">* </span>Event Title</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5">
                <asp:TextBox ID="txtEventTitle" runat="server" Width="600px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVtitle" runat="server" 
                    ControlToValidate="txtEventTitle" Display="Dynamic" 
                    ErrorMessage="Can't left blank !" ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr> 
                           
                             <tr>
            <td align="right"  valign="top">
                <span class="style1">* </span>Venue</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5">  
                <asp:TextBox ID="txtVenu" runat="server" Width="600px" 
                    TextMode="SingleLine"></asp:TextBox>             
                <asp:RequiredFieldValidator ID="RFVvenue" runat="server" 
                    ControlToValidate="txtVenu" Display="Dynamic" ErrorMessage="Can't left blank !" 
                    ValidationGroup="C"></asp:RequiredFieldValidator>
            </td>
        </tr>
         
                            
        <tr>
            <td align="right"  valign="top">
                Event Type</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5">               
                                    <table class=txt>
                                        <tr>
                                            <td style="width: 25px; height: 22px;">
                                                <asp:CheckBox ID="chkDining" runat="server" Text=" " /></td>
                                            <td style="width: 25px; height: 22px;">
                                                &nbsp;<asp:Image ID="Image9" runat="server" ImageUrl="../images/icon9.jpg" /></td>
                                            <td >
                                                Bar &amp; Restaraunts</td>
                                        </tr>                                        
                                        <tr>
                                            <td style="width: 25px">
                                                <asp:CheckBox ID="chkClub" runat="server" Text=" " /></td>
                                            <td style="width: 25px">
                                                <asp:Image ID="Image3" runat="server" ImageUrl="../images/icon3.jpg" /></td>
                                            <td class="style2">
                                                Club Facilities</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 25px">
                                                <asp:CheckBox ID="chkEnter" runat="server" Text=" " /></td>
                                            <td style="width: 25px">
                                                &nbsp;<asp:Image ID="Image8" runat="server" ImageUrl="../images/icon8.jpg" /></td>
                                            <td class="style2">
                                                Sports</td>
                                        </tr>
                                        </table>
            </td>
        </tr>
                            
                            
                            
                            
         
        
         <tr>
            <td align="right"  valign="top">
                Description</td>
            <td  valign="top" class="style3" >
                :</td>
            <td class="style5"> 
            <asp:TextBox ID="txtDesc" runat="server" Height="80px" TextMode="MultiLine" 
                    Width="600px"></asp:TextBox>                
            </td>
        </tr>    
        
        
       
     
         <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style17">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Submit" 
                    ValidationGroup="C" onclick="btnAdd_Click"  />
&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" 
                    Text="Reset"  Width="59px"  />
            </td>
        </tr>
    </table>
    
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

