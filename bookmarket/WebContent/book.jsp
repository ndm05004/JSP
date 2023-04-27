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
		String id = request.getParameter("id");
		// 2. BookRepository 클래스 변수에 BookRepository 인스턴스를 꺼내 초가화해주세요.
		BookRepository bookRepo = BookRepository.getInstance();
		// 3. id에 해당하는 책 데이터를 꺼내주세요.
		Book book = bookRepo.getBookById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h4><b>[<%=book.getCategory() %>]<!-- 책 제목 -->
				<%=book.getName() %>
				</b></h4>
				<p><!-- 책 내용 -->
				<%=book.getDescription() %>
				</p>
				<p><b>도서코드 : </b><span class="badge badge-danger">
				 <!-- 책 id -->
				 <%=book.getBookId() %>
				 </span></p>
				<p><b>출판사</b> : <%=book.getPublisher() %><!-- 책 출판사 --></p>			
				<p><b>저자</b> : <%=book.getPublisher() %> <!-- 책 저자 --></p>
				<p><b>재고수</b> : <%=book.getQuantity() %><!-- 책 재고수 --></p>
				<p><b>총 페이지수</b> : <%=book.getTotalPages() %><!-- 책 페이지수 --></p>
				<p><b>출판일</b> : <%=book.getReleaseDate() %><!-- 책 출판일 --></p>
				<h4><%=book.getUnitPrice() %><!-- 책 금액 -->원</h4>
				<form name="addForm" action="./addCart.jsp" method="get">
					<input type="hidden" value="<%=book.getBookId() %>" name="id"/>
					<a href="#" class="btn btn-info" onclick="addToCart()"> 도서주문
						&raquo;</a> <a href="./processAddBook.jsp" class="btn btn-warning"> 장바구니
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
