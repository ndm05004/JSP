<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="fileupload02_process.jsp" name="fileupload" method="post" enctype="multipart/form-data">
	
	파일 : <input type="file" name="filename" value="찾아보기..."/><br/>
	<input type="submit" value="파일 올리기">
	</form>

</body>
</html>