<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="adminSignDate" class="java.util.Date" />
<c:set var="adminList" value="${requestScope.adminList}" />
<c:set var="len" value="${fn:length(adminList)}"/>
<%--  head
------------------------------------------- --%>
<%@include file="/admin/include/head.jsp" %>
<script>
$(function() {
	
<%-- 체크박스 --%>
	function allCheckFunc( obj ) {
		//낱개 체크박스의 프라퍼티가 체크드이면 obj에 체크드 속성을 표시한다. 
		$("input[name=chk]").prop("checked", $(obj).prop("checked") );
	}
	
	/* 체크박스 체크시 전체선택 체크 여부 */
	function chkboxFunc(obj){
		var allObj = $("input[name=chkAll]"); //전체선택 체크박스 
		var objName = $(obj).attr("name"); // obj네임은 체크드 된 낱개 체크박스의 이름을 갖는다.
	
		if( $(obj).prop("checked") ){//낱개 체크박스 체크드이면
			checkBoxLength = $("input[name="+ objName +"]").length;//낱개 박스의 갯수를 구한다.
			checkedLength = $("input[name="+ objName +"]:checked").length;//체크된 낱개 박스의 갯수를 구한다.
	
			if( checkBoxLength == checkedLength ) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		}else{
			allObj.prop("checked", false);
		}
	}
	
	//전체체크박스클릭시 
	$(function(){
		$("input[name=chkAll]").click(function(){
			allCheckFunc( this );
		});
		$("input[name=chk]").each(function(){
			$(this).click(function(){
				chkboxFunc( $(this) );
			});
		});
	});

		
	/* 탈퇴 */
/* 	var $btnLeave = $('input[name=btnLeave]');
	$btnLeave.click(function(){
		var flag = confirm('선택된 아이디가 탈퇴로 변경됩니다. 진행하시겠습니까?');
	
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('.check');

			for(var i = 0 ; i <checkbox.length; i++){ //체크된 회원의 아이디 얻기
			  	if(checkbox[i].checked == true){
					chkList[cnt]=checkbox[i].value;
	                cnt++;
	            }
			}

			
       	};
    	return false;	
	}); */
	
	/* 중지 */
/* 	var $btnStop = $('input[name=btnStop]');
	$btnStop.click(function(){
		// 어드민 아이디 구하기	
		var ans = confirm("선택된 아이디의 사용을 중지하시겠습니까?");
		if(ans == true){
			$('input[type=checkbox]:checked').each(function(){
				var adminIdList = new Array();
				var adminStatusFlagList = new Array();
			
		   		adminIdList = $(this).parent().siblings('.tdAdminID').children('a').text();
		   		adminStatusFlagList = $(this).parent().siblings('.tdAdminStatusFlag').children('span').text();
		   		
		   		
		   		jQuery.ajaxSettings.traditional = true;
		   		
				$.ajax({
					url: '/member/adminStop',
					method: 'PUT',
					data: {'adminIdList': adminIdList, 'adminStatusFlagList': adminStatusFlagList, '': },
					success: function(responseData){
						 if( (responseData) != "-1" ){
								alert("전송완료");
								var $parentObj=$("article");
				            	var data = responseData.trim();
				            	$parentObj.empty();
				            	$parentObj.html(data);								
						} else{
							alert("실패");
						}
					},
					error: function(xhr, status, error){
						alert("실패. 관리자에 문의하세요.");
						console.log(status, error);
					}
				});
				return false;
			});
		} else{
			alert('삭제취소');
		};
		return false;
    	
	});
	return false; */
	
	
	
	/* // 입력된 라디오 버튼의 value 얻기
	
	var status = document.getElementsByName('showStatus');
	var checkedIndex = -1;
	var admin_status_flag = '';
	for( i=0; i<status.length; i++ ) {
		if(status[i].checked) {
			checkedIndex = i;
			admin_status_flag = status[i].value;
		}
	}
	
	var data = {'admin_id': admin_id, 'admin_password': admin_password, 'admin_nickname': admin_nickname, 'admin_status_flag': admin_status_flag};
	$.ajax({
		url: '/admin/adminAdd',
		method: 'POST',
		data: data,
		success: function(responseData){
			var data = responseData.trim();
			console.log(data);
			if( data == '1' ){
				location.href='/admin/member/admin';
			} else{
				alert("잘못된 정보입니다.");
			}
		},
		error: function(xhr, status, error){
			
		}
	});
	return false; */
	
	/* 라디오 상태별 검색 */
	$('input[name=showStatus]').click(function(){
		var admin_status_flag = $(this).val();
		var data = {'admin_status_flag' : admin_status_flag};
		console.log(admin_status_flag);
		$.ajax({
			url:'/admin/adminStatus',
			method: 'GET',
			data: data,
			success: function(responseData){
				var data = responseData.trim();
				var $parentObj=$("body");
	           	var data = responseData.trim();
	            $parentObj.empty();
	           	$parentObj.html(data);
	           
			},
			error: function(xhr, status, error){
				alert("조회가 되지 않았습니다. 관리자에게 문의");
			}
		});
	});
}); 
	
