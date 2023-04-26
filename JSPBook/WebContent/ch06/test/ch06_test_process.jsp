<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                                    	input 태그의 기능과 사용법
                                    </h6>
                                </div>
                                <div class="card-body">
 								<%  
                            		request.setCharacterEncoding("UTF-8");
                                %>	
        <c:if test="${empty name or empty id or empty pw}">
                          <script>
                            alert("필수 입력 항목을 모두 입력해주세요.");
                            history.back();
                          </script>
                        </c:if>
                                
                               	<p>아이디: <c:out value="${param.id }"/><p/>
				                <p>비밀번호: <c:out value="${param.pw }"/>
				                <p>이름: <c:out value="${param.name }"/>
				                <p>연락처: <c:out value="${param.phone1 }"/>-<c:out value="${param.phone2 }"/>-<c:out value="${param.phone3 }"/> 
				                <p>이메일: <c:out value="${param.mail }"/>
				                
				                <c:set var="hobby" value="${paramValues.hobby}"/>
								<p>취미:
									<c:forEach items="${hobby}" var="hobbyItem">
										<c:out value="${hobbyItem}" />
									</c:forEach>
				               </p>
				                <p>성별: <c:out value="${param.gender }"/>
				                <p>소개: <c:out value="${param.comment }"/>
				                
                                <!-- 
                                	1) 아래 형태처럼 데이터를 출력해주세요
                                	아이디:
                                	비밀번호:
                                	이름:
                                	연락처: 000-0000-0000
                                	이메일:
                                	성별:
                                	취미:
                                	소개:
                             		
                             		위와 같은 형식으로 출력하고
                             		
                             		2) 아이디, 비밀번호, 이름 중 1개라도 누락했을 경우
                             			다시 ch06_test.jsp로 넘어가 "아이디, 비밀번호, 이름 중 1개의 값이 누락되었습니다"
                             			메시지가 표시될 수 있도록 해주세요.
                             			
                             		3) 테스트 시나리오
                             			1) 정상적으로 데이터를 입력하여 데이터가 넘어가 정상적으로 출력되는걸 확인
                             			2) 아이디 비밀번호 이름 중 1개를 누락 후 전송 시, ch06_test.jsp 페이지에서
                             					"아이디, 비밀번호, 이름 중 1개의 값이 누락되었습니다" 메시지를 확인한다.
                             		
                             		4) 출력은 JSTL과 EL을 이용하여 출력해주세요.
                                 -->
                                 
                                 
                                 
                                	</table>
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