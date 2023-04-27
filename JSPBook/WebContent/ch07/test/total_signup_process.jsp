<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
	1. 회원가입 폼에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서
	일반데이터와 파일명을 저장하여 회원 객체 하나를 저장 후, 회원 목록에 해당하는 리스트에 저장하여
	목록 페이지에서 리스트 데이터를 활용할 수 있게 해주세요.
 	- DAO, VO 활용

 	2. 회원가입이 완료되면, total_signin.jsp로 이동하여 로그인을 진행할 수 있도록 해주세요.
 -->
 
<%
	MemberDAO dao = MemberDAO.getInstance();
	

	String fileuploadPath = "D:\\A_TeachingMaterial\\00JSP\\workspace_jsp\\JSPBook\\WebContent\\ch07\\test\\img";
	
	File tempFile = new File(fileuploadPath);
	if(!tempFile.exists()){
		tempFile.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	
	upload.setSizeMax(5 * 1024 * 1024); // 업로드 할 파일의 최대 크기(byte)
	upload.setSizeThreshold(4096); // 메모리상에 저장할 최대 크기(byte)
	upload.setRepositoryPath(fileuploadPath); // 업로드된 파일을 임시로 저장할 경로
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	String id ="";
	String pw ="";
	String username ="";
	String gender ="";
	String fileName="";
	// 4MB
	int maxSize= 4 * 1024*1024; // 파일 업로드시 1개의 파일 당 사이즈(최대 사이즈)
	while(params.hasNext()){
		FileItem fileItem = (FileItem) params.next();
		
		if(fileItem.isFormField()){ // 폼 페이지에서 전송된 요청 파라미터가 일반 데이터일 때
			String name = fileItem.getFieldName();
			String value = fileItem.getString("UTF-8");
			if(name.equals("id")){
				id= value;
			}
			if(name.equals("pw")){
				pw= value;
			}
			if(name.equals("name")){
				username= value;
			}
			if(name.equals("gender")){
				gender= value;
			}

		}else{
			String fileFieldName = fileItem.getFieldName(); // 요청 파라미터 이름
			fileName = fileItem.getName(); // 파일명
			String contentType = fileItem.getContentType(); // 파일 콘텐츠타입(Mime type)			
			
			long fileSize = fileItem.getSize();
			
			File file = new File(fileuploadPath + "/" + fileName);
			if(maxSize < fileSize){
				out.println("파일 크기를 초과하였습니다!<br>");
			}else{
				fileItem.write(file); // 파일 업로드 진행
			}
		}
	}
	
	
	
	MemberVO vo = new MemberVO();
	

	
	vo.setMem_id(id);
	vo.setMem_pw(pw);
	vo.setMem_name(username);
	vo.setMem_sex(gender);
	vo.setFilename(fileName);
	
	dao.insertMember(vo);
	
	response.sendRedirect("total_signi.jsp");
%>
</body>
</html>