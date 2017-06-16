<%@ page contentType='text/html; charset=UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>content upload test</title>
</head>
<body>
	<form method="POST" action="/content/photo" enctype="multipart/form-data">
		<textarea name="content"></textarea><br>
		<input name="uploadFile" class="file" type='file' multiple/>
		<input type="submit" value="업로드" id="upload">
	</form>
</body>
</html>
