<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enListNews.ascx.cs" Inherits="ecobuild.Usercontrols.enListNews" %>

<div class="bor2">
    <div class="control-top"> 
        <span><asp:Label ID="lbNewsTitle" runat="server" /></span> 
        <a href="/home.html" class="back-to"><i class="fa fa-mail-reply"></i> Back</a> 
        <a href="/home.html" class="bk-home"><i class="fa fa-home"></i></a> 
    </div>
    <asp:PlaceHolder ID="plNews" runat="server">
    <div class="testDiv">
    <div class="iblock list-media">
        <div style="width: 100%;text-align: center;"><asp:Label ID="lblMsg" runat="server" Font-Size="14"/></div>
        <asp:Repeater ID="rptlistnews" runat="server">
        <ItemTemplate>
            <article class="media">
                <figure class="photo-media">
                    <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'>
                        <%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%>
                    </a>
                </figure>
                <div class="text-media">
                    <h2 class="tt-media"> <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'><%# Eval("NEWS_TITLE")%></a></h2>
                    <p><%# Eval("NEWS_DESC")%></p>
                </div>
            </article>
        </ItemTemplate>
        </asp:Repeater>
        <p class="pagination clearfix"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></p>
    </div>
    </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="plGlobal" runat="server">
        <div class="testDiv" style="width:100% !important;">
            <div class="iblock globalcontact">
                <div class="list-country">
                <asp:Repeater ID="rptGlobal" runat="server">
                <ItemTemplate>
                    <figure class="img-country"> 
                        <%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%>
                        <p><%# Eval("NEWS_TITLE")%></p>
                        <p class="popup-flag"> 
                            <%# Eval("NEWS_DESC")%> 
                        </p>
                    </figure>
                </ItemTemplate>
                </asp:Repeater>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
    <div class="control-bottom"> <a href="javascript:history.back()" class="back-to"><i class="fa fa-mail-reply"></i> Back</a>
        <nav class="breadcrumb">
            <ul>
                <li><a href="/">Trang chủ</a></li>
                <li><a href="/san-pham.htm">Tin tức</a></li>
            </ul>
        </nav>
    </div>
</div>