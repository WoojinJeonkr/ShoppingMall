package com.hi.clothingStore.vo;

public class ServiceCenterFaqVO {


	private int service_faq_idx;
	private String service_faq_category;
	private String service_faq_question;
	private String service_faq_answer;
	private int service_notice;
	public int getService_faq_idx() {
		return service_faq_idx;
	}
	public void setService_faq_idx(int service_faq_idx) {
		this.service_faq_idx = service_faq_idx;
	}
	public String getService_faq_category() {
		return service_faq_category;
	}
	public void setService_faq_category(String service_faq_category) {
		this.service_faq_category = service_faq_category;
	}
	public String getService_faq_question() {
		return service_faq_question;
	}
	public void setService_faq_question(String service_faq_question) {
		this.service_faq_question = service_faq_question;
	}
	public String getService_faq_answer() {
		return service_faq_answer;
	}
	public void setService_faq_answer(String service_faq_answer) {
		this.service_faq_answer = service_faq_answer;
	}
	public int getService_notice() {
		return service_notice;
	}
	public void setService_notice(int service_notice) {
		this.service_notice = service_notice;
	}
	@Override
	public String toString() {
		return "ServiceCenterFaqVO [service_faq_idx=" + service_faq_idx + ", service_faq_category="
				+ service_faq_category + ", service_faq_question=" + service_faq_question + ", service_faq_answer="
				+ service_faq_answer + ", service_notice=" + service_notice + "]";
	}
	
	
}
