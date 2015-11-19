<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListDestinations.ascx.cs" Inherits="kibitravel.web.Usercontrols.ListDestinations" %>
<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc1" %>

<uc1:Path ID="Path1" runat="server" />
<section class="content">
    <div class="iblock list-destinations list-destinations-tour">
    <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbCateName" runat="server"></asp:Label></b></span> </p> 
    <asp:Repeater ID="rptListDestinations" runat="server">
        <ItemTemplate>
            <article class="destinations-it">
                <div class="inner-dt">
                <figure class="img-dt"><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><img src='<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%>' style="max-height: 210px;"/></a> </figure>
                <h3 class="tt-dt"><%# Eval("NEWS_TITLE")%><span>2 DAY(S)</span></h3>
                <div class="over-dt">
                    <p class="tt-over-dt"><%# Eval("NEWS_TITLE")%></p>
                    <p class="txt-dt"><%# Eval("NEWS_DESC")%></p>
                    <a class="detail-dt" href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><i class="fa fa-chevron-circle-right"></i></a> </div>
                </div>
            </article>
        </ItemTemplate>
    </asp:Repeater>
    </div>
</section>