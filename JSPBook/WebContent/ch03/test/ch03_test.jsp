<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
                                    	test
                                    </h6>
                                </div>
                                <div class="card-body">
                                	<!-- 
                                		1) 리스트에서 406호 반 학생 이름을 모두 Core태그 set에 저장한 후, 전체를 출력해주세요
                                		2) 전체 출력을 4명씩 끊어서 출력해주세요.
                                			이름 이름 이름 이름
                                			이름 이름 이름 이름
                                			이름 이름 이름 이름
                                		3) 4명씩 끊어서 출력할 때, 본인의 이름은 '본인'으로 출력해주세요.
                                		4) '본인' 글자를 출력 시, 굵은 글씨/글자 색깔 녹색으로 출력해주세요.
                                		
                                		Core 태그 set에 저장 시, 스크립틀릿을 활용하여 넣어도 무관! (자유롭게)
                                	 -->
                                	 
                                	 <%
                                	 	List<String> list = new ArrayList<>();
                                	 	list.add("전지혜");list.add("신국현");list.add("이지영");list.add("김지완");	
                                	 	list.add("이성일");list.add("신현근");list.add("박정수");list.add("변정민");	
										list.add("정은지");list.add("조성희");list.add("박윤수");	list.add("조윤재");	
										list.add("정재균");list.add("박승우");list.add("황지현");	list.add("김민정");	
										list.add("김동혁");list.add("고영우");list.add("진현성");	list.add("이수진");	
										list.add("오미나");list.add("김민욱");list.add("홍기태"); list.add("구기현");	
										list.add("전다미");list.add("오대환");list.add("배문기");	list.add("유이현");	
                                	 %>
                                	 <c:set value="<%=list%>" var="stdlist"/>
                                	 
                                	 <c:forEach items="${stdlist}" var="student" varStatus="stat">
                                	 	<c:if test="${student eq '박승우' }">
                                	 		<font color="green"><b>본인</b></font>
                                	 	</c:if>
                                	 	<c:if test="${student != '박승우' }">
                                	 		<span>${student }</span>
                                	 	</c:if>
 										<c:if test="${stat.count % 4 ==0}">
 											<br>
 										</c:if>
                                	 </c:forEach>
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