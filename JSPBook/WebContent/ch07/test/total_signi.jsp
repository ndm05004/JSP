<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		1.아이디, 비밀번호, 로그인 버튼을 이용하여 total_signin_process.jsp로 이동하여
		로그인 처리를 진행해주세요.
		
		2.로그인 시, 등록된 회원이 존재하지 않는 경우 '존재하지 않는 회원입니다!' 메세지가 출력되게 해주세요
		
		3. 회원가입 버튼을 생성하고, 회원 가입 버튼을 클릭 시 회원가입 페이지로 이동합니다.
	 -->
	 <form action="total_signin_process.jsp" method="post">
	 	아이디: <input type="text" name="id"><br>
	 	비밀번호: <input type="text" name="pw"><br>
	 	<input type="submit" value="로그인"><br><br>
	 	<a href="total_signup.jsp">회원가입</a>
	 </form>
	 
	 
</body>
</html>