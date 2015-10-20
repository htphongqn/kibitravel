<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Logo.ascx.cs" Inherits="ecobuild.Usercontrols.Logo" %>

<figure class="brand-ft">
    <asp:Repeater ID="Rplogo" runat="server">
        <ItemTemplate>
            <%# Getbanner(Eval("BANNER_TYPE"), Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
        </ItemTemplate>
    </asp:Repeater>
</figure>