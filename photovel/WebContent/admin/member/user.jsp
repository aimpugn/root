<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="to_date" class="java.util.Date" />
<fmt:formatDate value="${requestScope.to_date}" pattern="yyyy-MM-dd" var="to_date"/>
<jsp:useBean id="fromfrom_date" class="java.util.Date" />
<fmt:formatDate value="${requestScope.from_date}" pattern="yyyy-MM-dd" var="from_date"/>

<jsp:useBean id="userSignDate" class="java.util.Date" />
<c:set var="userList" value="${requestScope.userList}" />
<c:set var="searchCategory" value="${requestScope.searchCategory}" />
<c:set var="searchItem" value="${requestScope.searchItem}" />
<c:set var="len" value="${fn:length(userList)}"/>

<%--  head ------------------------------------------- --%>
<%@include file="/admin/include/head.jsp" %>
<%@include file="/admin/include/scriptMemberUser.jsp" %>

</head>
<body>
<%--  header ------------------------------------------- --%>
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
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
							</div>
							<input type="date" class="form-control" name="from_date" 
								<c:choose>
									<c:when test="${!empty from_date}">
										value="${from_date}"
									</c:when> 
									<c:otherwise></c:otherwise> 
								</c:choose>  
							>
						</div>
						&nbsp;-&nbsp;
						<div class="input-group">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
							</div>
							<input type="date" class="form-control"  name="to_date" 
								<c:choose>
									<c:when test="${!empty to_date}">
										value="${to_date}"
									</c:when> 
									<c:otherwise></c:otherwise> 
								</c:choose>  
							>
						</div>
					</div>
					<div class="form-group">
						<div class="dropdown">
							<button class="searchBtn btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								<c:choose>
									<c:when test="${!empty searchCategory}">
										${searchCategory}
									</c:when> 
									<c:otherwise>검색어</c:otherwise> 
								</c:choose>  
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">아이디</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">닉네임</a></li>
							</ul>
							<input type="text" class="form-control" name="searchItem"  
								<c:choose>
									<c:when test="${!empty searchItem}">
										value=${searchItem}
									</c:when> 
									<c:otherwise>placeholder="Search"</c:otherwise> 
								</c:choose>  
							>
							<button type="submit" class="btn btn-primary" name="btnSearch" >Submit</button>
						</div>
					</div>
					<%-- 상태별 보기 라디오 버튼 --%>
					<div class="form-group form-inline">
					<c:choose>
						<c:when test="${param.user_state_flag == 'N'}">
							<label for="showState1" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState1" value="A">전체
							</label>
							<label for="showState2" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState2" value="N" checked>일반
							</label>
							<label for="showState23" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState3" value="B">블랙
							</label>
							<label for="showState4" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState4" value="L">탈퇴
							</label>
						</c:when>
						<c:when test="${param.user_state_flag == 'B'}">
							<label for="showState1" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState1" value="A">전체
							</label>
							<label for="showState2" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState2" value="N">일반
							</label>
							<label for="showState3" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState3" value="B" checked>블랙
							</label>
							<label for="showState4" class="checkbox-inline"> 
								<input type="radio" name="showState" id="sshowState4" value="L">탈퇴
							</label>
						</c:when>
						<c:when test="${param.user_state_flag == 'L'}">
							<label for="showState1" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState1" value="A">전체
							</label>
							<label for="showState2" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState2" value="N">일반
							</label>
							<label for="showState3" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState3" value="B">블랙
							</label>
							<label for="showState4" class="checkbox-inline"> 
								<input type="radio" name="showState" id="sshowState4" value="L" checked>탈퇴
							</label>
							
						</c:when>
						<c:otherwise>
							<label for="showState1" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState1" value="A" checked>전체
							</label>
							<label for="showState2" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState2" value="N">일반
							</label>
							<label for="showState3" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState3" value="S">중지
							</label>
							<label for="showState4" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState4" value="L">탈퇴
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
				<%-- 탈퇴, 블랙, 사용 --%>
					<div class="btn-group" role="group">
						<button type="button" name="btnLeave" 	class="btn btn-warning">탈퇴</button>
						<button type="button" name="btnBlack" 	class="btn btn-warning">블랙</button>
						<button type="button" name="btnNormal"	class="btn btn-warning">일반</button>
					</div>
					<div class="btn-group radio">
						<span class="checkbox-inline text-default">조회 인원:</span> <span class="text-primary">${len}명</span>
					</div>
					
					<%-- 회원 추가 버튼 --%>
					<div class="btn-group pull-right" role="group">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalUser">회원 추가</button>
					</div>
				</div>
				<hr style="border: 1px solid #eee">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th><input type="checkbox" aria-label="check-member"></th>
								<th>NO</th>
								<th>가입구분</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>닉네임</th>
								<th>성별</th>
								<th>국가번호</th>
								<th>핸드폰번호</th>
								<th>최근접속일</th>
								<th>가입일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${len==0}">
							<tr>
								<td colspan="12" class="text-center">해당 정보가 없습니다.</td>
							</tr>
							</c:when>
							
							<c:otherwise>
							<c:forEach var="user" items="${userList}" varStatus="status">
							<tr>
								<td><input class="chk${status.index + 1} checkMember" name="chk" type="checkbox" value="${user.user_id}"></td>
								<td>${len - status.index}</td>
								<td class="tdUserSnS">
								<c:choose>
									<c:when test="${user.user_sns_status == 'K'}">
										<span class="text-warning">카카오</span>
									</c:when>
									<c:when test="${user.user_sns_status == 'F'}">
										<span class="text-primary">페이스북</span>
									</c:when>
									<c:when test="${user.user_sns_status == 'N'}">
										<span class="text-success">네이버</span>
									</c:when>
									<c:when test="${user.user_sns_status == 'G'}">
										<span class="text-danger">구글</span>
									</c:when>
									<c:otherwise><span class="text-default">일반</span></c:otherwise>
								</c:choose>
								</td>
								<td class="tdUserId"><a data-toggle="modal"  data-target="#modalUserId" href="#modalUserId">${user.user_id}</a></td>
								<td>${user.user_password}</td>
								<td>${user.user_nick_name}</td>
								<td>
									<c:choose>
										<c:when test='${"M" == user.user_gender}'>남</c:when>
										<c:otherwise>여</c:otherwise>
									</c:choose>
								</td>
								<td>${user.user_phone1}</td>
								<td>${user.user_phone2}</td>
								<td><fmt:formatDate value="${user.user_last_connection}" pattern="yyyy.MM.dd"/></td>
								<td><fmt:formatDate value="${user.user_sign_date}" pattern="yyyy.MM.dd"/></td>
								<td class="tdUserStateFlag">
									<c:choose>
										<c:when test="${user.user_state_flag == 'L'}">
											<span class="text-danger">탈퇴</span>
										</c:when>
										<c:when test="${user.user_state_flag == 'B'}">
											<span class="text-primary">블랙</span>
										</c:when>
										<c:otherwise><span>일반</span></c:otherwise>
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
<%@include file="/admin/member/modalUser.jsp" %>
</body>
</html>
