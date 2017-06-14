<%@ page contentType='text/html; charset=UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>content upload test</title>
</head>
<body>
<textarea id="content"></textarea>
<input type="submit" value="업로드" id="upload">
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$('#upload').click(function(){
		var content = $('#content').val();
		console.log(content);
		$.ajax({
			url:"/content/photo",
			method:"POST",
			data:content,
			//contentType: "text/plain; charset=UTF-8",
			contentType: "application/json; charset=UTF-8",
			success: function(responseData){
				alert('성공!');
			},
			error: function(xhr, status, error){
				console.log(xhr);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	});
});
</script>
</html>
