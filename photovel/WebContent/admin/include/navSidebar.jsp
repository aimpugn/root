<%@ page contentType="text/html; charset=UTF-8"%>
<script>
$(function(){
	var $header = $("header");
	var $a = $header.find("a");

	$a.click(function(){
		var url = $(this).attr("href");

		$.ajax({
			url: url,
			method: 'get',
			success: function(responseData){
				if(url =='logout.do'){
					location.href = responseData.trim();
				} else{
					$("article").empty();
					$("article").html(responseData.trim());
				}
			}
		});
		return false;
	});
	
	// 현재페이지 표시하기	
	var url = location.href;
	var pageArray = new Array(
			//통계
			url.indexOf("/admin/static/dashboard.jsp"),
			url.indexOf("/admin/static/member.jsp"),
			url.indexOf("/admin/static/con.jsp"),
			url.indexOf("/admin/static/borad.jsp"),
			
			//멤버
			url.indexOf("/admin/member/member.jsp"),
			url.indexOf("/admin/member/admin"),
			
			//콘텐츠
			url.indexOf("/admin/board/board.jsp"),
			
			//사이트
			url.indexOf("/admin/site/mainSlide.jsp"),
			url.indexOf("/admin/site/term.jsp"),
			url.indexOf("/admin/site/privacy.jsp"),
			url.indexOf("/admin/site/gpsTerm.jsp")
	);
	if(pageArray[0] != -1){
	    $(".sidebar li:eq(0)").addClass("active");
	};
	if(pageArray[1] != -1){
	    $(".sidebar li:eq(1)").addClass("active");
	};
	if(pageArray[2] != -1){
	    $(".sidebar li:eq(2)").addClass("active");
	};
	if(pageArray[3] != -1){
	    $(".sidebar li:eq(3)").addClass("active");
	};
	if(pageArray[4] != -1){
	    $(".sidebar li:eq(4)").addClass("active");
	};
	if(pageArray[5] != -1){
	    $(".sidebar li:eq(5)").addClass("active");
	};
	if(pageArray[6] != -1){
	    $(".sidebar li:eq(6)").addClass("active");
	};
	if(pageArray[7] != -1){
	    $(".sidebar li:eq(7)").addClass("active");
	};
	if(pageArray[8] != -1){
	    $(".sidebar li:eq(8)").addClass("active");
	};
	if(pageArray[9] != -1){
	    $(".sidebar li:eq(9)").addClass("active");
	};
	if(pageArray[10] != -1){
	    $(".sidebar li:eq(10)").addClass("active");
	};
	if(pageArray[11] != -1){
	    $(".sidebar li:eq(11)").addClass("active");
	};

	/*for (i=0; i < pageArray.length ; i++){
			
			if(pageArray[i] != -1){
			    $("li:eq(i)").addClass("active");
			    console.log(pageArray[i]);
			};
	}*/
		
});

</script>
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li>
						<a href="/admin/static/dashboard.jsp">대시보드
					<!-- <span class="sr-only">(current)</span-->
						</a>
					</li>
					<li><a href="/admin/static/member.jsp">회원통계</a></li>
					<li><a href="/admin/static/con.jsp">접속통계</a></li>
					<li><a href="/admin/static/board.jsp">게시글통계</a></li>
<!-- 					<li><a href="/admin/static/advertise.jsp">광고 통계</a></li> -->
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="/admin/member/member.jsp">회원 목록</a></li>
					<li><a href="/admin/member/admin">관리자 목록</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="/admin/board/board.jsp">콘텐츠 목록</a></li>
					<!-- <li><a href="/admin/board/advertise.jsp">광고 목록</a></li> -->
				</ul>

				<ul class="nav nav-sidebar">
					<li><a href="/admin/site/mainSlide.jsp">메인슬라이드</a></li>
					<li><a href="/admin/site/term.jsp">이용약관</a></li>
					<li><a href="/admin/site/privacy.jsp">개인정보처리방침</a></li>
					<li><a href="/admin/site/gpsTerm.jsp">위치정보이용약관</a></li>
				</ul>
			</div>