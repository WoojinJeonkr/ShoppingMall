package com.hi.clothingStore.vo;

public class ProductListVO3 {

	//좋아요 페이지를 위한 vo 
	private int product_idx; 
	private String product_title; 
	private String product_img; 
	private int product_price; 
	private String product_category; 
	private String product_tag; 
	private String product_description; 
	private String product_rgstdate;
	private String user_id; 
	private int likecheck;
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
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
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
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
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_rgstdate() {
		return product_rgstdate;
	}
	public void setProduct_rgstdate(String product_rgstdate) {
		this.product_rgstdate = product_rgstdate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	
	@Override
	public String toString() {
		return "ProductListVO3 [product_idx=" + product_idx + ", product_title=" + product_title + ", product_img="
				+ product_img + ", product_price=" + product_price + ", product_category=" + product_category
				+ ", product_tag=" + product_tag + ", product_description=" + product_description
				+ ", product_rgstdate=" + product_rgstdate + ", user_id=" + user_id + ", likecheck=" + likecheck + "]";
	} 
	
}
