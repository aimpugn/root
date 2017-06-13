<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--  head ------------------------------------------- --%>
<%@include file="/admin/include/head.jsp" %>
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
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">

				<div class="btn-toolbar" aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">삭제</button>
						<button type="button" class="btn btn-default">탈퇴</button>
						<button type="button" class="btn btn-default">정상</button>
					</div>
					<div class="btn-group" role="group" style="float: right">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">회원 추가</button>
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
								<th>국가번호</th>
								<th>핸드폰번호</th>
								<th>최근접속일</th>
								<th>가입일</th>
								<th>탈퇴일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" aria-label="check-member"></td>
								<td>9,999</td>
								<td>origin</td>
								<td><a href="#">stella.park.korea@gmail.com</a></td>
								<td>********************</td>
								<td>Stella Park</td>
								<td>82</td>
								<td>010-1234-1234</td>
								<td>2017.08.01</td>
								<td>2017.08.01</td>
								<td>2017.08.01</td>
								<td>n(정상)</td>
							</tr>
							<tr>
								<td><input type="checkbox" aria-label="check-member"></td>
								<td>9,998</td>
								<td>origin</td>
								<td><a href="#">stella.park.korea@gmail.com</a></td>
								<td>********************</td>
								<td>Stella Park</td>
								<td>82</td>
								<td>010-1234-1234</td>
								<td>2017.08.01</td>
								<td>2017.08.01</td>
								<td>2017.08.01</td>
								<td>l(탈퇴)</td>
							</tr>
							<tr>
								<td><input type="checkbox" aria-label="check-member"></td>
								<td>9,997</td>
								<td>origin</td>
								<td><a href="#">stella.park.korea@gmail.com</a></td>
								<td>********************</td>
								<td>Stella Park</td>
								<td>82</td>
								<td>010-1234-1234</td>
								<td>2017.08.01</td>
								<td>2017.08.01</td>
								<td>2017.08.01</td>
								<td>b(블랙)</td>
							</tr>
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
<%@include file="/admin/member/modalMember.jsp" %>
</body>
</html>
