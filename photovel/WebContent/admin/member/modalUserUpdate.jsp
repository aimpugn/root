<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>window.jQuery || document.write('<script src="/bootstrap/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="/admin/bootstrap/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="/admin/bootstrap/assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/admin/bootstrap/assets/js/ie10-viewport-bug-workaround.js"></script>

    
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
$(function () { $('#modalUserId').modal('hide') });
</script>
<script>
$(function () { 
	
	$('#modalUserId').on('hide.bs.modal', function () {
	   
	});
	
	///////////////////////// 모달창에 데이터 넣기 ////////////////////////  //
	$('.modalUserId').click(function(){
		var user_id = $(this).text();
		console.log(user_id);
		
		//var data = {'user_id' : user_id};
		$.ajax({
			url:'/admin/member/user/'+user_id, 
			method: 'GET',
			success: function(responseData){
				var data = responseData.trim();
				var $parentObj=$("#formUserUpdate");
	           	var data = responseData.trim();
	            $parentObj.empty();
	           	$parentObj.html(data);
			}
		});
		$('#modalUserId').modal('show');
	});
});		
</script>	

