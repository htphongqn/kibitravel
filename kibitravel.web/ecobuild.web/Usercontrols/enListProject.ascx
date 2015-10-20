<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enListProject.ascx.cs" Inherits="ecobuild.Usercontrols.enListProject" %>

<div class="bor2">
    <div class="control-top"> 
        <span><asp:Label ID="Lbtitle" runat="server"></asp:Label></span> 
        <a href="/home.html" class="back-to"><i class="fa fa-mail-reply"></i> Back</a> 
        <a href="/home.html" class="bk-home"><i class="fa fa-home"></i></a> 
    </div>
    <div class="testDiv">
    <div class="iblock list-media list-project">
        <div style="width: 100%;text-align: center;"><asp:Label ID="lblMsg" runat="server" Font-Size="14"/></div>
        <asp:Repeater ID="Rplistpro" runat="server">
        <ItemTemplate>
        <article class="media">
        <figure class="photo-media">
            <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" />
            </a>
        </figure>
        <div class="text-media">
            <h2 class="tt-media"> 
                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a>
            </h2>
            <p><%# Eval("NEWS_DESC") %></p>
            <a class="detail-link" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><i class="fa fa-external-link"></i> Chi tiết</a> 
        </div>
        </article>
        </ItemTemplate>
        </asp:Repeater>
        
        <p class="pagination clearfix"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></p>
    </div>
    </div>
    <!--/testDiv-->
      
    <div class="control-bottom"> <a href="javascript:history.back()" class="back-to"><i class="fa fa-mail-reply"></i> Back</a>
    <nav class="breadcrumb">
        <ul>
        <li><a href="/trang-chu.htm">Trang chủ</a></li>
        <li><a href="/san-pham.htm">Tin tức</a></li>
        </ul>
    </nav>
    </div>
</div>