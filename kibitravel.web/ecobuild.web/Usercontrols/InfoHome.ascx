<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InfoHome.ascx.cs" Inherits="kibitravel.web.Usercontrols.InfoHome" %>

<section class="section2">
    <div class="container">
    <div class="col6">
        <p class="tt-sp"> <i class="fa fa-comment-o"></i> What Client Say </p>
        <img src="/vi-vn/data/h1.jpg" /> </div>
    <div class="col-sp col3">
        <p class="tt-sp"><i class="fa fa-skype"></i> Online support </p>        
        <asp:Repeater ID="rptSupport" runat="server">
            <ItemTemplate>
            <p class="sp-item"><a href="skype:<%# Eval("ONLINE_NICKNAME")%>?chat" title="<%# Eval("ONLINE_DESC")%>" class="sk"><img src="/vi-vn/images/sk.png" /></a> <span><%# Eval("ONLINE_DESC")%></span></p>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!--end col-->
    <div class="col-sp col3">
        <p class="tt-sp"> <i class="fa fa-newspaper-o"></i> News </p>
        <script type="text/javascript">
			$(document).ready(function(){
			    $('.slider5').bxSlider({
				    mode: 'vertical',
				slideWidth: 400,
				minSlides: 1,
				moveSlides: 1,
				maxSlides: 1,
				slideMargin: 5,
				auto: true,
				speed: 2000,
				controls: true,
				pause: 2000,
			    });
			});
			</script>
        <div class="slide-news">
        <div class="slider5">            
            <asp:Repeater ID="rptNewsPeriod" runat="server">
                <ItemTemplate>
                     <div class="slide">
                    <article class="media">
                        <div class="text-media">
                        <h2 class="tt-media"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h2>
                        <p class="date-time-news"><%# getDate(Eval("NEWS_PUBLISHDATE"))%></p>
                        <p class="text-media"><%# Eval("NEWS_DESC")%></p>
                        </div>
                    </article>
                    <!--End article--> 
                    </div>                
                </ItemTemplate>
            </asp:Repeater>            
        </div>
        </div>
    </div>
    </div>
</section>