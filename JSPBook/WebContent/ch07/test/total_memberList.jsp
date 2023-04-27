<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<!-- 
	1. 로그인 성공 후, 남아있을때 'a001님 환영합니다!' 메시지 출력을 완성해주세요.
	
	2. 회원 목록에 저장되어 있는 회원 모두를 출력해주세요.
		----------------------------------------------------
			이미지	|	회원정보			|	버튼
		----------------------------------------------------
					|	아이디 : a001		|
			이미지	|	비밀번호 : 1234	|	[상세정보]
					|	이름 : 박정수		|
					|	성별 : 남자		|
	
	3. 회원등록 버튼을 클릭 시, 회원 가입 페이지로 이동하여 회원 등록을 진행할 수 있도록 해주세요.
 -->
	
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	if(id!=null){
%>
	<script> alert("환영합니다.")</script>
<%
	}
	MemberDAO dao = MemberDAO.getInstance();

	ArrayList<MemberVO> memList =  dao.getMemberList();
%>
	<button type="button" onclick="location.href='total_signup.jsp';">회원등록</button>
<table border="1">
	<tr><td>이미지</td><td>회원정보</td><td>버튼</td></tr>
		<%
			for(int i=0; i<memList.size(); i++){
		%>
			<tr>
				<td>
					<img alt="" src="./img/<%=memList.get(i).getFilename() %> ">
				</td>
				<td>
				아이디 : <%=memList.get(i).getMem_id() %> <br>
				비밀번호 : <%=memList.get(i).getMem_pw() %> <br> 
				이름 : <%=memList.get(i).getMem_name() %> <br>
				성별 : <%=memList.get(i).getMem_sex() %>  <br>
				</td>
				<td><a href="">상세버튼</a></td>
			</tr>
		<% 		
			}
		%>
</table>


</body>
</html>