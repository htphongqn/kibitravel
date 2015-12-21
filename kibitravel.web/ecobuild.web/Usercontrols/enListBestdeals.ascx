<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enListBestdeals.ascx.cs" Inherits="kibitravel.web.Usercontrols.enListBestdeals" %>
<%@ Register src="enPath.ascx" tagname="Path" tagprefix="uc1" %>

<uc1:Path ID="Path1" runat="server" />

    <section class="content">
     <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbCateName" runat="server"></asp:Label></b></span> </p>
      <div class="iblock bestdeals-list">        
        <asp:Repeater ID="rptListBestdeal" runat="server">
            <ItemTemplate>
                <article class="item-bestdeals" >
                  <figure class="img-item-bestdeals"> <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><img src='<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%>' style="width:100% !important; min-width:350px;" /></a> </figure>
                  <h2 class="des-item-bestdeals"> <%#Eval("NEWS_TITLE")%></h2>
                </article>
            </ItemTemplate>
        </asp:Repeater>   
        <asp:Repeater ID="rptListBestdeal2" runat="server">
            <ItemTemplate>
                <article class="item-bestdeals w50" >
                  <figure class="img-item-bestdeals"> <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><img src='<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%>' style="width:100% !important; min-width:350px;" /></a> </figure>
                  <h2 class="des-item-bestdeals"> <%#Eval("NEWS_TITLE")%></h2>
                </article>
            </ItemTemplate>
        </asp:Repeater>     
      </div>
    </section>