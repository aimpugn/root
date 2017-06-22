<%@ page contentType="text/html; charset=UTF-8"%>

	<!--회원 추가  Modal -->
	<div class="modal fade" id="modalContentAdd" tabindex="-1" role="dialog" aria-labelledby="modalContentAddLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="formContentAdd">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="modalContentAddLabel">콘텐츠  추가</h4>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<label for="inputId" class="col-sm-3 control-label">아이디</label> 
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputId" name="user_id" placeholder="아이디: 영문, 숫자. 40자 이내">
								</div>
							</div>
							<div class="form-group">
								<label for="inputId" class="col-sm-3 control-label">콘텐츠</label> 
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputId" name="user_id" placeholder="아이디: 영문, 숫자. 40자 이내">
								</div>
							</div>
							<div class="form-group" id="photoInputWrap">
								<div>
									<label for="inputProfilePhoto" class="col-sm-3 control-label">사진 업로드</label> 
									<div class="col-sm-6 form-inline">
										<input type="file" class="form-control" id="inputProfilePhoto" name="user_profile_photo">
									</div>
									<div class="col-sm-2 form-inline">
										<button type="button" name="photoInputAdd" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> 사진 추가</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="dropdownMenu1" class="col-sm-3 control-label">상태설정</label> 
								<div class="col-sm-2 form-inline">
									<div class="dropdown">
									  <button class="nationBtn btn btn-default dropdown-toggle" name="user_phone1" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
									    	공개여부
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu user" role="menu" aria-labelledby="dropdownMenu1">
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">공개</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">비공개</a></li>
									  </ul>
								  	</div>
								</div>
								<div class="col-sm-2 form-inline">
									<div class="dropdown">
									  <button class="nationBtn btn btn-default dropdown-toggle" name="user_phone1" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
									    	신고상태
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu user" role="menu" aria-labelledby="dropdownMenu1">
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">0</a></li>
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">1</a></li>
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">2</a></li>
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">3</a></li>
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">4</a></li>
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">5</a></li>
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">6</a></li>
									  </ul>
								  	</div>
								</div>
								<div class="col-sm-2 form-inline">
									<div class="dropdown">
									  <button class="nationBtn btn btn-default dropdown-toggle" name="content_" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
									    	게시상태
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu user" role="menu" aria-labelledby="dropdownMenu1">
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">게시</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">사용자 삭제</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">관리자 삭제</a></li>
									  </ul>
								  	</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">성별</label>
								<div class="col-sm-9 form-inline">
									<label for="userGender1" class="checkbox-inline"> 
										<input type="radio" name="userGender" id="userGender1" value="M" checked> 
										남자
									</label>
									<label for="userGender2" class="checkbox-inline"> 
										<input type="radio" name="userGender" id="userGender2" value="F"> 
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
					<button id="userConfirm" type="submit" class="btn btn-primary" data-dismiss="modal">Submit changes</button>
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
    $(function () { $('#modalContentAdd').modal('hide') });
    </script>
	<script>
	$(function () { 
		$('.added').addClass('hidden');
		$('#modalContentAdd').on('hide.bs.modal', function () {
	    	//alert('saved change..');
		});
		
		// 사진 인풋박스 추가하기
		
								<div class="form-group photoInputWrap">
								<label for="inputProfilePhoto" class="col-sm-3 control-label">사진 업로드</label> 
								<div class="col-sm-6 form-inline">
								<input type="file" class="form-control" id="inputProfilePhoto" name="user_profile_photo">
								</div>
								<div class="col-sm-2 form-inline">
								<button type="button" name="photoInputAdd" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> 사진 추가</button>
								</div>
								</div>
								
var oTbl;
//Row 추가
function addFrom() {
  oTbl = document.getElementById("addTable");
  var oForm = oTbl.addForm();
  oForm.onmouseover=function(){oTbl.clickedFormIndex=this.FormIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oForm.insertCell();

  //삽입될 Form Tag

	var formTag =  '<div class="form-group photoInputWrap">';
		formTag  += '<label for="inputProfilePhoto" class="col-sm-3 control-label">사진 업로드</label>'; 
		formTag  +=		'<div class="col-sm-6 form-inline">'
		formTag  +=			'<input type="file" class="form-control" id="inputProfilePhoto" name="user_profile_photo">'
		formTag  +=		'</div>'
		formTag  +=		'<div class="col-sm-2 form-inline">'
		formTag  +=			'<button type="button" name="photoInputAdd" class="btn btn-primary">''
		formTag  +=					'<span class="glyphicon glyphicon-plus"></span> 사진 추가'
		formTag  +=			'</button>'
		formTag  +=		'</div>'
		formTag  += '</div>';
		formTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
  oCell.innerHTML = formTag;
}
//Row 삭제
function removeForm() {
  oTbl.deleteForm(oTbl.clickedFormIndex);
}

function frmCheck()
{
  var frm = document.form;
  
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText" )
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
                 frm.elements[i].focus();
	 return;
          }
      }
   }
 }								
		var $photoInputAdd = $('button[name=photoInputAd]');
		$photoInputAdd.click(function(){
			
		});
								
		// 국가번호 선택창 고정하기
		$('.dropdown-menu.user').on('click', 'li a', function(){
		    $('.nationBtn:first-child').html($(this).html() + ' <span class="caret"></span>');
		    $('.nationBtn:first-child').val($(this).text() );
		 }); 
 
		// 이메일, 핸드폰 오브젝트
		var user_add_email = $('#formContentAdd input[name=user_id]');
	    var user_add_phone = $('#formContentAdd input[name=user_phone2]');

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
        //var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

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
		
		$('#userConfirm').click(function () {
			var now = new Date();  
			// 입력된 Id, Password, NickName 얻기
			var user_id = $('#formContentAdd input[name=user_id]').val();
			var user_password = $('#formContentAdd input[name=user_password]').val();
			var user_nick_name = $('#formContentAdd input[name=user_nick_name]').val();
			var user_phone1= $('#formContentAdd button[name=user_phone1]').val();
			console.log(user_phone1);
			var user_phone2= $('#formContentAdd input[name=user_phone2]').val();
			var user_profile_photo= $('#formContentAdd input[name=user_profile_photo]').val();
			var user_sign_date = now;
			//user_state_flag 아래 
			var user_last_connection = now;
			var user_sns_status= "O";
			var user_sns_token= null;
			var user_push_token = "push_token_origin";
			var user_friend_count = 0;
			// 입력된 라디오 버튼의 성별 value 얻기
			var user_gender_obj = $('#formContentAdd input[name=userGender]');
			var checkedGenderIndex = -1;
			var user_gender = '';
			for( i=0; i<user_gender_obj.length; i++ ) {
				if(user_gender_obj[i].checked) {
					checkedGenderIndex = i;
					user_gender = user_gender_obj[i].value;
				}
			}
			alert(user_gender);
			// 입력된 라디오 버튼의 상태 value 얻기
			var user_state_obj = $('#formContentAdd input[name=userState]');
			var checkedIndex = -1;
			var user_state_flag = '';
			for( i=0; i<user_state_obj.length; i++ ) {
				if(user_state_obj[i].checked) {
					checkedIndex = i;
					user_state_flag = user_state_obj[i].value;
				}
			}
			alert(user_state_flag);
			// user : 총 14개의 데이터	
			var data = {
					'user_id': user_id, 'user_password': user_password, 'user_nick_name': user_nick_name, 'user_gender': user_gender, 
					'user_phone1': user_phone1, 'user_phone2': user_phone2, 'user_profile_photo': user_profile_photo,
					'user_sign_date': user_sign_date, 'user_state_flag': user_state_flag, 'user_last_connection': user_last_connection, 
					'user_sns_status': user_sns_status,	'user_sns_token': user_sns_token, 'user_push_token': user_push_token,
					'user_friend_count': user_friend_count
				};
			console.log(data);
			$.ajax({
				url: '/admin/member/user/add',
				method: 'POST',
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
	});
    </script>
    