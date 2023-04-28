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
		String 
	}
	
%>
</body>
</html>