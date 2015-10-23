<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enFooter.ascx.cs" Inherits="kibitravel.web.Usercontrols.enFooter" %>

<footer class="footer" role="contentinfo">
    <div class="container">
    <address class="address">
    <asp:Literal ID="Literal_Info" runat="server"></asp:Literal>
    </address>
    <asp:Repeater ID="Rpmenu" runat="server">
        <ItemTemplate>
            <div class="col-ft">
                <p class="tt-ft"><%#Eval("cat_name")%></p>        
                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                    <ItemTemplate>
                        <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>"  style="color:#A5A5A5">
                            - <%#Eval("cat_name")%><br /></a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <!--/col ft-->
    <div class="col-ft f-right">
        <div class="social">
        <p class="tt-ft">FIND US ON:</p>        
        <asp:Repeater ID="rptSocialNetwork" runat="server">
            <ItemTemplate>
                <%# Bind_SocialNetwork(Eval("ONLINE_TYPE"), Eval("ONLINE_DESC"), Eval("ONLINE_NICKNAME"))%>
            </ItemTemplate>
        </asp:Repeater>
        </div>
        <div class="fbs">
        <div class="fb-page fb_iframe_widget" data-href="https://www.facebook.com/pages/KIBITRAVEL/820610807975230" data-width="320" data-hide-cover="true" data-show-facepile="true" data-show-posts="false" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=&amp;container_width=220&amp;hide_cover=true&amp;href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FKIBITRAVEL%2F820610807975230&amp;locale=vi_VN&amp;sdk=joey&amp;show_facepile=true&amp;show_posts=false&amp;width=320"><span style="vertical-align: bottom; width: 220px; height: 246px;">
            <iframe name="f1f986228c" width="320px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" title="fb:page Facebook Social Plugin" src="http://www.facebook.com/v2.3/plugins/page.php?app_id=&amp;channel=http%3A%2F%2Fstatic.ak.facebook.com%2Fconnect%2Fxd_arbiter%2F6brUqVNoWO3.js%3Fversion%3D41%23cb%3Df21a62443%26domain%3Dkibitravel.com.vn%26origin%3Dhttp%253A%252F%252Fkibitravel.com.vn%252Ffba454d24%26relation%3Dparent.parent&amp;container_width=220&amp;hide_cover=true&amp;href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FKIBITRAVEL%2F820610807975230&amp;locale=vi_VN&amp;sdk=joey&amp;show_facepile=true&amp;show_posts=false&amp;width=320" style="border: none; visibility: visible; width: 220px; height: 246px;" class=""></iframe>
            </span></div>
        </div>
    </div>
    <!--/col ft-->
    <p class="paypal"><img src="/Resources/images/paypal.png" /></p>
    <p class="copyright"><span>© kibitravel 2015</span></p>
    </div>
</footer>