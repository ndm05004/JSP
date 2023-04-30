<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	// 1. 넘겨받은 폼 데이터 전부를 받아서 변수에 초기화해주세요.
	//  - 초기화 하기 위한 변수는 아래 Book 클래스 newBook변수에 setter를 통해 담긴 변수를 참고해주세요.
	BookRepository bookRepo = BookRepository.getInstance();
	String realFolder = request.getServletContext().getRealPath("/resources/images");
	String encType ="UTF-8";
	int maxSize = 5 * 1024 * 1024; 
	
	File file = new File(realFolder);
	if(!file.exists()){
		file.mkdirs();
	}
	
	String bookId        = ""; 
	String name          = ""; 
	String unitPrice    = ""; 
	String author        = ""; 
	String description   = ""; 
	String publisher     = ""; 
	String category      = ""; 
	String unitsInStock  = ""; 
	String totalPages     = ""; 
	String releaseDate   = ""; 
	String condition     = ""; 
	String fileName      = ""; 
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Map<String, String> bookMap = new HashMap<>();
	
	while(params.hasNext()){
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()){
			 String fieldName = item.getFieldName();
		
			if(fieldName.equals("bookId")){
				bookId  = item.getString(encType);
			}else if(fieldName.equals("name")){
				name = item.getString(encType);
			}else if(fieldName.equals("unitPrice")){
		        unitPrice = item.getString(encType);
		    }else if(fieldName.equals("author")){
		    	author  = item.getString(encType);
		    }else if(fieldName.equals("description")){
		        description = item.getString(encType);
		    }else if(fieldName.equals("publisher")){
		    	publisher = item.getString(encType);
		    }else if(fieldName.equals("category")){
		        category = item.getString(encType);
		    }else if(fieldName.equals("unitsInStock")){
		    	unitsInStock = item.getString(encType);
		    }else if(fieldName.equals("totalPages")){
		    	totalPages = item.getString(encType);
		    }else if(fieldName.equals("releaseDate")){
		    	releaseDate = item.getString(encType);
		    }else if(fieldName.equals("condition")){
		    	condition = item.getString(encType);
		    }
		}else{
		    	String fileFieldName = item.getFieldName(); // 요청 파라미터 이름
		    	fileName = item.getName(); // 저장 파일의 이름
		    	String contentType = item.getContentType(); // 파일 콘텐츠 유형
		        String originalFileName = fileName;
		        long fileSize = item.getSize();
		        File saveFile = new File(realFolder + "/" + fileName);
		        item.write(saveFile); // 파일 복사
		    }
	
	}
	
	
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
	newBook.setTotalPages(Integer.parseInt(totalPages));
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);

	// 2. 책 1권의 정보가 담긴 자바빈즈 객체를 리스트에 저장해주세요.
	bookRepo.addBook(newBook);
	response.sendRedirect("books.jsp");
%>
