<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopHeader.ascx.cs" Inherits="kibitravel.web.Usercontrols.TopHeader" %>
<script type="text/javascript">
    function clickButton(e, buttonid) {
        var evt = e ? e : window.event;
        var bt = document.getElementById(buttonid);

        if (bt) {
            if (evt.keyCode == 13) {
                bt.click();
                return false;
            }
        }
    }  
</script>
<div class="top">
    <div class="container">
    <div class="search"> <span>Search this site </span> |
        <div class="trigger"><i class="fa fa-search"></i></div>
        <div class="popupSearch">
        <input id="txtSearch" runat="server" type="text" alt="Input search…" class="txt-search" placeholder="Input search…" />
        <asp:LinkButton ID="Lbsearch" runat="server" CssClass="btn-search" OnClick="Lbsearch_Click"><i class="fa fa-search"></i></asp:LinkButton>
        <a class="btn-close"><i class="fa fa-close"></i></a> </div>
    </div>
    <p><i class="fa fa-envelope-o"></i> 
        <asp:Repeater ID="rptMail" runat="server">
            <ItemTemplate>                
                <%# Eval("ONLINE_NICKNAME")%>
            </ItemTemplate>
        </asp:Repeater>
    </p>
    <p class="lang-box">
        <a href="/"><img src="/Resources/images/vi.png"></a>
        <a href="/home.html"><img src="/Resources/images/en.png"></a>
    </p>
    </div>
</div>