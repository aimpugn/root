<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

				<nav class="wrap-pagination">
					<ul class="pagination">
						<li>
							<a href="javascript:goPage(${param.firstPageNo})" class="first" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li>
							<a href="javascript:goPage(${param.prevPageNo})" class="prev" aria-label="Previous">
								<span aria-hidden="true">&lsaquo;</span>
							</a>
						</li>
						<c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
							<c:choose>
								<c:when test="${i eq param.pageNo}"><li><a href="javascript:goPage(${i})" class="choice active">${i}</a></li></c:when>
								<c:otherwise><li><a href="javascript:goPage(${i})">${i}</a></li></c:otherwise>
							</c:choose>
						</c:forEach>
						<li>
							<a href="javascript:goPage(${param.nextPageNo})" class="next" aria-label="Next">
								<span aria-hidden="true">&rsaquo;</span>
							</a>
						</li>
						<li>
							<a href="javascript:goPage(${param.finalPageNo})" class="last" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>