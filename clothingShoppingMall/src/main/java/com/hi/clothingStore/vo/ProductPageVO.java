package com.hi.clothingStore.vo;

public class ProductPageVO {

	private int rowPerPage; //페이지당 행의 개수 
	private int beginRow; //시작 행
	//private int startPage; //페이지 숫자 리스트의 첫번째 시작 페이지 
	//private int endPage; //페이지 숫자리스트의 마지막 페이지 
	public int getRowPerPage() {
		return rowPerPage;
	}
	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}
	public int getBeginRow() {
		return beginRow;
	}
	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}
	@Override
	public String toString() {
		return "ProductPageVO [rowPerPage=" + rowPerPage + ", beginRow=" + beginRow + "]";
	}
	
	
	
}
