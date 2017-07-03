<%@ page contentType="text/html; charset=UTF-8"%>

	<!--회원 추가  Modal -->
	<div class="modal fade" id="modalContentAdd" tabindex="-1" role="dialog" aria-labelledby="modalContentAddLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="formContentAdd" enctype="multipart/form-data" method="POST" action="/admin/board/content/add">
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
								<label for="content_subject" class="col-sm-3 control-label">콘텐츠 제목</label> 
								<div class="col-sm-9">
									<input type="text" class="form-control" id="content_subject" name="content_subject" placeholder="제목 입력">
								</div>
							</div> 
							<div class="form-group">
								<label for="content" class="col-sm-3 control-label">콘텐츠</label> 
								<div class="col-sm-9">
									<textarea id="content" class="form-control" name="content1" style="resize: none" rows="5"> </textarea>
								</div>
							</div>
							<div class="form-group"> 
					            <label class="col-sm-3 control-label" for="uploadFile">사진 업로드</label>
								<input type="hidden" name="count" value="1" />
						        <div class="control-group col-sm-9" id="fields">
						            <div class="controls" id="profs"> 
					                    <div class="field" class="form-inline" style="overflow: hidden;">
					                    	<input  id="field1" name="uploadFile" type="file" class="input form-control" autocomplete="off" style="display: inline-block; width: 89%; margin-left:2%"/>
				                   			<button id="b1" class="btn add-more" type="button" style="float:right">+</button>
										</div>
						            </div>
						        </div>
					        </div>

							<%--div class="form-group">
								<label for="dropdownMenu" class="col-sm-3 control-label">상태설정</label> 
								<div class="col-sm-2 form-inline">
									<div class="dropdown">
									  <button class="privateBtn btn btn-default dropdown-toggle" name="user_phone1" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
									    	공개여부
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu private" role="menu" aria-labelledby="dropdownMenu1">
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">공개</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">비공개</a></li>
									  </ul>
								  	</div>
								</div>
								<div class="col-sm-2 form-inline">
									<div class="dropdown">
									  <button class="warningBtn btn btn-default dropdown-toggle" name="user_phone1" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">
									    	신고상태
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu warning" role="menu" aria-labelledby="dropdownMenu2">
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
									  <button class="deleteBtn btn btn-default dropdown-toggle" name="content_" type="button" id="dropdownMenu3" data-toggle="dropdown" aria-expanded="true">
									    	게시상태
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu delete" role="menu" aria-labelledby="dropdownMenu3">
									  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">게시</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">사용자 삭제</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">관리자 삭제</a></li>
									  </ul>
								  	</div>
								</div> 
							</div> 
						</div--%>
						</div>
					</div>
					<div class="modal-footer">
					<button id="cancle" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" id="contentConfirm" class="btn btn-primary" >Submit changes
				</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 회원 추가 모달윈도우 스크립트  -->
	<%--script>
   // $(function () { $('#modalContentAdd').modal('hide') });
    </script --%>
	<script>
	$(function () { 
		$('#modalContentAdd').on('hide.bs.modal', function () {
		});
		
		// 사진 인풋박스 추가하기
		var next = 1;
	    $(".add-more").click(function(e){
	        e.preventDefault();
	        var addto = "#field" + next;
	        var addRemove = "#field" + (next);
	        next = next + 1;
	        var newIn = '</div><div class="field form-inline" style="overflow: hidden;"><input autocomplete="off" class="input form-control" style="display: inline-block; width: 89%; margin-left:2%" id="field' + next + '" name="field' + next + '" type="file">';
	        var newInput = $(newIn);
	        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" style="float: right;">-</button></div>';
	        var removeButton = $(removeBtn);
	        $(addto).after(newInput);
	        $(addRemove).after(removeButton);
	        $("#field" + next).attr('data-source',$(addto).attr('data-source'));
	        $("#count").val(next);  
	        
	            $('.remove-me').click(function(e){
	                e.preventDefault();
	                var fieldNum = this.id.charAt(this.id.length-1);
	                var fieldID = "#field" + fieldNum;
	                $(this).remove();
	                $(fieldID).remove();
	            });
	   	});	
	    

		////////////////////////////	
		
		// 게시상태 고정하기 
		$('.dropdown-menu.delete').on('click', 'li a', function(){
		    $('.deleteBtn:first-child').html($(this).html() + ' <span class="caret"></span>');
		    $('.deleteBtn:first-child').val($(this).text() );
		 }); 
		// 신고상태 고정하기 
		$('.dropdown-menu.warning').on('click', 'li a', function(){
		    $('.warningBtn:first-child').html($(this).html() + ' <span class="caret"></span>');
		    $('.warningBtn:first-child').val($(this).text() );
		 }); 
		// 공개상태 고정하기 
		$('.dropdown-menu.private').on('click', 'li a', function(){
		    $('.privateBtn:first-child').html($(this).html() + ' <span class="caret"></span>');
		    $('.privateBtn:first-child').val($(this).text() );
		 }); 
 
		// 이메일, 핸드폰 오브젝트
		var user_add_email = $('#formContentAdd input[name=user_id]');

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
	       // $(this).children('.added').addClass('show');
	    }); 
	    
       
		
		//$('#contentConfirm').click(function () {
			//var formData = JSON.stringify($("#formContentAdd").serializeArray())
			// user : 총 14개의 데이터	
           //var contentAddDataObj = $('form#formContentAdd')[0];
           //var contentAddData = new FormData(contentAddDataObj);
           //alert( "폼데이터 확인" + contentAddData );
          // contentAddData.push({"uploadFile": "$('#field1')[0].files[0]"});
           //contentAddData.uploadFile = "$('#field1')[0].files[0]";
           //contentAddData.append('uploadFile' , "$('#field1')[0].files[0]");
           //alert(contentAddData.uplodaFile);
			/* $.ajax({
				//headers: { 'Accept': 'multipart/form-data',
    			//           'Content-Type': 'application/json' 
	           // },
				url: '/admin/board/content/add',
				method: 'POST',
							 	processData: false,
			 	contentType: false,
				success: function(responseData){
				},
				error: function(xhr, status, error){
					alert("등록 실패. 관리자 문의" + xhr.error);
				}
			}); 
			return false;*/
			/* console.log("폼데이터"+formData);
			$.ajax({
			  type: "POST",
			  //url: "/admin/board/content/add",
			  data: formData,
			  success: function(){
				  alert("전송완료");
			  },
			  dataType: "json",
			  contentType : "application/json"
			});
		}); */
	});
    </script>
    