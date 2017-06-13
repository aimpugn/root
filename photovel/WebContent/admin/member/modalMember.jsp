<%@ page contentType="text/html; charset=UTF-8"%>

	<!--회원 추가  Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="formMemberAdd">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">회원 추가</h4>
					</div>
					
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<label for="inputId" class="col-sm-3 control-label">아이디</label> 
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputId" placeholder="아이디: 영문, 숫자. 40자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-sm-3 control-label">패스워드</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputPassword" placeholder="패스워드: 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputNickName" class="col-sm-3 control-label">닉네임</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputNickName" placeholder="닉네임 : 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputProfile" class="col-sm-3 control-label">프로필 사진</label> 
								<div class="col-sm-9">
									<input type="file" class="form-control" id="inputProfile">
								</div>
								<p class="help-block blockquote-reverse">jpg, png, gif. 500KB 이내</p>
							</div>
							<div class="form-group">
								<label for="inputNationCode" class="col-sm-3 control-label">전화번호</label> 
							
								<div class="col-sm-2 form-inline">
									<div class="dropdown">
									  <button class="btn btn-default dropdown-toggle" name="inputNationCode" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
									    	국가번호
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">82</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">33</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">44</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">49</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">60</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">61</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">62</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">63</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">81</a></li>								    
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">86</a></li>
									  </ul>
								  	</div>
								</div>
								<div class="col-sm-6">	
				               		<input type="tel" name="inputPhone" class="form-control" value="" size="37" maxlength="50" required="required" title="">
				              	</div>
								
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">상태</label>
								<div class="col-sm-9 form-inline">
									<div class="radio">
										<label> 
											<input type="radio" name="statusRadios" id="statusRadios1" value="n" checked> 
											정상
										</label>
									</div>
									<div class="radio">
										<label> 
											<input type="radio" name="statusRadios" id="statusRadios2" value="b"> 
											블랙
										</label>
									</div>
									<div class="radio disabled">
										<label> 
											<input type="radio" name="statusRadios" id="statusRadios3" value="l"> 
											탈퇴
										</label>
									</div>
								</div>
								
							</div>
						</div>
					
					</div>
					<div class="modal-footer">
					<button id="cancle" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button id="confirm" type="submit" class="btn btn-primary" data-dismiss="modal">Submit changes</button>
				</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 회원 추가 모달윈도우 스크립트  -->
	<script>
    $(function () { $('#myModal').modal('hide') });
    </script>
	<script>
	$(function () { 
		var $formMember= $('#formMemberAdd');
		$('#myModal').on('hide.bs.modal', function () {
	    	//alert('saved change..');
		});
		$('#confirm').click(function () {
						
	    	alert('저장되었습니다.');
		});
	});
    </script>
    
    
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
								<label for="inputAdminId" class="col-sm-3 control-label">아이디</label> 
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inpuId" placeholder="아아디: 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAdminPassword" class="col-sm-3 control-label">암호</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputAdminPassword" placeholder="패스워드: 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAdminNickName" class="col-sm-3 control-label">닉네임</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputAdminNickName" placeholder="닉네임: 영문, 숫자. 20자 이내">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">상태</label>
								<form class="form-inline"> 
									<div class="col-sm-9">
										<div class="radio">
											<label for="statusAdmin1"> 
												<input type="radio" name="statusAdmin" id="statusRadiosAdmin1" value="N" checked> 
												정상
											</label>
										</div>
	
										<div class="radio">
											<label for="statusAdmin2"> 
												<input type="radio" name="statusAdmin" id="statusRadiosAdmin2" value="S"> 
												중지
											</label>
										</div>
										
										<div class="radio">
											<label for="statusAdmin3"> 
												<input type="radio" name="statusAdmin" id="statusRadiosAdmin3" value="L"> 
												탈퇴
											</label>
										</div>
									</div>
								</form>
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
		var $formAdmin= $('#formAdminAdd');
		$('#adminModal').on('hide.bs.modal', function () {
	    	//alert('saved change..');
		});
		$('#adminConfirm').click(function () {
			
			// 입력된 Id, Password, NickName 얻기
			var AdminId = $('#inputAdminId').val();
			var AdminPassword = $('#inputAdminPassword').val();
			var AdminNickName = $('#inputAdminNickName').val();
			// 입력된 라디오 버튼의 value 얻기
			var status = document.getElementsByName('statusAdmin');
			var checkedIndex = -1;
			var adminStatus = '';
			for( i=0; i<status.length; i++ ) {
				if(status[i].checked) {
					checkedIndex = i;
					adminStatus = status[i].value;
				}
			}
			alert( '선택된 항목 인덱스: '+checkedIndex+'\n선택된 항목 값: '+ adminStatus );
			
			$.ajax({
				url: '/admin/adminAdd',
				method: 'POST',
				data: data,
				success: function(responseData){
					var data = responseData.trim();
					//console.log(data);
					if( data == '1' ){
						alert("저장되었습니다.");
						/* location.href= '${pageContext.request.contextPath}';	 */		
						location.href='/admin/member/admin.jsp';
					} else if ( data == 'leave'){
						alert('탈퇴한 회원입니다.');						
					} else if ( data == 'stop'){
						alert('사용 중지된 회원입니다.');						
					} else if (data == '-1'){
						alert('회원정보가 올바르지 않습니다.');
					} else{
						alert(data);
					}
				},
				error: function(xhr, status, error){
					return false;
				}
				
			});
			
	    	alert('저장되었습니다.');
		});
	});
    </script>
    