</script>
</head>

<body>
<%--  header
------------------------------------------- --%>
<%@include file="/admin/include/header.jsp" %>

	<div class="container-fluid">
		<div class="row">
		
			<%--  navSidebar
			------------------------------------------- --%>
			<%@include file="/admin/include/navSidebar.jsp" %>
		
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<%--  navSidebar
				------------------------------------------- --%>
				<%@include file="/admin/include/breadcrumb.jsp" %>
				
				
				<%-- search --%>
				<form class="navbar-form" role="search">
					<div class="col-lg-6">
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" disabled
									style="cursor: pointer">
									<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
								</button>
							</span> <input type="date" class="form-control">
						</div>
						&nbsp;-&nbsp;
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" disabled
									style="cursor: pointer">
									<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
								</button>
							</span> <input type="date" class="form-control">
						</div>
					</div>

					<div class="col-lg-6">
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								검색어 선택 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">전체</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">아아디</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">닉네임</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">상태</a></li>
							</ul>
							<input type="text" class="form-control" placeholder="Search">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
				</form>
			</div>
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<hr style="border: 1px solid #eee">
			</div>
			
			<%--  버튼 --%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<div class="btn-toolbar" aria-label="...">
					<%-- 탈퇴, 중지, 정상 --%>
					<div class="btn-group" role="group">
						<button type="button" name="btnLeave" 	class="btn btn-default">탈퇴</button>
						<button type="button" name="btnStop" 	class="btn btn-default">중지</button>
						<button type="button" name="btnNormal"	class="btn btn-default">정상</button>
					</div>
					
					<%-- 상태별 보기 라디오 버튼 --%>
					<div class="radio">
					<c:choose>

						<c:when test="${param.admin_status_flag == 'S'}">
							<label for="showStatus1" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus1" value="N">정상
							</label>
							<label for="showStatus2" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus2" value="S" checked>중지
							</label>
							<label for="showStatus3" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus3" value="L">탈퇴
							</label>
						</c:when>
						<c:when test="${param.admin_status_flag == 'L'}">
							<label for="showStatus1" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus1" value="N">정상
							</label>
							<label for="showStatus2" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus2" value="S">중지
							</label>
							<label for="showStatus3" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus3" value="L" checked>탈퇴
							</label>
						</c:when>
						<c:otherwise>
							<label for="showStatus1" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus1" value="N" checked>정상
							</label>
							<label for="showStatus2" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus2" value="S">중지
							</label>
							<label for="showStatus3" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus3" value="L">탈퇴
							</label>
						</c:otherwise>
					</c:choose>
					</div>
					<%-- 어드민 추가 버튼 --%>
					<div class="btn-group" role="group" style="float: right">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#adminModal">어드민 추가</button>
					</div>
				</div>
				<hr style="border: 1px solid #eee">
			
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th><input id="chkAll" type="checkbox" name="chkAll" aria-label="chkAll"></th>
								<th>NO</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>닉네임</th>
								<th>가입일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						
				
						
							
							<c:choose>
							<c:when test="${len==0}">
							<tr>
								<td colspan="7" class="text-center">해당 정보가 없습니다.</td>
							</tr>
							</c:when>
							
							<c:otherwise>
							<c:forEach var="admin" items="${adminList}" varStatus="status">
							<tr>
								<td><input class="chk${status.index + 1}" name="chk" type="checkbox"></td>
								<td>${len - status.index}</td>
								<td class="tdAdminId"><a href="#">${admin.admin_id}</a></td>
								<td>${admin.admin_password}</td>
								<td>${admin.admin_nickname}</td>
								<td><fmt:formatDate value="${admin.admin_sign_date}" pattern="yyyy.MM.dd"/></td>
								<td class="tdAdminStatusFlag">
									<c:choose>
										<c:when test="${admin.admin_status_flag == 'L'}">
											<span class="text-muted">탈퇴</span>
										</c:when>
										<c:when test="${admin.admin_status_flag == 'S'}">
											<span class="text-primary">중지</span>
										</c:when>
										<c:otherwise><span></span></c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
							</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<%--  pagination
		   		------------------------------------------- --%>
				<%@include file="/admin/include/pagination.jsp" %>
			</div>
		</div>
	</div>

<%--  footer
------------------------------------------- --%>
<%@include file="/admin/include/footer.jsp" %>

<%-- Modal --%>  
<%@include file="/admin/member/modalAdmin.jsp" %>
</body>
</html>
