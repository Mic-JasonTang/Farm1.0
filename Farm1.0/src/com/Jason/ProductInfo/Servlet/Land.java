package com.Jason.ProductInfo.Servlet;

/** 
* @ClassName: Land 
* @Description: 记录土地的信息
* @author: Jason
* @date: 2016年5月18日 下午11:19:39 
*/
public class Land {
	private String productId = "";
	private String userId = "";
	private String productName = "";
	private String price = "";
	private String address = "";
	private String description = "";
	private String date = "";
	
	public Land() {
		
	}
	
	public Land(String productId, String userId, String productName,
			String price, String address, String description, String date) {
		this.productId = productId;
		this.userId = userId;
		this.productName = productName;
		this.price = price;
		this.address = address;
		this.description = description;
		this.date = date;
	}

	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Land [productId=" + productId + ", userId=" + userId
				+ ", productName=" + productName + ", price=" + price
				+ ", address=" + address + ", description=" + description
				+ ", date=" + date + "]";
	}
	
}	
