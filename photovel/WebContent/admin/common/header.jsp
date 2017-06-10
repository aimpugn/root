<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/admin/common/head.jsp"%>
<%-- <% HttpSession session2 = request.getSession();
	Object loginInfo;
	if(session.getAttribute("loginInfo") instanceof Admin){
		loginInfo = (Admin) session.getAttribute("loginInfo");
	}else{
		loginInfo = (Admin) session.getAttribute("loginInfo");
	}
%> --%>
<script>
$(function(){
	var $header = $("header");
	var $a = $header.find("a");
	var today = new Date(); 
	//console.log(today);
	var fullyear = today.getFullYear();
	var cur_year = fullyear.toString().substring(2,4);
	var cur_month = today.getMonth() + 1;
	var cur_day = today.getDate();
	
	var todayDate = (cur_year+ '/' + cur_month + '/'+cur_day)

	//console.log(todayDate);

	$a.click(function(){
		var url = $(this).attr("href");
		var data = todayDate;
		$.ajax({
			url: url,
			method: 'post',
			data : data,
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
});

</script>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Photovel 어드민</a>
			</div>
			
			<div id="navbar" class="navbar-collapse collapse navbar-right">
				<p class="navbar-text narvar-right">Welcome <% if(loginInfo != null) { %>${sessionScope.loginInfo.adminNickName}<% } %>!</p>
				<ul class="nav navbar-nav">
					
					
					<li><a href="/photovel/admin/common/logout.html">로그아웃</a></li>
					<li><a href="/photovel/admin/member/member.html">회원관리</a></li>
					<li><a href="/photovel/admin/board/board.html">게시글관리</a></li>
					<li><a href="/photovel/admin/static/static.html">통계관리</a></li>
					<li><a href="/photovel/admin/main/main.html">메인관리</a></li>
				</ul>
			</div>
		</div>
	</nav>