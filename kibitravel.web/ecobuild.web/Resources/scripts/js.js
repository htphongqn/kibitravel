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
		$( ".navx>ul>li>ul" ).addClass("wow fadeInUp");
	$( ".navx ul ul ul" ).addClass("wow fadeInUp");
	$( ".navx-intro li li" ).append("<i class='fa fa-circle'></i>");
	}
     
	$( ".navx>ul>li" ).has( "ul" ).addClass("parent");
	
	//$( ".media" ).addClass("wow fadeInUp");
	 //$( ".pagination a, .pagination b" ).addClass("wow rotateInUpLeft");
  
	  $(".search-icon").on('click', function (e) {
        e.preventDefault();
        $(".search-h").slideToggle();
    });	
	
	
});

$(function () {
	 
	$( ".navy >ul > li" ).append("<i class='fa fa-caret-right'></i>"); 
	var w = $(window).width();
		if (w < 768) {
			$( ".navy .tt-side" ).append("<i class='fa fa-plus-square-o'></i>");
		}
		 arrowplus = $('.navy .tt-side i.fa');
		 $(arrowplus).on('click', function (e) {
		 
		$( ".navy  ul" ).slideToggle();
	});
	//sub menu here 
	$( ".navx-it>ul > li >ul" ).append("<i class='fa fa-close'></i>"); 
 	$( ".navx-it>ul>li" ).has("ul").addClass("parentli");
 $(".parentli>a").removeAttr("href");
	
	$( ".navx-it>ul>li>a>i" ).click(function() {
		$( ".navx-it>ul>li>ul").fadeOut("fast");
		$( this ).parent("a").parent("li").children("ul").toggle();
	});
	
	$( ".navx-it>ul>li>ul").children("i.fa").click(function() {
		$( this ).parent("ul").fadeOut();
	});
	
	
	$( ".navx-it ul" ).click(function() {
		$( this ).children("ul").slideUp();
	 });
	 
	// img-country
	 //popup-flag
	 
	 $( ".img-country .popup-flag " ).append("<i class='fa fa-close'></i>");
	 // 
	  $( ".popup-flag i.fa").click(function() {
		$( this ).parent(".popup-flag").fadeOut();
	}); 
//	 $( ".img-country > i " ).click(function() {
//		 
//		$( this ).parent(".img-country").children("popup-flag").toggle();
//	});
	
	 $( ".img-country >img" ).click(function() {});
	 
	 $( ".img-country >img" ).click(function() {
		 $(".popup-flag").fadeOut("fast");
		$( this ).parent(".img-country ").children(".popup-flag").fadeIn();
	 });
//	var icon= $( ".navx-it ul li li" ).size();
//	 if(icon>=9)
//	 	$( ".navx-it ul li" ).addClass("many-ico");
//		
	 
	 //end sub menu here
	 
});


//slider nivo
 $(window).load(function() {
	$('#slider').nivoSlider();
});

////slider nivo 2
// $(window).load(function() {
//	$('#slider-intro').nivoSlider({	
//	 controlNavThumbs: true,
//        pauseOnHover: true,
//		controlNav: true,
//	});
//});
 
//popup search
 
// var notH = 1,
//$pop = $('.popupSearch').hover(function () { notH ^= 1; });
//
//  $(document).on('mouseup keyup', function (e) {
//	  if (notH || e.which == 27) $pop.stop().hide();
//  });
//  $('.popupSearch').hide();
//$(document).ready(function () {
//  $('.trigger').click(function () {
//	  $('.popupSearch').slideToggle();  
//  });
//  $('.btn-close').click(function () {
//	  $('.popupSearch').slideUp('fast');
//  });
//}); 

var bodyHeight = $(window).width(); //retrieve current window width

var windowWidth = $(window).width(); //retrieve current window width
var windowHeight = window.innerHeight; //retrieve current window height
var documentWidth = $(document).width(); //retrieve current document width
var documentHeight = $(document).innerHeight(); //retrieve current document height
var vScrollPosition = $(document).scrollTop(); //retrieve the document scroll ToP position
var hScrollPosition = $(document).scrollLeft(); //retrieve the document scroll Left position
//$( ".bor1").height(documentHeight);
//$( ".testDiv").height(documentHeight)-200;
//  $( ".bor2").height(documentHeight)-200;
// 
//$(window).resize(function() {
//  $( ".bor1").height(documentHeight);
//  $( ".testDiv").height(documentHeight)-200;
//  $( ".bor2").height(documentHeight)-200;
//});


var h1=$(".bor2").height();
$(".testDiv").height(h1);
//alert(h1-50);
 //document.getElementById("demo").innerHTML = h1;
$(window).resize(function() {
	
h1=$(".bor2").height();
$(".testDiv").height(h1);
$(".testDiv").css("height:", h1)
$(".theme-default").height(h1);
//document.getElementById("demo").innerHTML = h1;
	
});
//var height=window.innerHeight;
////$( ".bor1").height(height);
////$( ".testDiv").height(height)-200;
////$( ".bor2").height(height)-200;
//var txt = "";
// 
//txt += "<p>innerHeight: " + window.innerHeight + "</p>";
// txt += "<p>outerHeight: " + window.outerHeight + "</p>";
//
