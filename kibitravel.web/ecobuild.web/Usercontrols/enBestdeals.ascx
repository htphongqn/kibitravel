<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enBestdeals.ascx.cs" Inherits="kibitravel.web.Usercontrols.enBestdeals" %>
<%@ Register src="enPath.ascx" tagname="Path" tagprefix="uc1" %>

<uc1:Path ID="Path1" runat="server" />
<section class="content">
      <div id="div1" runat="server" class="iblock most-tour list-deals">
        <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbCateName" runat="server"></asp:Label></b></span> </p>
       <asp:Repeater ID="rptmenubestdeal" runat="server">
            <ItemTemplate>
                <article class="tour-mt">
                  <p class="more-mt"> <span class="more-s"><b><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">See more</a></b></span> <i class="caret-mt"></i></p>
                  <figure class="img-mt"> <a><img src="<%# GetImageCat(Eval("CAT_ID"),Eval("CAT_IMAGE1"))%>"  /></a>
                    <div class="des-mt">
                      <p> <span><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>" class="dt-dt"><i class="fa fa-globe"></i> <%#Eval("cat_name")%></a></span> </p>
                    </div>
                  </figure>
                </article>
            </ItemTemplate>
        </asp:Repeater>        
      </div>

        <div id="div2" runat="server">
         <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbCateName2" runat="server"></asp:Label></b></span> </p>
          <div class="iblock bestdeals-list">        
            <asp:Repeater ID="rptListBestdeal" runat="server">
                <ItemTemplate>
                    <article class="item-bestdeals" >
                      <figure class="img-item-bestdeals"> <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>"><img src="<%# GetImageCat(Eval("CAT_ID"),Eval("CAT_IMAGE1"))%>"  style="width:100% !important; min-width:350px;" /></a> </figure>
                      <h2 class="des-item-bestdeals"> <%#Eval("cat_name")%></h2>
                    </article>
                </ItemTemplate>
            </asp:Repeater>      
          </div>
        </div>
    </section>

