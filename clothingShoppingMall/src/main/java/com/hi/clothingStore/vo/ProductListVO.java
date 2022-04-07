package com.hi.clothingStore.vo;

import com.sun.jmx.snmp.Timestamp;

public class ProductListVO {

	private int product_number;
	private String product_title;
	private String product_img;
	private String product_price;
	private String product_category;
	private String product_tag;
	private String product_like;
	private String product_description;
	private Timestamp product_rgstdate;
	private Timestamp product_mdfydate;
	
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_tag() {
		return product_tag;
	}
	public void setProduct_tag(String product_tag) {
		this.product_tag = product_tag;
	}
	public String getProduct_like() {
		return product_like;
	}
	public void setProduct_like(String product_like) {
		this.product_like = product_like;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public Timestamp getProduct_rgstdate() {
		return product_rgstdate;
	}
	public void setProduct_rgstdate(Timestamp product_rgstdate) {
		this.product_rgstdate = product_rgstdate;
	}
	public Timestamp getProduct_mdfydate() {
		return product_mdfydate;
	}
	public void setProduct_mdfydate(Timestamp product_mdfydate) {
		this.product_mdfydate = product_mdfydate;
	}
	
	@Override
	public String toString() {
		return "ProductListVO [product_number=" + product_number + ", product_title=" + product_title + ", product_img="
				+ product_img + ", product_price=" + product_price + ", product_category=" + product_category
				+ ", product_tag=" + product_tag + ", product_like=" + product_like + ", product_description="
				+ product_description + ", product_rgstdate=" + product_rgstdate + ", product_mdfydate="
				+ product_mdfydate + "]";
	}
	
}
