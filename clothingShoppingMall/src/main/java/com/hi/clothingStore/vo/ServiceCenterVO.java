package com.hi.clothingStore.vo;

public class ServiceCenterVO {

	private int serviceIdx;
	private String serviceWriter;
	private String serviceTitle;
	private String serviceQuestion;
	private String serviceRgstday;
	
	public int getServiceIdx() {
		return serviceIdx;
	}
	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}
	public String getServiceWriter() {
		return serviceWriter;
	}
	public void setServiceWriter(String serviceWriter) {
		this.serviceWriter = serviceWriter;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public String getServiceQuestion() {
		return serviceQuestion;
	}
	public void setServiceQuestion(String serviceQuestion) {
		this.serviceQuestion = serviceQuestion;
	}
	public String getServiceRgstday() {
		return serviceRgstday;
	}
	public void setServiceRgstday(String serviceRgstday) {
		this.serviceRgstday = serviceRgstday;
	}
	
	@Override
	public String toString() {
		return "ServicecenterVO [serviceIdx=" + serviceIdx + ", serviceWriter=" + serviceWriter + ", serviceTitle="
				+ serviceTitle + ", serviceQuestion=" + serviceQuestion + ", serviceRgstday=" + serviceRgstday + "]";
	}

}
