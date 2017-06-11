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
		
	var $btnLogin = $('#btnLogin');
	
	/*$btnLogin.click(function(){*/
 	$form.submit(function(){ 
	 			
		var adminId = $('#inputId').val();
		var adminPassword = $('#inputPassword').val();
		alert("id"+adminId+"pw" + adminPassword);
		console.log("id"+adminId+"pw" + adminPassword);
		/* var saveIdCheck = $('#saveId').prop("checked");	
		console.log(saveIdCheck); */
		//console.log("아이디" + adminId + adminPassword);
/* 		if( saveIdCheck == true ){
			localStorage.setItem("saveId", id);
		}else{
			localStorage.removeItem("saveId");
		} */
		
		var data = {'adminId': adminId, 'adminPassword': adminPassword };
		console.log("data" + data);
		$.ajax({
			url : '/photovel/admin/adminLogin',
			method:'GET', 			
			data: data,
			success: function(responseData){
				var data = responseData.trim();
				//console.log(data);
				if( data == '1' ){
					alert("로그인 성공");
					/* location.href= '${pageContext.request.contextPath}';	 */		
					location.href='/photovel/admin/member/member.jsp';
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

<%-- <% HttpSession session2 = request.getSession();
	Object loginInfo;
	if(session.getAttribute("loginInfo") instanceof Admin){
		loginInfo = (Admin) session.getAttribute("loginInfo");
	}else{
		loginInfo = (Admin) session.getAttribute("loginInfo");
	}
%> --%>
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
								<input type="password" class="form-control" id="inputPassword" 									placeholder="Password">
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
