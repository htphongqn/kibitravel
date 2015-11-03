<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DestinationDetail.ascx.cs" Inherits="kibitravel.web.Usercontrols.DestinationDetail" %>

<%@ Register src="Path.ascx" tagname="enPath" tagprefix="uc1" %>

<uc1:enPath ID="enPath1" runat="server" />
<%@ Register src="BookTour.ascx" tagname="BookTour" tagprefix="uc2" %>
<uc2:BookTour ID="BookTour1" runat="server" />
    <section class="content"> 
      <script type="text/javascript">
			$(document).ready(function(){
			  $('.slider7').bxSlider({
				 
				slideWidth: 360,
				minSlides: 1,
				moveSlides: 1,
				maxSlides: 3,
				slideMargin: 0,
				auto: false,
				speed: 2000,
				controls: true,
				pause: 2000,
			  });
			});
			</script>
      <article class="iblock detail-destination">
        <h1 class="tt-detail"><asp:Label ID="lbNewsTitle" runat="server" /><a class="btn-order" href="/booktour.html">Book Now</a></h1>
        <script type="text/javascript" src="/Resources/scripts/jssor.js"></script> 
        <script type="text/javascript" src="/Resources/scripts/jssor.slider.js"></script> 
        <script type="text/javascript" src="/Resources/scripts/jsor-js-2.js"></script>
        <link rel="stylesheet" type="text/css" href="/Resources/styles/jssor.css"/>
        <script type="text/javascript" src="/Resources/scripts/tabcontent.js"></script>
        <link rel="stylesheet" type="text/css" href="/Resources/styles/tabcontent.css"/>
        <div class="inner"> 
          <!-- Jssor Slider Begin --> 
          <!-- To move inline styles to css file/block, please specify a class name for each element. -->
          <div id="slider1_container" style="position: relative;   width: 960px;
        height: 480px; background: #191919; overflow: hidden; margin-left:auto; margin-right:auto"> 
            
            <!-- Slides Container -->
            <div u="slides" style="cursor: move; position: absolute; left: 240px; top: 0px; width: 720px; height: 480px; overflow: hidden;">              
              <asp:Repeater ID="Rpimg_small" runat="server">
                    <ItemTemplate>
                    <div> <img u="image" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" /> 
              <img u="thumb" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" /> </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <!-- Arrow Left --> 
            <span u="arrowleft" class="jssora05l" style="top: 158px; left: 248px;"> </span> 
            <!-- Arrow Right --> 
            <span u="arrowright" class="jssora05r" style="top: 158px; right: 8px"> </span> 
            
            <!-- thumbnail navigator container -->
            <div u="thumbnavigator" class="jssort02" style="left: 0px; bottom: 0px;"> 
              <!-- Thumbnail Item Skin Begin -->
              <div u="slides" style="cursor: default;">
                <div u="prototype" class="p">
                  <div class=w>
                    <div u="thumbnailtemplate" class="t"></div>
                  </div>
                  <div class=c></div>
                </div>
              </div>
              <!-- Thumbnail Item Skin End --> 
            </div>
            <!--#endregion Thumbnail Navigator Skin End --> 
            
          </div>
          <!-- Jssor Slider End -->
          
          <div class="dt-dn" >
            <ul class="tabs wmn" data-persist="true">
              <li><a href="#view1"><asp:Literal ID="lbtab1" runat="server"></asp:Literal></a></li>
              <li><a href="#view2"><asp:Literal ID="lbtab2" runat="server"></asp:Literal></a></li>
              <li><a href="#view3"><asp:Literal ID="lbtab3" runat="server"></asp:Literal></a></li>
               <a class="btn-order" href="/booktour.html">BOOK NOW</a>
            </ul>
            <div class="wmn tabcontents ">
              <div id="view1"> 
              <div class="testDiv2">
                <!--begin--> 
                <asp:Literal ID="liHtmlOverview" runat="server"></asp:Literal>                
                <!--end--> 
                </div>
              </div>
              <!-- /*end view*/-->
              <div id="view2"> 
                <div class="testDiv2">
                <!--begin-->
                <asp:Literal ID="liHtmlItinerary" runat="server"></asp:Literal>
                <!--end--> 
                </div>
              </div>
              <!-- /*end view*/-->              
              <div id="view3">
              <div class="testDiv2"> 
                <!--begin-->
                <asp:Literal ID="liHtmlPrices" runat="server"></asp:Literal>
                <!--end--> 
                </div>
              </div>
              <!-- /*end view*/--> 
            </div>
            <!-- /*end tab*/--> 
          </div>
          <!-- /*dt-dn*/-->
        </div>
      </article>
      <div class="clearfix  ">
      </div>
      <div class="iblock orther-tour list-destinations-tour">
        <p class="tt-mt"> <span class="mt-s"><b>OTHER TOURS</b></span> </p>
        <div class="slide-news slide-destinations">
          <div class="slider7">
            <asp:Repeater ID="rptlistnewsOther" runat="server">
                <ItemTemplate>
                    <div class="slide">
                      <article class="destinations-it">
                        <div class="inner-dt">
                          <figure class="img-dt"><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><img src='<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%>' /></a></figure>
                          <h3 class="tt-dt"><%# Eval("NEWS_TITLE")%><span>2 DAY(S)</span></h3>
                          <div class="over-dt">
                            <p class="tt-over-dt"><%# Eval("NEWS_TITLE")%></p>
                            <p class="txt-dt"><%# Eval("NEWS_DESC")%></p>
                            <a class="detail-dt" href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><i class="fa fa-chevron-circle-right"></i></a> </div>
                        </div>
                      </article>
                      <!--end articale--> 
                    </div>
                </ItemTemplate>
            </asp:Repeater>
          </div>
        </div>
      </div>
    </section>