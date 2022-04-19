package com.hi.clothingStore.vo;


//구매 이력 vo 
public class ProductListVO4 {

	private int info_idx; 
	private int product_idx; 
	private String payment_method; 
	private String user_id; 
	private String payment_total; 
	private String recipient_info; 
	private String recipient_addr; 
	private String purchase_product; 
	private int purchase_quantity; 
	private String payment_date;
	public int getInfo_idx() {
		return info_idx;
	}
	public void setInfo_idx(int info_idx) {
		this.info_idx = info_idx;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPayment_total() {
		return payment_total;
	}
	public void setPayment_total(String payment_total) {
		this.payment_total = payment_total;
	}
	public String getRecipient_info() {
		return recipient_info;
	}
	public void setRecipient_info(String recipient_info) {
		this.recipient_info = recipient_info;
	}
	public String getRecipient_addr() {
		return recipient_addr;
	}
	public void setRecipient_addr(String recipient_addr) {
		this.recipient_addr = recipient_addr;
	}
	public String getPurchase_product() {
		return purchase_product;
	}
	public void setPurchase_product(String purchase_product) {
		this.purchase_product = purchase_product;
	}
	public int getPurchase_quantity() {
		return purchase_quantity;
	}
	public void setPurchase_quantity(int purchase_quantity) {
		this.purchase_quantity = purchase_quantity;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	
	@Override
	public String toString() {
		return "ProductListVO4 [info_idx=" + info_idx + ", product_idx=" + product_idx + ", payment_method="
				+ payment_method + ", user_id=" + user_id + ", payment_total=" + payment_total + ", recipient_info="
				+ recipient_info + ", recipient_addr=" + recipient_addr + ", purchase_product=" + purchase_product
				+ ", purchase_quantity=" + purchase_quantity + ", payment_date=" + payment_date + "]";
	}
	
	
	
}
