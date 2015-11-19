<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BesdealsDetail.ascx.cs" Inherits="kibitravel.web.Usercontrols.BesdealsDetail" %>

<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc1" %>

<uc1:Path ID="Path1" runat="server" />
<section class="content">
    <div class="iblock detail-destination">
    <div class="col3 col-nav">
        <h2 class="tt-detail-2"><asp:Label ID="lblTitleCat" runat="server"></asp:Label></h2>
        <div class="testDiv">
        <nav class="navy list-link-bestdeals">
            <ul>
                <asp:Repeater ID="Rptinkhac" runat="server">
                    <ItemTemplate>
                        <li> 
                            <h2 class="h2-link-bestdeals" title="<%# Eval("NEWS_TITLE") %>" href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>' style="text-align:right;"><a><%# Eval("NEWS_TITLE") %></a></h2>
                            <figure class="img-link"><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'><img src='<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%>' style="width:100% !important;"/></a></figure>  
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </nav>
        </div>
    </div>
    <!--end col--> 
    <script type="text/javascript" src="/Resources/Scripts/jquery.slimscroll.js"></script> 
    <script type="text/javascript">
    $(function(){
        $('.testDiv').slimScroll({
            disableFadeOut : false,
			alwaysVisible : true,
        });
        
    });
    </script>
    <link rel="stylesheet"  href="/Resources/styles/lightslider.css"/>
    <script src="/Resources/scripts/lightslider.js"></script> 
    <script>
        $(document).ready(function () {
            $("#content-slider").lightSlider({
                loop: true,
                keyPress: true
            });
            $('#image-gallery,#image-gallery-1 ').lightSlider({
                gallery: true,
                item: 1,
                thumbItem: 9,
                slideMargin: 0,
                speed: 1000,
                auto: true,
                loop: true,
                onSliderLoad: function () {
                    $('#image-gallery, #image-gallery-1').removeClass('cS-hidden');
                }
            });
        });
</script>
    <div class="col9" style="padding:0">
        <h1 class="tt-detail tt-detail-deals"><asp:Label ID="lbNewsTitle" runat="server" /> <a class="btn-order" href="/booktour.html">Book Now</a></h1>
        <script type="text/javascript" src="/Resources/scripts/tabcontent.js"></script>
        <link rel="stylesheet" type="text/css" href="/Resources/styles/tabcontent3.css"/>
        <ul class="tabs" data-persist="true">
        <li><a href="#view1"><asp:Literal ID="lbtab1" runat="server"></asp:Literal></a></li>
        <li><a href="#view2"><asp:Literal ID="lbtab2" runat="server"></asp:Literal></a></li>
        <li><a href="#view3"><asp:Literal ID="lbtab3" runat="server"></asp:Literal></a></li>
        </ul>
        <div class="tabcontents">
        <div id="view1"> 
            <!--begin-->
            <div class="col4">
            <p class="brand-s"><img src="/Resources/Images/logo-s.png" /></p>
            <div class="box-hl-dt">
                <asp:Literal ID="liHtml" runat="server"></asp:Literal>
            </div>
            </div>
            <div class="col8" style="padding-right:0; text-align:right">
            <div class="slide-detail-sc" style="background:#000; padding:5px">
                <div class="clearfix">
                <ul id="image-gallery-1" class="gallery list-unstyled cS-hidden">
                    <asp:Repeater ID="Rpalbumimg" runat="server">
                    <ItemTemplate>
                        <li data-thumb="<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMG_IMAGE1"))%>"> <img src="<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMG_IMAGE1"))%>" style="min-width:525px;"/> </li>
                    </ItemTemplate>
                    </asp:Repeater>
                </ul>
                </div>
            </div>
            <article class="txt-destination"><asp:Label ID="lblDesc" runat="server"></asp:Label><br />
            </article>
            </div>
            <!--end--> 
        </div>
        <!-- /*end view*/-->
        <div id="view2" >
            <!--begin-->
            <div class="col4">
                <p class="brand-s"><img src="/Resources/Images/logo-s.png" /></p>
                <div class="box-hl-dt">
                    <asp:Literal ID="liHtmlItinerary" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="col8" style="padding-right:0; text-align:right">
                <div class="slide-detail-sc" style="background:#000; padding:5px">
                <div class="clearfix">
                    <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                    <asp:Repeater ID="Rpalbumimg1" runat="server">
                    <ItemTemplate>
                        <li data-thumb="<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMG_IMAGE1"))%>"> <img src="<%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMG_IMAGE1"))%>" /> </li>
                    </ItemTemplate>
                    </asp:Repeater>
                    </ul>
                </div>
                </div>
                <article class="txt-destination"><asp:Label ID="lblDesc1" runat="server"></asp:Label><br />
                </article>
            </div>
            <!--end--> 
        </div>
        <!-- /*end view*/-->
        <div id="view3"> 
            <!--begin--> 
              <asp:Literal ID="liHtmlPrices" runat="server"></asp:Literal>
            <!--end-->               
        </div>
        <!-- /*end view*/--> 
        </div>
    </div>
    <div class="col9" style="padding:0"> </div>
    </div>
</section>