﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialActivitiesDetail.ascx.cs" Inherits="kibitravel.web.Usercontrols.SocialActivitiesDetail" %>

<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc1" %>
<%@ Register src="Toolbar.ascx" tagname="Toolbar" tagprefix="uc2" %>
<uc2:Toolbar ID="Toolbar1" runat="server" />
<uc1:Path ID="Path1" runat="server" />
<section class="content">
      <article class="iblock detail-news"> 
        <h1 class="tt-detail-news"><asp:Label ID="lbNewsTitle" runat="server" /></h1>
        <asp:Literal ID="liHtml" runat="server"></asp:Literal>        
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
    </section>