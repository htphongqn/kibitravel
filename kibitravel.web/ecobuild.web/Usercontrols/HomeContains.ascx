<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeContains.ascx.cs" Inherits="kibitravel.web.Usercontrols.HomeContains" %>

<section class="content">
    <div class="hot-tour">
    <figure class="slide-ht">
        <figure class="slider" role="slider">
        <div class="slider-wrapper theme-default">
            <div id="slider-ht" class="nivoSlider">
            <asp:Repeater ID="rptHottour" runat="server">
                <ItemTemplate>
                     <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                     <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"  /></a>                 
                </ItemTemplate>
            </asp:Repeater>
            </div>
        </div>
        </figure>
    </figure>
    <p class="tt-ht"> <span class="tt">Hot Tour</span> <i class="caret-ht"></i> </p>
    </div>
    <!--/end hot tour-->
    <div class="most-tour">
    <p class="tt-mt"> <span class="mt-s"><b>Most Popular Tours</b></span> </p>
<%--    <p class="view-all-lst"><a>View All Destinations</a></p>--%>
    
    <asp:Repeater ID="rptTourPopular" runat="server">
        <ItemTemplate>
                <article class="tour-mt">
                <p class="more-mt"> <span class="more-s"><b><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">See more</a></b></span> <i class="caret-mt"></i></p>
                <figure class="img-mt"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" style="max-height:210px;"/></a>
                <div class="des-mt">
                    <p> <%# Eval("NEWS_TITLE")%><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="price-mt"><i class="fa fa-tag"></i> <%# Eval("NEWS_FIELD3")%></a> </p>
                </div>
                </figure>
                <p class="day-of-mt"><i class="fa fa-clock-o"></i> <%# GetStringLimit(Eval("NEWS_DESC"))%></p>
            </article>
            <!--end articale-->                
        </ItemTemplate>
    </asp:Repeater> 
        
    </div>
    <!--/end most tour-->
      
    <div class="most-tour">
    <p class="tt-mt"> <span class="mt-s"><b>Unique & Different Tours</b></span> </p>
    <%--<p class="view-all-lst"><a>View All Destinations</a></p>--%>
        
    <asp:Repeater ID="rptTourDifferent" runat="server">
        <ItemTemplate>
                <article class="tour-mt">
                <p class="more-mt"> <span class="more-s"><b><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">See more</a></b></span> <i class="caret-mt"></i></p>
                <figure class="img-mt"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" style="max-height:210px;"/></a>
                <div class="des-mt">
                    <p> <%# Eval("NEWS_TITLE")%><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="price-mt"><i class="fa fa-tag"></i> <%# Eval("NEWS_FIELD3")%></a> </p>
                </div>
                </figure>
                <p class="day-of-mt"><i class="fa fa-clock-o"></i> <%# GetStringLimit(Eval("NEWS_DESC"))%></p>
            </article>
            <!--end articale-->                
        </ItemTemplate>
    </asp:Repeater> 
        
    </div>
    <!--/end most tour--> 
</section>