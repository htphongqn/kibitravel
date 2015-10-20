<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsDetail.ascx.cs" Inherits="ecobuild.Usercontrols.NewsDetail" %>
<%@ Register src="Toolbar.ascx" tagname="Toolbar" tagprefix="uc1" %>
<uc1:Toolbar ID="Toolbar1" runat="server" />
<div class="bor2">
    <div class="control-top"> 
        <span><asp:Label ID="lbNewsTitle" runat="server" /></span> 
        <a href="/" class="back-to"><i class="fa fa-mail-reply"></i> Back</a> 
        <a href="/" class="bk-home"><i class="fa fa-home"></i></a> 
    </div>
    <div class="testDiv">
    <article class="iblock detail-news">
        <p class="tt-main"><span>Tin tức</span></p>
        <h1 class="tt-detail-news"><asp:Label ID="lblNewsTitle1" runat="server" /></h1>
        <asp:Literal ID="liHtml" runat="server"></asp:Literal>
        <div style="width: 100%;text-align: center;"><asp:Label ID="lblMsg" runat="server" Font-Size="14"/></div>
    </article>
    <div class="clearfix function">
        <div class="shareBox"> 
            <div class="addthis_toolbox addthis_default_style like_face shareBox">
                <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                </a>
                <script type="text/javascript">
                    var addthis_config = { "data_track_addressbar": true };
                    addthis_config = addthis_config || {};
                    addthis_config.data_track_addressbar = false;
                </script>
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50d418ab2d45f0aa"></script>
            </div>
        </div>
        <div class="toolbarBox"> 
            <a id="hplSendEmail" href="#" runat="server" class="email">Gửi email</a> 
            <a href="#" id="hplPrint" target="_blank" runat="server" class="print">Bản in</a> 
            <a href="#" id="hplFeedback" runat="server" class="opinion">Phản hồi</a>
        </div>
    </div>
    <!--function--> 
        
    <!--Other News-->
    <div class="clearfix otherNews" id="dvOtherNews" runat="server">
        <h3><span>Tin bài khác</span></h3>
        <ul>
            <asp:Repeater ID="Rptinkhac" runat="server">
                <ItemTemplate>
                    <li> 
                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %><small class="date">(Ngày đăng <%# getDate(Eval("NEWS_PUBLISHDATE")) %>)</small></a> 
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <!--Other News--> 
    </div>
      
    <div class="control-bottom"> <a href="javascript:history.back()" class="back-to"><i class="fa fa-mail-reply"></i> Back</a>
    <nav class="breadcrumb">
        <ul>
        <li><a href="/trang-chu.htm">Trang chủ</a></li>
        <li><a href="/san-pham.htm">Tin tức</a></li>
        </ul>
    </nav>
    </div>
</div>