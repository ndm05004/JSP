<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	Enumeration pram = request.getParameterNames();
	while(pram.hasMoreElements()){
		String text =(String)pram.nextElement();
		out.println(text + " : ");
		
		String value = request.getParameter(text.toString());
		out.println(value+"<br>");
}
%>
</body>
</html>