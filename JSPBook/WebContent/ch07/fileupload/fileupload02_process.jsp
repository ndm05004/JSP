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
<%
	String fileuploadPath =  request.getServletContext().getRealPath("/ch07/test/img");

	System.out.print(fileuploadPath);

	File tempFile = new File(fileuploadPath);
	if(!tempFile.exists()){
		tempFile.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	
	upload.setSizeMax(5 * 1024 * 1024);
	upload.setSizeThreshold(4096);
	upload.setRepositoryPath(fileuploadPath);
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	int maxSize = 4 * 1024 * 1024;
	while(params.hasNext()){
		FileItem fileItem = (FileItem) params.next();
		
		String fileFieldName = fileItem.getFieldName();
		String fileName = fileItem.getName();
		String contentType = fileItem.getContentType();
		long fileSize = fileItem.getSize();
		
		File file = new File(fileuploadPath + "/" + fileName);
		if(maxSize < fileSize){
			out.println("파일 크기를 초과하였습니다!<br>");
		}else{
			fileItem.write(file);
		}
		out.println("------------------------------------<br>");
		out.println("요청 파라미터 이름"+fileFieldName +"<br>");
		out.println("저장 파일 이름 "+fileName+"<br>");
		out.println("파일 콘텐츠 타입"+contentType+"<br>");
		out.println("파일크기"+fileSize+"<br>");	
	}
	
%>
</body>
</html>