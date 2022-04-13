package com.hi.clothingStore.vo;

public class LikeVO {

	private int like_idx; 
	private String user_id; 
	private int product_idx; 
	private int likecheck;
	
	public int getLike_idx() {
		return like_idx;
	}
	public void setLike_idx(int like_idx) {
		this.like_idx = like_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	
	@Override
	public String toString() {
		return "likeVO [like_idx=" + like_idx + ", user_id=" + user_id + ", product_idx=" + product_idx + ", likecheck="
				+ likecheck + "]";
	} 
	
}
