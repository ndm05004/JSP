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
</head>
<body>

	<!-- 
		1. 로그인 페이지에서 전송한 아이디, 비밀번호를 받는다.
		
		2. 전달받은 아이디, 비밀번호에 해당하는 내 정보가 있는지 없는지 체크
		- DAO, VO를 활용하여 진행
		- DAO, VO는 제공
		
		3. 전달받은 아이디 비밀번호에 해당하는 회원인 경우엔 total_memberList.jsp로 이동하여
		 회원 목록 페이지를 완성해주세요.
		  - 회원 목록 페이지로 넘어가서 해당 목록 페이지에서 'a001님! 환영합니다!' 메시지를 출력해주세요.
		 
		4. 전달받은 아이디 비밀번호에 해당하지 않는 회원인 경우엔 total_signin.jsp로 이동하여
		 다시 로그인을 진행할 수 있도록 해주시고, 에러 메세지를 출력해주세요!
	 -->
	 
<%
	request.setCharacterEncoding("utf-8");		

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();

	ArrayList<MemberVO> memList =  dao.getMemberList();
	
	boolean foundMember = false;
	for(int i=0; i<memList.size(); i++){
	    String checkId = memList.get(i).getMem_id();
	    String checkPw = memList.get(i).getMem_pw();
	    if(checkId.equals(id)&&checkPw.equals(pw)){
	        foundMember = true;
	        break;
	    }
	}

	if(foundMember){
	    request.getRequestDispatcher("total_memberList.jsp").forward(request, response);
	}else{
	    request.getRequestDispatcher("total_signi.jsp?flag=1").forward(request, response);
	}
	
%>

</body>
</html>