package com.hi.clothingStore.vo;

//likecheck 합쳐진 vo 
public class ProductListVO2 {


	private int product_idx;
	private String product_title;
	private String product_img;
	private String product_price;
	
	private int likecheck;
	
	private int level; 
	
	private String product_category; 
	
	private String product_tag;
	private String product_description;
	private String product_rgstdate;          //상품 상세화면에서 출력용으로만 하고  
	private String product_mdfydate;	      //날짜순으로 정렬은 이용하지 않을 것이기 떄문에 String으로 두어도 무방하다. 
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
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
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
	public String getProduct_mdfydate() {
		return product_mdfydate;
	}
	public void setProduct_mdfydate(String product_mdfydate) {
		this.product_mdfydate = product_mdfydate;
	}
	
	@Override
	public String toString() {
		return "ProductListVO2 [product_idx=" + product_idx + ", product_title=" + product_title + ", product_img="
				+ product_img + ", product_price=" + product_price + ", likecheck=" + likecheck + ", level=" + level
				+ ", product_category=" + product_category + ", product_tag=" + product_tag + ", product_description="
				+ product_description + ", product_rgstdate=" + product_rgstdate + ", product_mdfydate="
				+ product_mdfydate + "]";
	}
	
}
