<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    	Commons-Fileupload의 기능과 사용법
                                    </h6>
                                </div>
                                <div class="card-body">
                                	<%
                                		String fileuploadPath = "C:\\upload";
                                	
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
                                		
                                		// 4MB
                                		int maxSize= 4 * 1024*1024; // 파일 업로드시 1개의 파일 당 사이즈(최대 사이즈)
                                		while(params.hasNext()){
                                			FileItem fileItem = (FileItem) params.next();
                                			
                                			if(fileItem.isFormField()){ // 폼 페이지에서 전송된 요청 파라미터가 일반 데이터일 때
                                				String name = fileItem.getFieldName();
                                				String value = fileItem.getString("UTF-8");
                                				out.println(name + "=" + value + "<br/>");
                                			}else{
                                				String fileFieldName = fileItem.getFieldName(); // 요청 파라미터 이름
                                				String fileName = fileItem.getName(); // 파일명
                                				String contentType = fileItem.getContentType(); // 파일 콘텐츠타입(Mime type)
                                				long fileSize = fileItem.getSize();
                                				
                                				File file = new File(fileuploadPath + "/" + fileName);
                                				if(maxSize < fileSize){
                                					out.println("파일 크기를 초과하였습니다!<br>");
                                				}else{
                                					fileItem.write(file); // 파일 업로드 진행
                                				}
                                				out.println("----------------------------------------<br/>");
                                				out.println("요청 파라미터 이름 " + fileFieldName+"<br/>");
                                				out.println("저장 파일 이름 " + fileName+"<br/>");
                                				out.println("파일 콘텐츠 타일 " + contentType+"<br/>");
                                				out.println("파일크기" + fileSize+"<br/>");
                                			}
                                		}
                                	%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>