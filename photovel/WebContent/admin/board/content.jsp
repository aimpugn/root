<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="content_written_date" class="java.util.Date" />
<!-- content.content_id content_id, user.user_id user_id, user_nick_name, content_subject, content_share_count, content_written_date, photo_file_name,
		(select count(*) from content JOIN good ON content.content_id = good.content_id) good_count, 
		(select count(*) from content JOIN comment ON content.content_id = comment.content_id) comment_count,
		(select count(*) from content JOIN content_detail ON content.content_id = content_detail.content_id) content_detail_count
	FROM content JOIN user ON content.user_id = user.user_id JOIN photo ON photo.content_id = content.content_id  
	GROUP by photo_file_name
	ORDER BY content_written_date ASC

contentList -->

<c:set var="contentList" value="${requestScope.contentList}" />
<c:set var="len" value="${fn:length(contentList)}"/>

<jsp:useBean id="to_date" class="java.util.Date" />
<fmt:formatDate value="${requestScope.to_date}" pattern="yyyy-MM-dd" var="to_date"/>
<jsp:useBean id="from_date" class="java.util.Date" />
<fmt:formatDate value="${requestScope.from_date}" pattern="yyyy-MM-dd" var="from_date"/>

<jsp:useBean id="boardWirteDate" class="java.util.Date" />
<c:set var="searchCategory" value="${requestScope.searchCategory}" />
<c:set var="searchItem" value="${requestScope.searchItem}" />

<%--  head ------------------------------------------- --%>
<%@include file="/admin/include/head.jsp" %>
<%@include file="/admin/board/scriptContent.jsp" %>

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
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">회원 아이디</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">콘텐츠 아이디</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">콘텐츠 제목</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">공개 상태</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">신고 상태</a></li>
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
								<input type="radio" name="showState" id="showState3" value="F" checked>게시
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
								<input type="radio" name="showState" id="showState3" value="F">게시
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
								<input type="radio" name="showState" id="showState3" value="F">게시
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
								<input type="radio" name="showState" id="showState3" value="F">게시
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
				<%-- 삭제, 관리자 삭제, 게시 --%>
					<div class="btn-group" role="group">
						<button type="button" name="btnDelete" 	class="btn btn-warning">사용자 삭제</button>
						<button type="button" name="btnManagerDelete"	class="btn btn-warning">관리자 삭제</button>
						<button type="button" name="btnNormal" 	class="btn btn-warning">게시</button>
					</div>
					<div class="btn-group radio">
						<span class="checkbox-inline text-default">조회 게시글:</span> <span class="text-primary">${len}건</span>
					</div>
					
					<%-- 콘텐츠 추가 버튼 --%>
					<div class="btn-group pull-right" role="group">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalContentAdd">콘텐츠 추가</button>
					</div>
				</div>
				<hr style="border: 1px solid #eee">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th><input type="checkbox" aria-label="check-member"></th>
								<th>NO</th>
								<th>콘텐츠 아이디</th>
								<th>콘텐츠제목</th>
								<th>회원 아이디</th>
								<th>게시일</th>
								<th>공유수</th>
								<th>공개여부</th>
								<th>신고상태</th>
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
							<c:forEach var="content" items="${contentList}" varStatus="status">
							<tr>
								<td><input class="chk${status.index + 1} checkMember" name="chk" type="checkbox" value="${content.content_id}"></td>
								<td>${len - status.index}</td>
								<td>${content.content_id}</td>
								<td><a href="/admin/board/content/view">${content.content_subject}</a></td>
								<td>${content.user.user_id}</td>
								<td>
									<fmt:formatDate value="${content.content_written_date}" pattern="yyyy.MM.dd"/>
								</td>
								<td>${content.content_share_count}</td>
								<td>
									<%-- 비공개(T)/공개(F) --%>
									<c:choose>
										<c:when test="${'T' == content_private_flag}">
											<span class="text-warning">비공개</span>
										</c:when>
										<c:otherwise><span class="text-default">공개</span></c:otherwise>
									</c:choose>
								</td>
								<td>
									<%-- 신고 --%>
									<c:choose>
										<c:when test='${ 5 >= content.content_warning_status  &&  1 <= content.content_warning_status}'><span class="text-warning">${content.content_warning_status}</span></c:when>
										<c:when test='${ 6 <= content.content_warning_status}'><span class="text-danger">정지</span></c:when>
										<c:otherwise><span>0</span></c:otherwise>
									</c:choose>
								</td>
								<td>
									<%-- 삭제(T)/게시(F)/관리자 삭제(M신고 6 점시, 또는 관리자 개별 판단에 의한 삭제) --%>
									<c:choose>
										<c:when test="${'T' == content.content_delete_status}">
											<span class="text-warning">삭제</span>
										</c:when>
										<c:when test="${'M' == content.content_delete_status}">
											<span class="text-warning">관리자 삭제</span>
										</c:when>
										<c:otherwise><span class="text-default">게시</span></c:otherwise>
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
<%@include file="/admin/board/modalContentAdd.jsp" %>
<%@include file="/admin/board/modalContentUpdate.jsp"%>

</body>
</html>
