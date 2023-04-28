<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p> 선택한 과일 <br>
<%
	request.setCharacterEncoding("utf-8");
	
 	String[] value = request.getParameterValues("fluit");
	
	for(int i=0; i<value.length; i++)
		out.print(value[i] + " ");
%>
</body>
</html>