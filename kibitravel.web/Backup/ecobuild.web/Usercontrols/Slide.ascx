<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slide.ascx.cs" Inherits="kibitravel.web.Usercontrols.Slide" %>

<figure class="slider" role="slider">
    <div class="slider-wrapper theme-default">
        <div id="slider" class="nivoSlider">
            <asp:Repeater ID="rptAds" runat="server">
                <ItemTemplate>                 
                     <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
            </asp:Repeater> 
        </div>
    </div>
</figure>