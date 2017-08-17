/* Selectbox Show & HIde */
function showHide(doID){
	var showing = document.getElementById(doID);
	var select_arrow = showing.parentNode.getElementsByTagName("dt")[0];
	if (showing.style.display == "" || showing.style.display=="none") {
		showing.style.display = "block";
		if (select_arrow) select_arrow.className = "open";
		showing.onmouseover = function () {
			showing.style.display="block";
			if (select_arrow) select_arrow.className = "open";
		}
		showing.onfocus = function () {
			showing.style.display="block";
			if (select_arrow) select_arrow.className = "open";
		}
		showing.onblur = function () {
			showing.style.display="none";
			if (select_arrow) select_arrow.className = "";
		}
		showing.onmouseout = function () {
			showing.style.display="none";
			if (select_arrow) select_arrow.className = "";
		}
	}else {
		showing.style.display="none";
		if (select_arrow) select_arrow.className = "";
	}
}
/* END Selectbox Show & HIde */

jQuery(document).ready(function($){
	/* LNB */
	var gnbNum = -1;
	var snbNum = -1;

	$(function(){
		getLocationInfo();
		if(gnbNum != -1) actSub();
		$(".nav-menu>li").on({
			"mouseenter rollover focus":function(){
				if(gnbNum != -1) {
					$(".nav-menu").children("li").eq(gnbNum).removeClass("on");
				}
				$(".lnb").stop().animate({height:400},300);
				$(this).addClass("on");
				$(".lnb").css("border-bottom","2px solid #dcdcdc");
				$(".main-navigation").css("background","#fff url('/images/front/bg_lnb_ov.png') repeat-x 0 0");
				$(".lnb .sub-menu").css("display","block");
			},"mouseleave rollout blur":function(){
				$(this).removeClass("on");
				$(".lnb").stop().animate({height:54},300);
				if(gnbNum != -1) {
					actSub()
				}
				$(".lnb").css("border-bottom","none");
				$(".main-navigation").css("background","none");
				$(".lnb .sub-menu").css("display","none");
			}
		});
	});

	function getLocationInfo()
	{
		if(location.pathname.indexOf("file_or_folder_name") > -1) {gnbNum = 0;}
		if(location.pathname.indexOf("file_or_folder_name") > -1) {gnbNum = 1;}
		if(location.pathname.indexOf("file_or_folder_name") > -1) {gnbNum = 2;}
		if(location.pathname.indexOf("file_or_folder_name") > -1) {gnbNum = 3;}
		if(location.pathname.indexOf("file_or_folder_name") > -1) {gnbNum = 4;}
	}

	function actSub(){
		$(".nav-menu").children("li").eq(gnbNum).addClass("on");
	}

	/* Tab : 입찰공고, 공지사항 */
	$(document).on("mouseenter focus",".lately dt a",function(){
		$(".lately .on").removeClass("on");
		$(this).addClass("on");
		$(".lately dd").hide();
		$(this).parent().next().show();
		$(".lately dt a").on("click",function(){
			return false;
		});
	});

	/* Tab : 좌석배치도 */
	$(document).on("click focus",".page-tab-dl dt a",function(){
		$(".page-tab-dl .on").removeClass("on");
		$(this).addClass("on");
		$(".page-tab-dl dd").hide();
		$(this).parent().next().show();
	});

	/* Tab : 페이지 검색 - 일주일, 한달 */
	$(document).on("click focus",".period-sch li a",function(){
		$(".period-sch .active").removeClass("active");
		$(this).addClass("active");
		$(".period-sch li a").on("click",function(){
			return false;
		});
	});

	// Coex MICE Cluster
	$(document).on("click focus",".cmc-0103 .conts-tab-dl dt a",function(){
		$(".conts-tab-dl .on a").css("background-image",$(".conts-tab-dl .on a").css("background-image").replace("_ov.png",".png"));
		$(".conts-tab-dl .on").removeClass("on");
		$(this).parent().addClass("on");
		$(this).css("background-image",$(this).css("background-image").replace(".png","_ov.png"));
		$(".conts-tab-dl dd").hide();
		$(this).parent().next().show();
	});
	// 그린코엑스 > Sustainable Management
	$(document).on("click focus",".coex-0502 .conts-tab-dl dt a",function(){
		$(".conts-tab-dl .on").removeClass("on");
		$(this).addClass("on");
		$(".conts-tab-dl dd").hide();
		$(this).parent().next().show();
	});
	$(document).on("click focus",".coex-0503 .conts-tab-dl dt a",function(){
		$(".conts-tab-dl .on").removeClass("on");
		$(this).addClass("on");
		$(".conts-tab-dl dd").hide();
		$(this).parent().next().show();
	});
	//이용안내 > 개인정보 취급방침
	$('.guide-01 #list_atag li a').click( function( e ) {
		var head_height = $('#masthead').height();
		var head_position = $('#masthead').css('position');
		var fix_height = head_height + 20;
		if(head_position == 'relative' ){
			fix_height = 0;
		}
		var li_id = $(this).data('li_position');
		var target = $("#"+li_id);
		$(document).scrollTop(target.offset().top-fix_height);
	});

	$('.guide-03 #list_atag li a').click( function( e ) {
		var head_height = $('#masthead').height();
		var head_position = $('#masthead').css('position');
		var fix_height = head_height + 20;
		if(head_position == 'relative' ){
			fix_height = 0;
		}
		var li_id = $(this).data('li_position');
		var target = $("#"+li_id);
		$(document).scrollTop(target.offset().top-fix_height);
	});
	
	//시설/임대 > 회의시설/임대 > 회의실 시설안내
	$(".floor-4 .layerpop-1").bind("mouseenter focus", function() {
		$(".floor-4 .layerpop-1 .pop-box").css({"display":"block"});
	});
	$(".floor-3 .layerpop-1").bind("mouseenter foucs", function() {
		$(".floor-3 .layerpop-1 .pop-box").css({"display":"block"});
	});
	$(".floor-3 .layerpop-2").bind("mouseenter foucs", function() {
		$(".floor-3 .layerpop-2 .pop-box").css({"display":"block"});
	});
	$(".floor-3 .layerpop-3").bind("mouseenter foucs", function() {
		$(".floor-3 .layerpop-3 .pop-box").css({"display":"block"});		
	});
	$(".floor-2 .layerpop-1").bind("mouseenter focus", function() {
		$(".floor-2 .layerpop-1 .pop-box").css({"display":"block"});
	});
	$(".floor-1 .layerpop-1").bind("mouseenter focus", function() {
		$(".floor-1 .layerpop-1 .pop-box").css({"display":"block"});
	});
	// 마우스 롤아웃시 레이어 팝업 감추기.
	$(".floor-4 .layerpop-1").bind("mouseleave blur", function() {
		$(".floor-4 .layerpop-1 .pop-box").css({"display":"none"});
	});
	$(".floor-3 .layerpop-1").bind("mouseleave blur", function() {
		$(".floor-3 .layerpop-1 .pop-box").css({"display":"none"});
	});
	$(".floor-3 .layerpop-2").bind("mouseleave blur", function() {
		$(".floor-3 .layerpop-2 .pop-box").css({"display":"none"});
	});
	$(".floor-3 .layerpop-3").bind("mouseleave blur", function() {
		$(".floor-3 .layerpop-3 .pop-box").css({"display":"none"});
	});
	$(".floor-2 .layerpop-1").bind("mouseleave blur", function() {
		$(".floor-2 .layerpop-1 .pop-box").css({"display":"none"});
	});
	$(".floor-1 .layerpop-1").bind("mouseleave blur", function() {
		$(".floor-1 .layerpop-1 .pop-box").css({"display":"none"});
	});

	$(".lease-020302 #sel-type").change(function() {
		var index = $("#sel-type option:selected").val();
		$(".cont-01").hide();
		$(".cont-02").hide();
		$(".cont-03").hide();
		$(".cont-04").hide();
		$(".cont-05").hide();
		$(".cont-06").hide();
		$(".cont-"+index).show();
	});

	$(function(e){ 
	  $('.cmc-0103 .airline-list > li:nth-child(4n)').css('margin-right','0'); 
	  $('.guide-list > li:nth-child(odd)').css('background-color','#eaeaea'); 
	  $('.history > li:nth-child(odd)').css('background-color','#f3f3f3'); 
	  $('.history > li:nth-child(odd) .his-year').css('background-image','url(/images/sub/coex_0702.png)'); 
	  $('.con-box figure:nth-child(odd)').css('margin-left','0');
	  $('.sitemap > li:nth-child(4n)').css('margin-right','0'); 
	});

	$(document).on("click focus",".tour-01 .conts-tab dt a",function(){
		$(".conts-tab .on").removeClass("on");
		$(this).addClass("on");
		$(".conts-tab dd").hide();
		$(this).parent().next().show();
	});

	$(".tour-010204 .cont-02 .first").css("height",($(".cont-02 .second").height()+2)+"px");

	/* Quick Rollover *
	$(".quick-type > li > a").on("mouseover focus",function(){
		$(".quick-type > li > .on").removeClass("on");
		$(this).addClass("on");
		$(this).css("background-image",$(this).css("background-image").replace(".png","_ov.png"));
	});
	$(".quick-type > li > a").on("mouseout blur",function(){
		$(".quick-type > li > .on").removeClass("on");
		$(this).css("background-image",$(this).css("background-image").replace("_ov.png",".png"));
	});
	* END Quick Rollover */

	//퀵메뉴 스마트폰 버젼
	$('.mquick-type .mquick').on('click', function(e){
		e.preventDefault();
		var q_id = $(this).data('num');
		if($('.mq-on-'+q_id).is(":visible")){
			$('.mquick-type').animate({'padding-bottom':'40px'}, "slow");
			$('.mquick-conts').hide();
			$(this).find('>.mq-arr').removeClass('mq-arr-on');
		}else{
			$('.mquick-conts').hide();
			$('.mq-on-'+q_id).show();
			$('.mquick-type').animate({'padding-bottom':'134px'}, "slow");
			$('.mq-arr').removeClass('mq-arr-on');
			$(this).find('>.mq-arr').addClass('mq-arr-on');
		}
	});

	$('.btn-allmenu').on('click', function(e){
		// 올메뉴 버튼 클릭
		e.preventDefault();
		open_all_menu();
		return false;
	});
	$("#dmm").on('click', function(e){
		close_all_menu();
	});
	$("#allmenu_close").on('click', function(e){
		close_all_menu();
	});

	$('.allmenu .depth1').each(function(){
		var $curruentDepth1 = $(this); // 루프에서 현재depth1 객체
		$(this).find('>a').bind('click', function(){
			$('.allmenu .depth1').not(':eq(' + $curruentDepth1.index() + ')').find('.depth2').hide("blind");
			$('.allmenu .depth1').not(':eq(' + $curruentDepth1.index() + ')').find('>a').removeClass('on');
			$curruentDepth1.find('.depth2').toggle("blind");
			if($(this).hasClass('on')){
				$(this).removeClass('on');
			}else{
				$(this).addClass('on');
			}
		});
	});

	$('.allmenu .depth2_s').each(function(){
		var $curruentDepth2 = $(this); // 루프에서 현재depth2 객체
		$(this).find('>a').bind('click', function(){
			$('.allmenu .depth2_s').not($curruentDepth2).find('.depth3').hide("blind");
			$('.allmenu .depth2_s').not($curruentDepth2).find('>a').removeClass('on');
			$curruentDepth2.find('.depth3').toggle("blind");
			if($(this).hasClass('on')){
				$(this).removeClass('on');
			}else{
				$(this).addClass('on');
			}
		});
	});

	function close_all_menu(){
		if($('#allmenu').is(":visible")){
			$('#allmenu').toggle("slide");
			$("html").css("overflow-y","scroll");
			$("#allmenu").css("overflow-y","hidden");
			$("#dmm").hide();
		}
	}
	function open_all_menu(){
		$('#allmenu').toggle("slide", function(){
			$("html").css("overflow-y","hidden");
			$("#allmenu").css("overflow-y","scroll");
			$("#dmm").show();
		});
	}



	//입주오피스안내
	$('#menu-item-367').hide();
	$('a[href="http://www.coex.co.kr/facility-lease/office/office-rent-guidance"]').hide();


});


	