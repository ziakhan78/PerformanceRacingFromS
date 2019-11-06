<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uc_testimonial.ascx.cs" Inherits="uc_testimonial" %>
<marquee height="144" behavior="scroll" direction="up" scrollamount="1" scrolldelay="0" onmouseover="this.stop();" onmouseout="this.start();" behaviors="scroll">
    <asp:Repeater ID="Repeater2" runat="server" >
            <ItemTemplate>
                    <div align="left" > <%# Eval("testimonial") %></div>
                    <div align="right" >
                      <strong><%# Eval("name") %></strong>
                        <br>
                        <%# Eval("designation") %>
                    </div>

               
                <div style="text-align:center; margin:10px 0 10px 0;">-----------------------------------</div>

                    </ItemTemplate>
        </asp:Repeater></marquee>
