<%@ page contentType="text/html; charset=UTF-8"%>
    <!-- 어드민 추가  Modal -->
	<div class="modal fade" id="adminModal" tabindex="-1" role="dialog" aria-labelledby="adminModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form id="adminAdd">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="adminModalLabel">관리자 추가</h4>
					</div>
					
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<label for="inputAdminId" class="col-sm-2 control-label">아이디</label> 
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputAdminId" placeholder="아아디: 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAdminPassword1" class="col-sm-2 control-label">비밀번호  1</label> 
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputAdminPassword1" placeholder="패스워드1: 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAdminPassword2" class="col-sm-2 control-label">비밀번호 2</label> 
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputAdminPassword2" placeholder="패스워드2: 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAdminNickName" class="col-sm-2 control-label">닉네임</label> 
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputAdminNickName" placeholder="닉네임: 영문, 숫자. 20자 이내">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">상태</label>
								<div class="col-sm-10 form-inline">
									<div class="radio">
										<label for="adminState1"> 
											<input type="radio" name="adminState" id="adminState1" value="N" checked> 
											정상
										</label>
									</div>

									<div class="radio">
										<label for="adminState2"> 
											<input type="radio" name="adminState" id="adminState2" value="S"> 
											중지
										</label>
									</div>
									
									<div class="radio">
										<label for="adminState3"> 
											<input type="radio" name="adminState" id="adminState3" value="L"> 
											탈퇴
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="adminCancle" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button id="adminConfirm" type="submit" class="btn btn-primary" data-dismiss="modal">Submit changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</form>
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 어드민 추가 모달윈도우 스크립트  -->
	<script>
    $(function () { $('#adminModal').modal('hide') });
    </script>
	<script>
	$(function () { 
		//var $formAdmin= $('#formAdminAdd');
		$('#adminModal').on('hide.bs.modal', function () {
	    	//alert('saved change..');
		});
		
		//추가하기
		$('#adminConfirm').click(function () {
			
			// 입력된 Id, Password, NickName 얻기
			var admin_id = $('#inputAdminId').val();
			var admin_password = $('#inputAdminPassword1').val();
			var admin_nickname = $('#inputAdminNickName').val();
			// 입력된 라디오 버튼의 value 얻기
			var state = document.getElementsByName('adminState');
			var checkedIndex = -1;
			var admin_state_flag = '';
			for( i=0; i<state.length; i++ ) {
				if(state[i].checked) {
					checkedIndex = i;
					admin_state_flag = state[i].value;
				}
			}
			var data = {'admin_id': admin_id, 'admin_password': admin_password, 'admin_nickname': admin_nickname, 'admin_state_flag': admin_state_flag};
			console.log(data);
			$.ajax({
				url: '/admin',
				method: 'POST',
				data: data,
				success: function(responseData){
					var data = responseData.trim();
					//console.log(data);
					//if( data == '1' ){
						location.href='/admin/member/admin';
					//} else{
					//	alert("잘못된 정보입니다.");
					//}
				},
				error: function(xhr, status, error){
					
				}
			});
			return false;
		});
	});
    </script>
    