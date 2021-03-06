﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.ascx.cs" Inherits="kibitravel.web.UIs.SearchResult" %>
           
    
<nav class="breadcrumb">
    <ul>
    <li><a href="/trang-chu.html">Trang chủ</a></li>
    <li><a>Tìm kiếm</a></li>
    </ul>
</nav>
<section class="content">
    <div class="iblock list-media">
        <p class="tt-mt"> <span class="mt-s"><b><asp:Label ID="lbNewsTitle" runat="server" Text="Kết quả tìm kiếm"></asp:Label></b></span> </p>

        <asp:Repeater ID="rptlistnews" runat="server">
            <ItemTemplate>
            <article class="media">
                <figure class="photo-media">
                    <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%></a>
                </figure>
                &nbsp;<div class="text-media">
                    <h2 class="tt-media" href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'> <a><%# Eval("NEWS_TITLE")%></a></h2>
                    <p><%# Eval("NEWS_DESC")%></p>
                </div>
            </article>
            </ItemTemplate>
        </asp:Repeater>
        <p class="pagination clearfix">
            <asp:Literal ID="ltrPage" runat="server"></asp:Literal>
        </p>
    </div>
</section>