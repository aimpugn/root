<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<textarea id="user"></textarea>
	<input type=submit id="submit">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function(){
	$('#submit').click(function(){
		var data = $('#user').val();
		data = JSON.stringify(data);
		console.log(data);
		$.ajax({
			url:"/photovel/common/login/email",
			method:"get",
			data:data,
			contentType: "application/json;charset=UTF-8",
			success:function(responseData){
				alert(responseData);
			}
		});
		return false;
	});
});
</script>
</body>
</html>