<%@ page contentType="text/html; charset=UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>window.jQuery || document.write('<script src="/bootstrap/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="/admin/bootstrap/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="/admin/bootstrap/assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/admin/bootstrap/assets/js/ie10-viewport-bug-workaround.js"></script>

<script>
$(function(){

	
	// 국가번호 선택창 고정하기
	$('.dropdown-menu.userAdd').on('click', 'li a', function(){
		$('.nationBtnAdd').attr('aria-expanded', true);
	    $('.nationBtnAdd:first-child').html($(this).html() + ' <span class="caret"></span>');
	    $('.nationBtnAdd:first-child').val($(this).text() );
	 });  
	//$('.dropdown-menu.userAdd').dropdown();
	// 이메일, 핸드폰 오브젝트
	var user_add_email = $('#formUserAdd input[name=user_id]');
    var user_add_phone = $('#formUserAdd input[name=user_phone2]');

   	 // 1. 정규식 - 이메일 우효성 검사
    $(user_add_email).change(function(){
        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

        if( !user_add_email.val() ){
            alert('이메일주소를 입력해 주세요');
            user_add_email.focus();
            return false;
        } else if(!regEmail.test(user_add_email.val())) {
               alert('이메일 주소가 유효하지 않습니다');
               user_add_email.focus();
               return false;
       	}
        $(this).children('.added').addClass('show');
    });
    
       // 2. 정규식 -전화번호유효성 검사
    $(user_add_phone).change(function(){
       var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

        if( !user_add_phone.val() ){
            alert('핸드폰 번호를 입력해 주세요');
            user_add_phone.focus();
            return false;
        } else if(!regPhone.test(user_add_phone.val())) {
            alert('핸드폰 번호가 유효하지 않습니다');
            user_add_phone.focus();
            return false;
    	}
        $(this).children('.added').css('display', 'inline-block');
	});
	
	$('#userConfirm').click(function (e) {
		
		var now = new Date();  
		// 입력된 Id, Password, NickName 얻기
		var user_id = $('#formUserAdd input[name=user_id]').val();
		var user_password = $('#formUserAdd input[name=user_password]').val();
		var user_nick_name = $('#formUserAdd input[name=user_nick_name]').val();
		var user_phone1= $('#formUserAdd button[name=user_phone1]').val();
		var user_phone2= $('#formUserAdd input[name=user_phone2]').val();


		var user_profile_photo= $('#formUserAdd input[name=user_profile_photo]').val();
		var user_sign_date = now;
		//user_state_flag 아래 
		var user_last_connection = now;
		var user_sns_status= "O";
		var user_sns_token= null;
		var user_push_token = "push_token_origin";
		var user_friend_count = 0;
		// 입력된 라디오 버튼의 성별 value 얻기
		var user_gender_obj = $('#formUserAdd input[name=user_gender]');
		var checkedGenderIndex = -1;
		var user_gender = '';
		for( i=0; i<user_gender_obj.length; i++ ) {
			if(user_gender_obj[i].checked) {
				checkedGenderIndex = i;
				user_gender = user_gender_obj[i].value;
			}
		}
		// 입력된 라디오 버튼의 상태 value 얻기
		var user_state_obj = $('#formUserAdd input[name=userState]');
		var checkedIndex = -1;
		var user_state_flag = '';
		for( i=0; i<user_state_obj.length; i++ ) {
			if(user_state_obj[i].checked) {
				checkedIndex = i;
				user_state_flag = user_state_obj[i].value;
			}
		}
		// user : 총 14개의 데이터	
		/* var data = {
				'user_id': user_id, 'user_password': user_password, 'user_nick_name': user_nick_name, 'user_gender': user_gender, 
				'user_phone1': user_phone1, 'user_phone2': user_phone2, 'user_profile_photo': user_profile_photo,
				'user_sign_date': user_sign_date, 'user_state_flag': user_state_flag, 'user_last_connection': user_last_connection, 
				'user_sns_status': user_sns_status,	'user_sns_token': user_sns_token, 'user_push_token': user_push_token,
				'user_friend_count': user_friend_count
			}; 
		console.log("어펜드 전 데이터: " + data);*/

		//var form1 = $('form#formUserAdd')[0];
		//var formData = new FormData(form1);
           //console.log( $("#uploadFile")[0].files[0]);
           //alert( typeof(formData));
           //console.log(formData);
           //formData.push("uploadFile", $("#uploadFile")[0].files[0]);
           //formData.push("uploadFile", $("#uploadFile")[0].files[0]);
           
           var form1 = $('form')[0];
           var formData = new FormData(form1);
           alert( formData + "폼데이터 확인" );
           formData.push("uploadFile", $("#uploadFile")[0].files[0]);
           //formData.append("data", data);//.formData);
	
		//console.log("어펜드된 data"+ data);
		
		$.ajax({
			url: '/admin/member/user/add',
			method: 'POST',
		 	processData: false,
		 	contentType: false,
		 	/* dataType: "json",
            Accept: "application/json", 
			data: formData,*/
			success: function(responseData){
				//var data = responseData.trim();
				//console.log(data);
				//if( data == '1' ){
				//	location.href='/admin/member/user';
				//} else{
				//	alert("증복된 아이디가 있습니다.");
				//}
			},
			error: function(xhr, status, error){
				alert("등록 실패. 관리자 문의" + xhr.error);
			}
		});
		return false;
	});
});
</script>
   
                                         
	<!--회원 추가  Modal -->
	<div class="modal fade" id="modalUser" tabindex="-1" role="dialog" aria-labelledby="modalUserLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="formUserAdd" enctype="multipart/form-data" method="POST" action="/admin/member/user/add">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="modalUserLabel">회원 추가</h4>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<label for="inputId" class="col-sm-3 control-label" >아이디</label> 
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputId" name="user_id" placeholder="아이디: 영문, 숫자. 40자 이내" >
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-sm-3 control-label">패스워드</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputPassword" name="user_password" placeholder="패스워드: 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputNickName" class="col-sm-3 control-label">닉네임</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputNickName" name="user_nick_name" placeholder="닉네임 : 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputProfilePhoto" class="col-sm-3 control-label">프로필 사진</label> 
								<div class="col-sm-9">
									<input type="file" class="form-control" id="uploadFile" name="uploadFile">
								</div>
								<p class="help-block blockquote-reverse">jpg, png, gif. 500KB 이내</p>
							</div>
							
							
							
							
							
							
							
							<div class="form-group">
								<label for="dropdownMenu2" class="col-sm-3 control-label">전화번호</label> 
								<div class="col-sm-2 form-inline">
								
									<div class="dropdown">
									  	<button class="nationBtnAdd  btn btn-default dropdown-toggle" name="user_phone1" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">
							    	      	국가번호
									    <span class="caret"></span>
									  </button>									  
	  
									  <ul class="dropdown-menu userAdd" role="menu" aria-labelledby="dropdownMenu2">
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">82</a></li>
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
				               		<input type="tel" name="user_phone2" class="form-control phone-number-check" value="" size="37" maxlength="50" required="required" title="">
				              	</div>
								
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">성별</label>
								<div class="col-sm-9 form-inline">
									<label for="user_gender1" class="checkbox-inline"> 
										<input type="radio" name="user_gender" id="user_gender1" value="M" checked> 
										남자
									</label>
									<label for="user_gender2" class="checkbox-inline"> 
										<input type="radio" name="user_gender" id="user_gender2" value="F"> 
										여자
									</label>
								</div>
								
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">상태</label>
								<div class="col-sm-9 form-inline">
									<label for="userState1" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState1" value="N" checked> 
										사용
									</label>
								
									<label for="userState2" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState2" value="B"> 
										블랙
									</label>
								
								
									<label for="userState3" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState3" value="L"> 
										탈퇴
									</label>
								</div>
								
							</div>
						</div>
					
					</div>
					<div class="modal-footer">
					<button id="cancle" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button id="userConfirm" class="btn btn-primary" data-dismiss="modal">Submit changes</button>
				</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
<script>
<%--$(function () { $('#modalUser').modal('hide') });

<script>--%>
$(function () { 

	// 국가번호 선택창 고정하기
/* 	$('.dropdown-menu.userAdd').on('click', 'li a', function(){
		alert("유저애드 드랍다운 메뉴 클릭");
	    $('.nationBtnAdd:first-child').html($(this).html() + ' <span class="caret"></span>');
	    $('.nationBtnAdd:first-child').val($(this).text() );
	 }); 
	 */
	/* $('#modalUser').on('hide.bs.modal', function () {
		//alert("애드창 스크립트 실행");

	}); */
});
</script>