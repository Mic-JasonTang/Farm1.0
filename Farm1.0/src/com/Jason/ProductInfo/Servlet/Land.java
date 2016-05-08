package com.Jason.ProductInfo.Servlet;

public class Land {
	private String productId = "";
	private String productName = "";
	private String price = "";
	private String address = "";
	private String description = "";
	
	public Land() {
	}
	public Land(String productId, String productName, String price,
			String address, String description) {
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.address = address;
		this.description = description;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}	
