<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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