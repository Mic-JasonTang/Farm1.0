package com.Jason.ProductInfo.Servlet;

public class Images {
	private String productId = "";
	private String productClass = "";
	private String guidFileName = "";
	private String realFileName = "";
	private String storeDir = "";
	private String date  = "";
	
	public Images(String productId, String productClass, String guidFileName,
			String realFileName, String storeDir, String date) {
		this.productId = productId;
		this.productClass = productClass;
		this.guidFileName = guidFileName;
		this.realFileName = realFileName;
		this.storeDir = storeDir;
		this.date = date;
	}
	
	public Images() {
	}

	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductClass() {
		return productClass;
	}
	public void setProductClass(String productClass) {
		this.productClass = productClass;
	}
	public String getGuidFileName() {
		return guidFileName;
	}
	public void setGuidFileName(String guidFileName) {
		this.guidFileName = guidFileName;
	}
	public String getRealFileName() {
		return realFileName;
	}
	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}
	public String getStoreDir() {
		return storeDir;
	}
	public void setStoreDir(String storeDir) {
		this.storeDir = storeDir;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
