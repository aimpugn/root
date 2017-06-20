<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--  head
------------------------------------------- --%>
<%@include file="/admin/include/head.jsp"%>
<script>
$(function(){
	var $form = $('form');
	var itemValue = localStorage.getItem("saveId");
	
	//저장된 ID 값(itemValue)가 있으면 받아온다.
	if(itemValue != null){
		$('#inputId').val(itemValue);
	}
	var admin = '${requestScope.admin}'; // 결과 true 반환
		
 	$form.submit(function(){ 
	 			
		var admin_id = $('#inputId').val();
		var admin_password = $('#inputPassword').val();
		alert("id"+admin_id+"pw" + admin_password);
		
		var data = {'admin_id': admin_id, 'admin_password': admin_password};
		console.log(data);
		$.ajax({
			url : '/admin/'+ admin_id,
			method:'GET',
			data: data,
			success: function(responseData){
				var data = responseData.trim();
				if( data == '1' ){
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
		return false;
	});
	
});
</script>
</head>


<body>

<div class="container-fluid">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Photovel 어드민</a>
			</div>
		</div>
	</nav>
	<div class="container space-percent-5">
		<div class="row space-em-0">
			<div class="col-lg-6 col-lg-offset-3">
				<div class="well">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputId" class="col-sm-3 control-label">아아디</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputId" placeholder="아아디">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-3 control-label">Password</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="inputPassword" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-sm-offset-3 col-sm-4">
									<div class="checkbox">
										<label for="saveId"><input type="checkbox" id="saveId"> Remember me</label>
									</div>
								</div>
								<div class="col-sm-5">
									<button type="submit" id="btnLogin" class="col-sm-9 btn btn-primary">Login</button>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
