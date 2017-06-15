<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="to_date" class="java.util.Date" />
<fmt:formatDate value="${requestScope.to_date}" pattern="yyyy-MM-dd" var="to_date"/>
<jsp:useBean id="fromfrom_date" class="java.util.Date" />
<fmt:formatDate value="${requestScope.from_date}" pattern="yyyy-MM-dd" var="from_date"/>

<jsp:useBean id="adminSignDate" class="java.util.Date" />
<c:set var="adminList" value="${requestScope.adminList}" />
<%-- <c:set var="from_date" value="${requestScope.from_date}" />
<c:set var="to_date" value="${requestScope.to_Date}" /> --%>
<c:set var="len" value="${fn:length(adminList)}"/>
<%--  head
------------------------------------------- --%>
<%@include file="/admin/include/head.jsp" %>
<script>
$(function() {

<%-- 라디오 상태별 검색 --%>
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
			}
			//error: function(xhr, status, error){
			//	alert("조회가 되지 않았습니다. 관리자에게 문의");
			//}
		});
	});
		
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
	
<%-- 체크박스 : 사용 상태로 변경  --%>
 	var $btnNormal = $('button[name=btnNormal]');
	$btnNormal.click(function(){
		
		var flag = confirm('사용으로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');

  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		

			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminNormal',
                 method:'put',
                 data: data,
                 success:function(responseData){
                	 console.log("응답결과:" +responseData);
                     if(responseData.trim() =='1'){
                       alert("사용 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("사용 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
		
     });	
		
<%-- 체크박스 : 중지 상태로 변경 --%>
 	var $btnStop = $('button[name=btnStop]');
	$btnStop.click(function(){
		var flag = confirm('중지로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');

  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		

			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminStop',
                 method:'put',
                 data: data,
                 success:function(responseData){
                	 console.log("응답결과:" +responseData);
                     if(responseData.trim() =='1'){
                       alert("중지 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("중지 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
		
     });
	
	
<%-- 체크박스 : 탈퇴 상태로 변경 --%>
 	var $btnLeave = $('button[name=btnLeave]');
	$btnLeave.click(function(){
		
		var flag = confirm('탈퇴로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');

  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		

			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminLeave',
                 method:'put',
                 data: data,
                 success:function(responseData){
                	 console.log("응답결과:" +responseData);
                     if(responseData.trim() =='1'){
                       alert("탈퇴 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("탈퇴 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
		
     });
	

<%-- 검색창 --%>
	var $btnSearch = $('button[name=btnSearch]');
	$btnSearch.click(function(){
		var to_date = new Date($('input[name=toDate]').val());
		var from_date = new Date($('input[name=fromDate]').val());
		
		var $searchValue = $('input[name=searchValue]').val();
		var $searchItem= $('#searchItem option:selected').val();
		
		<%-- 기간 검색 --%>
		if('' != to_date && '' != from_date ){
			var data = {'from_date': from_date, 'to_date' : to_date};
			console.log(data);
	        $.ajax({
	        	url:'/admin/adminSearch',
	             method:'get',
	             data: data,
	           	 success: function(responseData){
	    				var data = responseData.trim();
	    				var $parentObj=$("body");
	    	           	var data = responseData.trim();
	    	            $parentObj.empty();
	    	           	$parentObj.html(data);
	             },
		        error: function(xhr, status, error){
					return false;
				}
	       	});
	       	return false;	
		} else if ('' == to_date || '' == from_date  &&  '' != $searchValue){
			var data={"searchValue": $searchValue, "searchItem": $searchItem};
			$.ajax({
				url:'/admin/adminSearchValue',
				method: 'post',
				data: data,
				success:function(responseData){
					 var $parentObj=$("article");
		           	 var data = responseData.trim();
		           	 $parentObj.empty();
		           	 $parentObj.html(data);
				}
			});
			return false;
			console.log(data);
	        $.ajax({
	        	url:'/admin/adminSearchDate',
	             method:'get',
	             data: data,
	           	 success: function(responseData){
	    				var data = responseData.trim();
	    				var $parentObj=$("body");
	    	           	var data = responseData.trim();
	    	            $parentObj.empty();
	    	           	$parentObj.html(data);
	             },
		        error: function(xhr, status, error){
					return false;
				}
	       	});
	       	return false;	
		};
		
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
				<form id="search" class="form-inline" role="search">
					<div class="form-group">
						
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" disabled
									style="cursor: pointer">
									<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
								</button>
							</span> 
							
							<input type="date" class="form-control" name="fromDate" 
								<c:choose>
									<c:when test="${!empty from_date}">
										value="${to_date}"
									</c:when> 
									<c:otherwise></c:otherwise> 
								</c:choose>  
							>
							
						</div>
						&nbsp;-&nbsp;
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" disabled
									style="cursor: pointer">
									<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
								</button>
							</span> 
							<input type="date" class="form-control"  name="toDate" 
								<c:choose>
									<c:when test="${!empty to_date}">
										value="${to_date}"
									</c:when> 
									<c:otherwise></c:otherwise> 
								</c:choose>  
							>
						</div>
					</div>
					<div class="form-group ">
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								검색어 선택 
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">전체</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">아아디</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">닉네임</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">상태</a></li>
							</ul>
							<input type="text" class="form-control" placeholder="Search">
							<button type="submit" class="btn btn-primary" name="btnSearch" >Submit</button>
						</div>
					</div>
					<%-- 상태별 보기 라디오 버튼 --%>
					<div class="btn-group radio">
					<c:choose>

						<c:when test="${param.admin_status_flag == 'S'}">
							<label for="showStatus1" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus1" value="N">사용
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
								<input type="radio" name="showStatus" id="showStatus1" value="N">사용
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
								<input type="radio" name="showStatus" id="showStatus1" value="N" checked>사용
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
						<button type="button" name="btnNormal"	class="btn btn-default">사용</button>
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
								<td><input class="chk${status.index + 1} checkMember" name="chk" type="checkbox" value="${admin.admin_id}"></td>
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
