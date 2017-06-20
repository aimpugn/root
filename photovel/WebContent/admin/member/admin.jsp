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
<c:set var="searchCategory" value="${requestScope.searchCategory}" />
<c:set var="searchItem" value="${requestScope.searchItem}" />
<c:set var="len" value="${fn:length(adminList)}"/>

<%--  head
------------------------------------------- --%>
<%@include file="/admin/include/head.jsp" %>
<%@include file="/admin/include/scriptMemberAdmin.jsp" %>
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
					<div class="form-group ">
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

						<c:when test="${param.admin_state_flag == 'S'}">
							<label for="showStatus1" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus1" value="A">전체
							</label>
							<label for="showStatus2" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus2" value="N">사용
							</label>
							<label for="showStatus3" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus3" value="S" checked>중지
							</label>
							<label for="showStatus4" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus4" value="L">탈퇴
							</label>
						</c:when>
						<c:when test="${param.admin_state_flag == 'L'}">
							<label for="showStatus1" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus1" value="A">전체
							</label>
							<label for="showStatus2" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus2" value="N">사용
							</label>
							<label for="showStatus3" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus3" value="S">중지
							</label>
							<label for="showStatus4" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus4" value="L" checked>탈퇴
							</label>
						</c:when>
						<c:otherwise>
							<label for="showStatus1" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus1" value="A" checked>전체
							</label>
							<label for="showStatus2" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus2" value="N">사용
							</label>
							<label for="showStatus3" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus3" value="S">중지
							</label>
							<label for="showStatus4" class="checkbox-inline"> 
								<input type="radio" name="showStatus" id="showStatus4" value="L">탈퇴
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
						<button type="button" name="btnLeave" 	class="btn btn-warning">탈퇴</button>
						<button type="button" name="btnStop" 	class="btn btn-warning">중지</button>
						<button type="button" name="btnNormal"	class="btn btn-warning">사용</button>
					</div>
					<%-- 조회 인원 --%>
					<div class="btn-group radio">
						<span class="checkbox-inline text-default">조회 인원:</span> <span class="text-primary">${len}명</span>
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
										<c:when test="${admin.admin_state_flag == 'L'}">
											<span class="text-danger">탈퇴</span>
										</c:when>
										<c:when test="${admin.admin_state_flag == 'S'}">
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
