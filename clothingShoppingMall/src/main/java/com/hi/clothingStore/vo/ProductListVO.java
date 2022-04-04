package com.hi.clothingStore.vo;

public class ProductListVO {

	private int p_idx;
	private String p_category;
	private String p_isbn;
	private String p_author;
	private String p_company;
	private int p_page;
	private String p_weight;
	private int p_price;
	private String p_title;
	private String p_content; 
	private String p_img; 
	private String p_mdfydate;
	private String p_rgstdate;
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_isbn() {
		return p_isbn;
	}
	public void setP_isbn(String p_isbn) {
		this.p_isbn = p_isbn;
	}
	public String getP_author() {
		return p_author;
	}
	public void setP_author(String p_author) {
		this.p_author = p_author;
	}
	public String getP_company() {
		return p_company;
	}
	public void setP_company(String p_company) {
		this.p_company = p_company;
	}
	public int getP_page() {
		return p_page;
	}
	public void setP_page(int p_page) {
		this.p_page = p_page;
	}
	public String getP_weight() {
		return p_weight;
	}
	public void setP_weight(String p_weight) {
		this.p_weight = p_weight;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_mdfydate() {
		return p_mdfydate;
	}
	public void setP_mdfydate(String p_mdfydate) {
		this.p_mdfydate = p_mdfydate;
	}
	public String getP_rgstdate() {
		return p_rgstdate;
	}
	public void setP_rgstdate(String p_rgstdate) {
		this.p_rgstdate = p_rgstdate;
	}
	@Override
	public String toString() {
		return "ProductListVO [p_idx=" + p_idx + ", p_category=" + p_category + ", p_isbn=" + p_isbn + ", p_author="
				+ p_author + ", p_company=" + p_company + ", p_page=" + p_page + ", p_weight=" + p_weight + ", p_price="
				+ p_price + ", p_title=" + p_title + ", p_content=" + p_content + ", p_img=" + p_img + ", p_mdfydate="
				+ p_mdfydate + ", p_rgstdate=" + p_rgstdate + "]";
	}
	
	
}
