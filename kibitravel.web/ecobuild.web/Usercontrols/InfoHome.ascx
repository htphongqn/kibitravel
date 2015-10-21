<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InfoHome.ascx.cs" Inherits="kibitravel.web.Usercontrols.InfoHome" %>

<section class="section2">
    <div class="container">
    <div class="col6">
        <p class="tt-sp"> <i class="fa fa-comment-o"></i> What Client Say </p>
        <img src="data/h1.jpg" /> </div>
    <div class="col-sp col3">
        <p class="tt-sp"><i class="fa fa-skype"></i> Online support </p>
        <p class="sp-item"><a class="sk"><img src="images/sk.png" /></a> <span>Consultant 1</span></p>
        <p class="sp-item"><a class="sk"><img src="images/sk.png" /></a> <span>Consultant 2</span></p>
    </div>
    <!--end col-->
    <div class="col-sp col3">
        <p class="tt-sp"> <i class="fa fa-newspaper-o"></i> News </p>
        <script type="text/javascript">
			$(document).ready(function(){
			    $('.slider5').bxSlider({
				    mode: 'vertical',
				slideWidth: 400,
				minSlides: 1,
				moveSlides: 1,
				maxSlides: 1,
				slideMargin: 5,
				auto: true,
				speed: 2000,
				controls: true,
				pause: 2000,
			    });
			});
			</script>
        <div class="slide-news">
        <div class="slider5">
            <div class="slide">
            <article class="media">
                <div class="text-media">
                <h2 class="tt-media"> <a>DIVE INTO ‘INFINITY’ WITH DIZZYING VIEWS OF A COLOSSAL CAVE</a></h2>
                <p class="date-time-news">03 JUL 2015</p>
                <p class="text-media">By Jane J. Lee Interactive and photographs by Martin Edström PUBLISHED MAY 20, 2015 Son Doong is one of the world’s largest caves, with...</p>
                </div>
            </article>
            <!--End article--> 
            </div>
            <div class="slide">
            <article class="media">
                <div class="text-media">
                <h2 class="tt-media"> <a>DIVE INTO ‘INFINITY’ WITH DIZZYING VIEWS OF A COLOSSAL CAVE</a></h2>
                <p class="date-time-news">03 JUL 2015</p>
                <p class="text-media">By Jane J. Lee Interactive and photographs by Martin Edström PUBLISHED MAY 20, 2015 Son Doong is one of the world’s largest caves, with...</p>
                </div>
            </article>
            <!--End article--> 
            </div>
            <div class="slide">
            <article class="media">
                <div class="text-media">
                <h2 class="tt-media"> <a>DIVE INTO ‘INFINITY’ WITH DIZZYING VIEWS OF A COLOSSAL CAVE</a></h2>
                <p class="date-time-news">03 JUL 2015</p>
                <p class="text-media">By Jane J. Lee Interactive and photographs by Martin Edström PUBLISHED MAY 20, 2015 Son Doong is one of the world’s largest caves, with...</p>
                </div>
            </article>
            <!--End article--> 
            </div>
        </div>
        </div>
    </div>
    </div>
</section>