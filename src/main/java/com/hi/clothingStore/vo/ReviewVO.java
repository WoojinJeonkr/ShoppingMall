package com.hi.clothingStore.vo;

import java.sql.Timestamp;

public class ReviewVO {

	private int review_idx;
	private int product_idx;
	private String user_id;
	private String review_content;
	private String review_img;
	private double review_score;
	private Timestamp review_rgstdate;
	private String review_label;
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public double getReview_score() {
		return review_score;
	}
	public void setReview_score(double review_score) {
		this.review_score = review_score;
	}
	public Timestamp getReview_rgstdate() {
		return review_rgstdate;
	}
	public void setReview_rgstdate(Timestamp review_rgstdate) {
		this.review_rgstdate = review_rgstdate;
	}
	public String getReview_label() {
		return review_label;
	}
	public void setReview_label(String review_label) {
		this.review_label = review_label;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [review_idx=" + review_idx + ", product_idx=" + product_idx + ", user_id=" + user_id
				+ ", review_content=" + review_content + ", review_img=" + review_img + ", review_score=" + review_score
				+ ", review_rgstdate=" + review_rgstdate + ", review_label=" + review_label + "]";
	}
}