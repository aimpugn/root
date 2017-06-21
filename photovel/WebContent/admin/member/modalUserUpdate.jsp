<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!--회원  정보 수정 Modal -->
	<div class="modal fade" id="modalUserId" tabindex="-1" role="dialog" aria-labelledby="modalUserIdLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<%--  RemoteModal ------------------------------------------- --%>
				<%@include file="/admin/member/modalUserUpdateBody.jsp" %>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

<script>
$(function () { $('#modalUserId').modal('hide')  });

$('#modalUserId').on('hide.bs.modal', function () {
});
</script>
    