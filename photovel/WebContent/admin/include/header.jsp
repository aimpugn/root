<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.photovel.vo.Admin" %>
<c:set var="admin" value="${requestScope.adm}" />

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
	
	var todayDate = (cur_year+ '.' + cur_month + '.'+cur_day)

	//console.log(todayDate);

	$a.click(function(){
		var url = $(this).attr("href");
		var data = todayDate;
		$.ajax({
			url: url,
			method: 'get',
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
	
	//현재 header 메뉴 위치 표시 
	// 현재페이지 표시하기	
	var url = location.href;
	var folderArray = new Array(
			//통계
			url.indexOf("/photovel/admin/static"),
			//멤버
			url.indexOf("/photovel/admin/member"),
			//콘텐츠
			url.indexOf("/photovel/admin/board"),
			//사이트
			url.indexOf("/photovel/admin/site")
	);

	if(folderArray[0] != -1){
	    $("#navbar li:eq(1)").addClass("active");
	};
	if(folderArray[1] != -1){
	    $("#navbar li:eq(2)").addClass("active");
	};
	if(folderArray[2] != -1){
	    $("#navbar li:eq(3)").addClass("active");
	};
	if(folderArray[3] != -1){
	    $("#navbar li:eq(4)").addClass("active");
	};
	
});

</script>

<%-- <% HttpSession session2 = request.getSession();
Object loginInfo;
	if(session.getAttribute("loginInfo") instanceof Admin){
		loginInfo = (Admin) session.getAttribute("loginInfo");
	}else{
		loginInfo = (Admin) session.getAttribute("loginInfo");
	}
 if(loginInfo == null) { %>
response.sendRedirect(/photovel/admin);
	<% } else { %>
	 --%>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Photovel 어드민</a>
			</div>
			
			<div id="navbar" class="navbar-collapse collapse navbar-right">
				<p class="navbar-text narvar-right">Welcome ${adm.adminNickName}님!</p>
				<ul class="nav navbar-nav">
					<li><a href="/photovel/admin/common/logout">로그아웃</a></li>
					<li><a href="/photovel/admin/static/dashboard.jsp">통계관리</a></li>
					<li><a href="/photovel/admin/member/member.jsp">회원관리</a></li>
					<li><a href="/photovel/admin/board/board.jsp">게시글관리</a></li>
					<li><a href="/photovel/admin/site/mainCustom.jsp">사이트관리</a></li>
				</ul>
			</div>
		</div>
	</nav>