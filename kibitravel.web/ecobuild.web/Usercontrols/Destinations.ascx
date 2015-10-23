<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Destinations.ascx.cs" Inherits="kibitravel.web.Usercontrols.Destinations" %>
<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc1" %>

<uc1:Path ID="Path1" runat="server" />
    <section class="content">
      <div class="iblock list-destinations">
        <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbCateName" runat="server"></asp:Label></b></span> </p>
        <script type="text/javascript">
			$(document).ready(function(){
			  $('.slider6').bxSlider({
				 
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
        <asp:Repeater ID="rptmenuDestinations" runat="server">
            <ItemTemplate>
                <p class="destinations-tt"><%#Eval("cat_name")%></p>
                <div class="slide-news slide-destinations">
                  <div class="slider6">            
                    <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="slide">
                              <article class="destinations-it">
                                <div class="inner-dt">
                                  <figure class="img-dt"><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>"><img src="<%# GetImageCat(Eval("CAT_ID"),Eval("CAT_IMAGE1"))%>" /></a> </figure>
                                  <h3 class="tt-dt"><%#Eval("cat_name")%></h3>
                                  <div class="over-dt">
                                    <p class="tt-over-dt"><%#Eval("cat_name")%></p>
                                    <p class="txt-dt"><%#Eval("cat_name")%></p>
                                    <a class="detail-dt" href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>"><i class="fa fa-chevron-circle-right"></i></a> </div>
                                </div>
                              </article>
                              <!--end articale--> 
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                  </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>        
      </div>
    </section>