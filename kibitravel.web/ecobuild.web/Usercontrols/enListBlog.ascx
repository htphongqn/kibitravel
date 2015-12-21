<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enListBlog.ascx.cs" Inherits="kibitravel.web.Usercontrols.enListBlog" %>

<%@ Register src="enPath.ascx" tagname="Path" tagprefix="uc1" %>

<%@ Register src="~/Usercontrols/enBookTour.ascx" tagname="BookTour" tagprefix="uc2" %>
<uc2:BookTour ID="BookTour2" runat="server" />
<uc1:Path ID="Path1" runat="server" />
<section class="content">
      <div class="iblock list-media-blog">
        <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbNewsTitle" runat="server"></asp:Label></b></span> </p>
        <div class="search-blog">
          <div class="btn-bt btn-search-blog booktour-link">
          <a class="booktour-link">Tell us your stories</a>
          </div>
        </div>
        <asp:Repeater ID="rptlistnews" runat="server">
            <ItemTemplate>            
                <article class="media-blog">
                  <figure class="photo-media-blog"><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%></a></figure>
                  <div class="text-media-blog">
                    <h2 class="tt-media-blog"> <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><%# Eval("NEWS_TITLE")%></a></h2>
                    <p class="date-time-news-blog"><%# getDate(Eval("NEWS_PUBLISHDATE"))%></p>
                    <p class="txt-media-blog"><%# Eval("NEWS_DESC")%></p>
                    <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>' class="detail-news-blog"><i class="fa fa-chevron-circle-right"></i></a>
                    <%--<p class="social-blog"><a class="facebook"><i class="fa fa-facebook"></i></a> <a class="google-plus"><i class="fa fa-google-plus"></i></a> <a class="twitter"><i class="fa fa-twitter"></i></a> </p>--%>
                  </div>
                </article>
            </ItemTemplate>
        </asp:Repeater>

        
        <p class="pagination clearfix"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></p>
      </div>
    </section>

