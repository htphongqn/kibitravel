$(function () {
    var pull = $('#pull');
    btnClose = $('#btnClose');
    menu = $('.navx > ul');
    navx = $('.navx');
    menuli = $('.navx > ul > li');
    menuli_ul = $('.navx > ul > li>ul');
	$(".closeIco").hide();
    menuHeight = menu.height();
	var btnOpenS = $('.openIco');
	var btnCloseS= $('.closeIco');

    $(btnOpenS).on('click', function (e) {
        e.preventDefault();
        menu.slideToggle();
		btnCloseS.show();
		btnOpenS.hide();
    });
	$(btnCloseS).on('click', function (e) {
        e.preventDefault();
        menu.slideToggle();
 		btnOpenS.show();
		btnCloseS.hide();
    });
    $(btnClose).on('click', function (e) {
        e.preventDefault();
        menu.slideToggle();
    });
    var w1 = $(window).width();
    if (w1 < 768) {
        navx.addClass("navxMb");
        menuli_ul.addClass('dropdown');
        menuli.on('click', function () {
		if ($(this).find('ul.dropdown').is(':hidden')) {
			$(this).find('ul.dropdown').slideToggle();
			$(this).find('ul.dropdown').addClass('open');
		}
		else {
			$(this).find('ul.dropdown').slideToggle();
			//$(".closeIco").hide();
			return;
		}
        });
    }
	
	if (w1 > 768){
		$( ".navx ul ul" ).addClass("wow fadeInUp");
		$( ".navx li li" ).append("<i class='fa fa-circle'></i>");
	}
     
	$( ".navx>ul>li" ).has( "ul" ).addClass("parent");
	
	$( ".list-media article" ).addClass("wow fadeInUp");
	$( ".hot-tour, .tour-mt, .tt-mt, .media-blog" ).addClass("wow fadeInUp");
	 $( ".pagination a, .pagination b" ).addClass("wow rotateInUpLeft");
  
	  $(".search-icon").on('click', function (e) {
        e.preventDefault();
        $(".search-h").slideToggle();
 
 
    });
 
	
	
});

$(function () {
	//$( ".navy >ul > li" ).prepend("<i class='fa fa-caret-right'></i>");
	//$( ".detail-destination .navy ul li" ).prepend("<i class='fa fa-bookmark'></i>");
	//$( ".navx>ul> li:last-child>a").attr("href", "blog.htm");
});
////list bestdeals
 $( ".item-bestdeals:nth-child(6n+1),.item-bestdeals:nth-child(6n)" ).addClass("w50");


//slider nivo
 $(window).load(function() {
	$('#slider').nivoSlider();
});
//slider nivo
 $(window).load(function() {
	$('#slider-ht').nivoSlider();
});
//slider nivo 2
 $(window).load(function() {
	$('#slider2').nivoSlider({	
	 controlNavThumbs: true,
        pauseOnHover: true,
		controlNav: true,
	});
});
 
 //back top
  (function($){
	$.fn.UItoTop = function(options) {

 		var defaults = {
			text: '',
			min: 500,			
			scrollSpeed: 800,
  			containerID: 'back-top',
  			containerClass: 'fa fa-chevron-up',
			easingType: 'linear'
					
 		};

 		var settings = $.extend(defaults, options);
		var containerIDhash = '#' + settings.containerID;
		var containerHoverIDHash = '#'+settings.containerHoverID;
			
		$('body').append(' <a href="#" id="'+settings.containerID+'" class="'+settings.containerClass+'" >'+settings.text+'</a> ');		
		
		$(containerIDhash).hide().click(function(){			
			$('html, body').stop().animate({scrollTop:0}, settings.scrollSpeed, settings.easingType);
			$('#'+settings.containerHoverID, this).stop().animate({'opacity': 0 }, settings.inDelay, settings.easingType);
			return false;
		})
		
								
		$(window).scroll(function() {
			var sd = $(window).scrollTop();
			if(typeof document.body.style.maxHeight === "undefined") {
				$(containerIDhash).css({
					'position': 'absolute',
					'top': $(window).scrollTop() + $(window).height() - 50
				});
			}
			if ( sd > settings.min ) 
				$(containerIDhash).stop(true,true).fadeIn(600);
			else 
				$(containerIDhash).fadeOut(600);
		});
};
})(jQuery);

 
//popup search
 
 var notH = 1,
$pop = $('.popupSearch').hover(function () { notH ^= 1; });

  $(document).on('mouseup keyup', function (e) {
	  if (notH || e.which == 27) $pop.stop().hide();
  });
  $('.popupSearch').hide();
$(document).ready(function () {
  $('.trigger').click(function () {
	  $('.popupSearch').slideToggle();  
  });
  $('.btn-close').click(function () {
	  $('.popupSearch').slideUp('fast');
  });
}); 