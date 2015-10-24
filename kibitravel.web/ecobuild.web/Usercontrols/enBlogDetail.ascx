<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enBlogDetail.ascx.cs" Inherits="kibitravel.web.Usercontrols.enBlogDetail" %>

<%@ Register src="enPath.ascx" tagname="Path" tagprefix="uc1" %>
<uc1:Path ID="Path1" runat="server" />
<%@ Register src="BookTour.ascx" tagname="BookTour" tagprefix="uc2" %>
<uc2:BookTour ID="BookTour1" runat="server" />
<section class="content">
      <article class="iblock detail-blog">
        <h1 class="tt-detail-blog"><asp:Label ID="lbNewsTitle" runat="server" /></h1>
         <p class="search-blog" >
          <button class="btn-bt btn-search-blog" >
          <a class="booktour-link"  >Tell us your stories</a>
          </button>
        </p>        
        <div class="inner-detail-blog">
          <asp:Literal ID="liHtml" runat="server"></asp:Literal>
          <!-- end-->
          <p class="social-blog">
          <div class="addthis_toolbox addthis_default_style like_face shareBox">
                <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                </a>
                <script type="text/javascript">
                    var addthis_config = { "data_track_addressbar": true };
                    addthis_config = addthis_config || {};
                    addthis_config.data_track_addressbar = false;
                </script>
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50d418ab2d45f0aa"></script>
            </div>
          </p>
        </div>
      </article>
      <script type="text/javascript">
			$(document).ready(function(){
			  $('.slider7').bxSlider({
				 
				slideWidth: 350,
				minSlides: 1,
				moveSlides: 1,
				maxSlides: 4,
				slideMargin: 20,
				auto: false,
				speed: 2000,
				controls: true,
				pause: 2000,
			  });
			});
			</script>
            <p class="tt-detail-blog">RECENT ARTICLES</p>
      <div class="slide-news slide-blog">
        <div class="slider7">
          <asp:Repeater ID="rptlistnewsOther" runat="server">
            <ItemTemplate>
            <div class="slide">
                <article class="media-blog">
                  <figure class="photo-media-blog"><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%></a></figure>
                  <div class="text-media-blog">
                    <h2 class="tt-media-blog"> <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><%# Eval("NEWS_TITLE")%></a></h2>
                    <p class="date-time-news-blog"><%# getDate(Eval("NEWS_PUBLISHDATE"))%></p>
                  </div>
                </article>
                <!--end articale--> 
              </div>
            </ItemTemplate>
        </asp:Repeater>
        </div>
      </div>
    </section>