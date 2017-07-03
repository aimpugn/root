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
<c:set var="userOne" value="${requestScope.userOne}"/> 
<script>
///////////////////////// 1. modalUSerUpdateBody 스크립트                               ///////////////////////
///////////////////////// 2. 태그 라이브러리 제이쿼리, 부트스트랩 제이쿼리 아래입니다. ///////////////////////
///////////////////////// 3. 스크립트 위치 절대 옮기지 마세요!!!!              ///////////////////////

///////////////////////// 유효성 검사 내용 입력 ////////////////////////  ///////////////////////

// 국가번호 선택창 고정하기
$('.dropdown-menu.userUpdate').on('click', 'li a', function(){
    $('.nationBtnUpdate:first-child').html($(this).html() + ' <span class="caret"></span>');
    $('.nationBtnUpdate:first-child').val($(this).text() );
 }); 

// 이메일, 핸드폰 오브젝트
var user_update_email = $('#formUserUpdate input[name=user_id]');
var user_update_phone = $('#formUserUpdate input[name=user_phone2]');

	 // 1. 정규식 - 이메일 우효성 검사
$(user_update_email).change(function(){
    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

    if( !user_update_email.val() ){
        alert('이메일주소를 입력해 주세요');
        user_update_email.focus();
        return false;
    } else if(!regEmail.test(u_email.val())) {
           alert('이메일 주소가 유효하지 않습니다');
           user_update_email.focus();
           return false;
   	}
    $(this).children('.added').addClass('show');
});

// 2. 정규식 -전화번호유효성 검사
$(user_update_phone).change(function(){
   var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

    if( !user_update_phone.val() ){
        alert('핸드폰 번호를 입력해 주세요');
        user_update_phone.focus();
        return false;
    } else if(!regPhone.test(user_update_phone.val())) {
        alert('핸드폰 번호가 유효하지 않습니다');
        user_updateu_phone.focus();
        return false;
	}
    $(this).children('.added').css('display', 'inline-block');
});


	// /////////////////////// 업데이트   ////////////////////////  //
$('#userUpdateConfirm').click(function () {

	alert("업데이트 컨펌클릭");
	var user_id = $('#formUserUpdate input[name=user_id]').val();
	var user_password = $('#formUserUpdate input[name=user_password]').val();
	var user_nick_name = $('#formUserUpdate input[name=user_nick_name]').val();
	var user_phone1= $('#formUserUpdate button[name=user_phone1]').text().trim();
	user_phone1 = parseInt(user_phone1);
	console.log(user_phone1);
	var user_phone2= $('#formUserUpdate input[name=user_phone2]').val();
	var user_profile_photo= $('#formUserUpdate input[name=user_profile_photo]').val();

	var user_gender_obj = $('#formUserUpdate input[name=userGender]');
	var checkedGenderIndex = -1;
	var user_gender = '';
	for( i=0; i<user_gender_obj.length; i++ ) {
		if(user_gender_obj[i].checked) {
			checkedGenderIndex = i;
			user_gender = user_gender_obj[i].value;
		}
	}
	// 입력된 라디오 버튼의 상태 value 얻기
	var user_state_obj = $('#formUserUpdate input[name=userState]');
	var checkedIndex = -1;
	var user_state_flag = '';
	for( i=0; i<user_state_obj.length; i++ ) {
		if(user_state_obj[i].checked) {
			checkedIndex = i;
			user_state_flag = user_state_obj[i].value;
		}
	}
	// 업데이트 할 데이터 배열
	var data = {
		'user_id': user_id, 
		'user_password': user_password, 'user_nick_name': user_nick_name, 'user_gender': user_gender, 
		'user_phone1': user_phone1, 'user_phone2': user_phone2, 'user_profile_photo': user_profile_photo,
		'user_state_flag': user_state_flag
	};
	console.log(data);
	$.ajax({
		url: '/admin/member/user/update',
		method: 'PUT',
		data: data,
		success: function(responseData){
			var data = responseData.trim();
			console.log(data);
			if( data == '1' ){
				location.href='/admin/member/user';
			} else{
				alert("잘못된 정보입니다.");
			}
		},
		error: function(xhr, status, error){
			
		}
	});
	return false;
});
</script>

				<form id="formUserUpdate">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="modalUserIdLabel">회원 정보 수정</h4>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<label for="inputId" class="col-sm-3 control-label">아이디</label> 
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputId" name="user_id" value="${userOne.user_id}" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-sm-3 control-label">패스워드</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputPassword" name="user_password" value="${userOne.user_password}" placeholder="패스워드: 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputNickName" class="col-sm-3 control-label">닉네임</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputNickName" name="user_nick_name" value="${userOne.user_nick_name}" placeholder="닉네임 : 영문, 숫자. 20자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputProfilePhoto" class="col-sm-3 control-label">프로필 사진</label> 
								<div class="col-sm-9">
									<input type="file" class="form-control" id="inputProfilePhoto" name="user_profile_photo">
								</div>
								<p class="help-block blockquote-reverse">jpg, png, gif. 500KB 이내</p>
							</div>
							<div class="form-group">
								<label for="dropdownMenu3" class="col-sm-3 control-label">전화번호</label> 
								<div class="col-sm-2 form-inline">
									<div class="dropdown">
									  <button class="nationBtnUpdate btn btn-default dropdown-toggle" name="user_phone1" type="button" id="dropdownMenu3" data-toggle="dropdown" aria-expanded="true">
							    	      ${userOne.user_phone1}
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu userUpdate" role="menu" aria-labelledby="dropdownMenu3">
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
				               		<input type="phone" name="user_phone2" class="form-control phone-number-check" 
				               			value="${userOne.user_phone2}" size="37" maxlength="50" required="required" title="">
				              	</div>
								
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">성별</label>
								<div class="col-sm-9 form-inline">
									<c:choose>
									<c:when test='${"M" == userOne.user_gender}'>
										<label for="userGender1" class="checkbox-inline"> 
											<input type="radio" name="userGender" id="userGender1" value="M" checked> 
											남자
										</label>
										<label for="userGender2" class="checkbox-inline"> 
											<input type="radio" name="userGender" id="userGender2" value="F"> 
											여자
										</label>
									</c:when>
									<c:otherwise>
										<label for="userGender1" class="checkbox-inline"> 
											<input type="radio" name="userGender" id="userGender1" value="M" > 
											남자
										</label>
										<label for="userGender2" class="checkbox-inline"> 
											<input type="radio" name="userGender" id="userGender2" value="F" checked> 
											여자
										</label>
									</c:otherwise>
									</c:choose>
								</div>
								
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">상태</label>
								<div class="col-sm-9 form-inline">
								<c:choose>
									<c:when test='${"N" == userOne.user_state_flag}'>
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
									</c:when>
									<c:when test='${"B" == userOne.user_state_flag}'>
									<label for="userState1" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState1" value="N"> 
										사용
									</label>
									<label for="userState2" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState2" value="B" checked> 
										블랙
									</label>
									<label for="userState3" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState3" value="L"> 
										탈퇴
									</label>
									</c:when>
									<c:otherwise>
									<label for="userState1" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState1" value="N"> 
										사용
									</label>
									<label for="userState2" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState2" value="B"> 
										블랙
									</label>
									<label for="userState3" class="checkbox-inline"> 
										<input type="radio" name="userState" id="userState3" value="L" checked> 
										탈퇴
									</label>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
					
					</div>
					<div class="modal-footer">
					<button id="cancle" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button id="userUpdateConfirm" type="submit" class="btn btn-primary" data-dismiss="modal">Submit changes</button>
				</div>
				</form>
