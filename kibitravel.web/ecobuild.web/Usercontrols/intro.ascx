<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="intro.ascx.cs" Inherits="ecobuild.Usercontrols.intro" %>
<link rel="stylesheet" type="text/css" href="/Resources/styles/intro.css"/>
<div class="bor2 intro-page"> 
    <!---================HEADER===================--> 
    <script>
	//slider nivo 2
		$(window).load(function() {
		$('#slider-intro').nivoSlider({	
			controlNavThumbs: true,
			pauseOnHover: true,
			controlNav: true,
		});
	});
	</script> 
    <!---================MAIN MENU===================-->
    <figure class="slider-intro">
    <div class="theme-default slider-wrapper-detail">
        <div id="slider-intro" class="nivoSlider"> 
        <asp:Repeater ID="Rpimg_small1" runat="server">
        <ItemTemplate>
            <a href="#"><img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" data-thumb="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>"  /></a> 
        </ItemTemplate>
        </asp:Repeater>
        </div>
    </div>
    </figure>
</div>
<script type="text/javascript" src="/Resources/scripts/js.js"></script> 
<script type="text/javascript" src="/Resources/scripts/jquery.nivo.slider.js"></script>