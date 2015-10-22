<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListBestdeals.ascx.cs" Inherits="kibitravel.web.Usercontrols.ListBestdeals" %>
<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc1" %>

<uc1:Path ID="Path1" runat="server" />

    <section class="content">
     <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbCateName" runat="server"></asp:Label></b></span> </p>
      <div class="iblock bestdeals-list">        
        <asp:Repeater ID="rptListBestdeal" runat="server">
            <ItemTemplate>
                <article class="item-bestdeals" >
                  <figure class="img-item-bestdeals"> <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%></a> </figure>
                  <h2 class="des-item-bestdeals"> <%#Eval("NEWS_TITLE")%></h2>
                </article>
            </ItemTemplate>
        </asp:Repeater>      
      </div>
    </section>