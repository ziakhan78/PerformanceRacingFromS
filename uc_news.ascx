<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uc_news.ascx.cs" Inherits="uc_news" %>
<marquee height="144" behavior="scroll" direction="up" scrollamount="1" scrolldelay="0" onmouseover="this.stop();" onmouseout="this.start();" behaviors="scroll">
    <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate><%# Eval("news") %><br />
                <div style="text-align:center; margin:10px 0 10px 0;">-----------------------------------</div>
            </ItemTemplate>
        </asp:Repeater></marquee>
