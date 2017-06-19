<%@ page contentType='text/html; charset=UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>content upload test</title>
</head>
<body>
	<form action="/upload" method="post" enctype="multipart/form-data">
		<textarea name="content" rows="30" cols="50"></textarea><br>
		<input name="img" type='file' multiple/>
		<input type="submit" value="업로드" id="upload">
	</form>
</body>
</html>
