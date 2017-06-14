<%@ page contentType='text/html; charset=UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>content upload test</title>
</head>
<body>
	<form method="POST" action="/upload" enctype="multipart/form-data">
		<input type="file" name="uploadFile">
		<input type="submit" value="업로드" id="upload">
	</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	$('#upload').click(function(){
		var formData = new FormData($('form')[0]);
		$.ajax({
			url : "/upload",
			method : "POST",
			data: formData,
			enctype:"multipart/form-data",
			processData:false,
			contentType:false,
			success : function(responseData) {
				alert('성공!');
			},
			error : function(xhr, status, error) {
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
