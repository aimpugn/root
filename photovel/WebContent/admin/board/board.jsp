<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="boardList" value="${requestScope.boardList}" />
<c:set var="len" value="${fn:length(boardList)}"/>

<jsp:useBean id="to_date" class="java.util.Date" />
<fmt:formatDate value="${requestScope.to_date}" pattern="yyyy-MM-dd" var="to_date"/>
<jsp:useBean id="fromfrom_date" class="java.util.Date" />
<fmt:formatDate value="${requestScope.from_date}" pattern="yyyy-MM-dd" var="from_date"/>

<jsp:useBean id="boardWirteDate" class="java.util.Date" />
<c:set var="searchCategory" value="${requestScope.searchCategory}" />
<c:set var="searchItem" value="${requestScope.searchItem}" />

<%--  head ------------------------------------------- --%>
<%@include file="/admin/include/head.jsp" %>
<%@include file="/admin/board/scriptBoard.jsp" %>

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
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">제목</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">공개상태</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">신고상태</a></li>
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
						<c:when test="${param.content_delete_status == 'F'}">
							<label for="showState1" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState1" value="A">전체
							</label>
							<label for="showState3" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState3" value="F" checked>정상
							</label>
							<label for="showState2" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState2" value="T">삭제
							</label>
							<label for="showState4" class="checkbox-inline"> 
								<input type="radio" name="showState" id="sshowState4" value="M">관리자 삭제
							</label>
						</c:when>
						<c:when test="${param.content_delete_status== 'T'}">
							<label for="showState1" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState1" value="A">전체
							</label>
							<label for="showState23" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState3" value="F">정상
							</label>
							<label for="showState2" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState2" value="T" checked>삭제
							</label>
							<label for="showState4" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState4" value="M">관리자 삭제
							</label>
						</c:when>
						
						<c:when test="${param.content_delete_status == 'M'}">
							<label for="showState1" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState1" value="A">전체
							</label>
							<label for="showState3" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState3" value="F">정상
							</label>
							<label for="showState2" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState2" value="T">삭제
							</label>
							<label for="showState4" class="checkbox-inline"> 
								<input type="radio" name="showState" id="sshowState4" value="M" checked>관리자 삭제
							</label>
							
						</c:when>
						<c:otherwise>
							<label for="showState1" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState1" value="A" checked>전체
							</label>
							<label for="showState3" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState3" value="F">정상
							</label>
							<label for="showState2" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState2" value="T">삭제
							</label>
							<label for="showState4" class="checkbox-inline"> 
								<input type="radio" name="showState" id="showState4" value="M">관리자 삭제
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
				<div class="btn-toolbar" aria-label="StatusButton">
				<%-- 삭제, 관리자 삭제, 정상 --%>
					<div class="btn-group" role="group">
						<button type="button" name="btnDelete" 	class="btn btn-warning">삭제</button>
						<button type="button" name="btnAdminDelte"	class="btn btn-warning">관리자 삭제</button>
						<button type="button" name="btnNormal" 	class="btn btn-warning">정상</button>
					</div>
					<div class="btn-group radio">
						<span class="checkbox-inline text-default">조회 게시글:</span> <span class="text-primary">${len}건</span>
					</div>
					
					<%-- 게시글 추가 버튼 --%>
					<div class="btn-group pull-right" role="group">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalContent">게시글 추가</button>
					</div>
				</div>
				<hr style="border: 1px solid #eee">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th><input type="checkbox" aria-label="check-member"></th>
								<th>NO</th>
								<th>콘텐츠아이디</th>
								<th>콘텐츠제목</th>
								<th>공유수</th>
								<th>게시자</th>
								<th>게시일</th>
								<th>공개여부</th>
								<th>신고</th>
								<th>게시상태</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${len==0}">
							<tr>
								<td colspan="10" class="text-center">게시글 정보가 없습니다.</td>
							</tr>
							</c:when>
							
							<c:otherwise>
							<c:forEach var="board" items="${boardList}" varStatus="status">
							<tr>
								<td><input class="chk${status.index + 1} checkMember" name="chk" type="checkbox" value="${content.content_id}"></td>
								<td>${len - status.index}</td>
								<td>${content.content_id}</td>
								<td><a href="/admin/board/content/view">${content.content_subject}</a></td>
								<td>${content.share_count}</td>
								<td>${user.user_id}</td>
								<td>${content_written_date}</td>
								<td>
									<%-- 비공개(T)/공개(F) --%>
									<c:choose>
										<c:when test='${"T" == content_private_flag}'>
											<span class="text-warning">비공개</span>
										</c:when>
										<c:otherwise><span></span></c:otherwise>
									</c:choose>
								</td>
								<td>
									<%-- 신고 --%>
									<c:choose>
										<c:when test='${content_warning_status = 6}'><span class="text-warning">${content_warning_status}</span></c:when>
										<c:when test='${"M" == user.user_gender}'><span class="text-danger">정지</span></c:when>
										<c:otherwise><span></span></c:otherwise>
									</c:choose>
								</td>
								<td>
									<%-- 삭제(T)/정상(F)/어드민삭제(A:신고 6 점시 ) --%>
									<c:choose>
										<c:when test='${"T" == content_delete_status}'>
											<span class="text-warning">삭제</span>
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
<%@include file="/admin/board/modalBoard.jsp" %>
<%@include file="/admin/board/modalBoardUpdate.jsp"%>

</body>
</html>
