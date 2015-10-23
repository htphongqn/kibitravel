<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enSocialActivities.ascx.cs" Inherits="kibitravel.web.Usercontrols.enSocialActivities" %>

<%@ Register src="enPath.ascx" tagname="enPath" tagprefix="uc1" %>

<uc1:enPath ID="enPath1" runat="server" />
<section class="content">
      <div class="iblock list-exp">
        <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbNewsTitle" runat="server"></asp:Label></b></span> </p>
        <asp:Repeater ID="rptlistnews" runat="server">
            <ItemTemplate>
                <article>
                  <figure><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%></a></figure>
                  <div class="text-exp">
                    <h2> <a> <%# Eval("NEWS_TITLE")%></a></h2>
                    <p class="text-exp"> <%# Eval("NEWS_DESC")%> </p>
                    <p><a class="read-more" href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><i class="fa fa-play-circle"></i> Read more</a></p>
                  </div>
                </article>
            </ItemTemplate>
        </asp:Repeater>
        <p class="pagination clearfix"> <asp:Literal ID="ltrPage" runat="server"></asp:Literal></p>
      </div>
    </section>