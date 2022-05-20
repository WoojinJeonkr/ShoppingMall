package com.hi.clothingStore.vo;

import java.sql.Timestamp;

public class ServiceCenterVO {


	private int service_idx;
	private String user_id;
	private String service_title;
	private String service_question;
	private Timestamp service_rgstday;
	private int service_idx_re ;
	private int service_id_origin ;
	private int service_reply_group;
	private String service_cate;
	private int count;

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getService_cate() {
		return service_cate;
	}
	public void setService_cate(String service_cate) {
		this.service_cate = service_cate;
	}
	private String searchType; 
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getService_idx() {
		return service_idx;
	}
	public void setService_idx(int service_idx) {
		this.service_idx = service_idx;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getService_title() {
		return service_title;
	}
	public void setService_title(String service_title) {
		this.service_title = service_title;
	}
	public String getService_question() {
		return service_question;
	}
	public void setService_question(String service_question) {
		this.service_question = service_question;
	}
	public Timestamp getService_rgstday() {
		return service_rgstday;
	}
	public void setService_rgstday(Timestamp service_rgstday) {
		this.service_rgstday = service_rgstday;
	}
	public int getService_idx_re() {
		return service_idx_re;
	}
	public void setService_idx_re(int service_idx_re) {
		this.service_idx_re = service_idx_re;
	}
	public int getService_id_origin() {
		return service_id_origin;
	}
	public void setService_id_origin(int service_id_origin) {
		this.service_id_origin = service_id_origin;
	}
	public int getService_reply_group() {
		return service_reply_group;
	}
	public void setService_reply_group(int service_reply_group) {
		this.service_reply_group = service_reply_group;
	}
	@Override
	public String toString() {
		return "ServiceCenterVO [service_idx=" + service_idx + ", user_id=" + user_id + ", service_title="
				+ service_title + ", service_question=" + service_question + ", service_rgstday=" + service_rgstday
				+ ", service_idx_re=" + service_idx_re + ", service_id_origin=" + service_id_origin
				+ ", service_reply_group=" + service_reply_group + ", service_cate=" + service_cate + ", count=" + count
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
	
	
	
	
	
}
