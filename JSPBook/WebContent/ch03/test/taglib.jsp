<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="j" begin="1" end="10" step="1">
	<c:if test="${j % 2 == 0}">
		<c:out value="${j } "/>
	</c:if>
</c:forEach>

<c:forEach var="i" begin="1" end="10" step="1">
	<c:if test="${i % 2 ==0 }">
		<c:out value="${i }"></c:out>
	</c:if>
</c:forEach>

</body>
</html>