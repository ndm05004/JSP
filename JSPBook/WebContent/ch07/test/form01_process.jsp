<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%
  request.setCharacterEncoding("utf-8");
  String id = request.getParameter("name"); 
  String addr = request.getParameter("address"); 
  String email = request.getParameter("email"); 
  
  %>
	<p> 아이디 : <%=id %>
	<p> 주소 :<%= addr%>
	<p> 이메일 : <%=email %>
</body>
</html>