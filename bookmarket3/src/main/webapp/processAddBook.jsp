<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	// 1. 넘겨받은 폼 데이터 전부를 받아서 변수에 초기화해주세요.
	//  - 초기화 하기 위한 변수는 아래 Book 클래스 newBook변수에 setter를 통해 담긴 변수를 참고해주세요.
	
	String id = request.getParameter("id");
	BookRepository bookRepo = BookRepository.getInstance();
	Book book = bookRepo.getBookById(id);
	
	String bookId = book.getBookId(); 		
	String name = book.getBookId(); 		
	String  unitPrice = book.getUnitPrice()+""; 
	String author = book.getAuthor(); 		
	String description= book.getDescription(); 
	String publisher= book.getPublisher();
	String category= book.getCategory();	
	String   unitsInStock= book.getUnitsInStock()+"";
	long   totalPages= book.getTotalPages();
	String releaseDate= book.getReleaseDate();
	String condition= book.getCondition();	
	String filename= book.getFilename()	;
	int quantity= book.getQuantity();	
	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setPublisher(releaseDate);
	newBook.setTotalPages(totalPages);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(filename);

	// 2. 책 1권의 정보가 담긴 자바빈즈 객체를 리스트에 저장해주세요.
	bookRepo.addBook(newBook);
	response.sendRedirect("books.jsp");
%>
