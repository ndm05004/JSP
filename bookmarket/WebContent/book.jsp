<%@page import="dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<title>도서 정보</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 정보</h1>
		</div>
	</div>
	<%
		// 1. 넘겨받은 책 id를 꺼내주세요.
		// 2. BookRepository 클래스 변수에 BookRepository 인스턴스를 꺼내 초가화해주세요.
		// 3. id에 해당하는 책 데이터를 꺼내주세요.
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h4><b>[<!-- 책 카테고리 -->]<!-- 책 제목 --></b></h4>
				<p><!-- 책 내용 --></p>
				<p><b>도서코드 : </b><span class="badge badge-danger"> <!-- 책 id --></span></p>
				<p><b>출판사</b> : <!-- 책 출판사 --></p>			
				<p><b>저자</b> : <!-- 책 저자 --></p>
				<p><b>재고수</b> : <!-- 책 재고수 --></p>
				<p><b>총 페이지수</b> : <!-- 책 페이지수 --></p>
				<p><b>출판일</b> : <!-- 책 출판일 --></p>
				<h4><!-- 책 금액 -->원</h4>
				<form name="addForm" action="./addCart.jsp" method="get">
					<input type="hidden" value="<!-- 책 id -->" name="id"/>
					<a href="#" class="btn btn-info" onclick="addToCart()"> 도서주문
						&raquo;</a> <a href="./cart.jsp" class="btn btn-warning"> 장바구니
						&raquo;</a> <a href="./books.jsp" class="btn btn-secondary">
						도서목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
