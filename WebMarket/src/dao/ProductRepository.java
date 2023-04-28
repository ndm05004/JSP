package dao;

import java.util.ArrayList;

import vo.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	//싱글톤
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Reniuana HD display, 8-megapixel isight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("new");
		phone.setFilename("P1234.png");
		
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.7-inch, IPS LED HD display, 5rd Generation Intel Core Processors");
		notebook.setCategory("NoteBook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.**125.6.6mm, Super AMLED display, Octa-core Processers");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
	}
	
	// 전체 상품 조회
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	// productId에 해당하는 상품 1개 조회
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null &&
					product.getProductId().equals(productId)) {
				productById = product;
				break;	
			}	
		}
		return productById;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	

}
