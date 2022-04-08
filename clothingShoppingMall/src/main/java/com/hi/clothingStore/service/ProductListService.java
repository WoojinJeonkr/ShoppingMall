package com.hi.clothingStore.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.clothingStore.dao.ProductListDAO;
import com.hi.clothingStore.vo.ProductListVO;
import com.hi.clothingStore.vo.ProductPageVO;

@Service
public class ProductListService {

	@Autowired
	ProductListDAO productlistDAO;
	
	public Map<String, Object> getProductList(int currentPage, int rowPerPage){
		
		int productListTotal = productlistDAO.count();
		
		System.out.println("========productListTotal:"+productListTotal);
		//Math.ceil() 입력받은 숫자보다 크거나 같은 정수 중 가장 적은 정수를 리턴 
		//Math.floor() 소수점 버림. 정수반환 
		//입력받은 숫자를 올림한 정수를 리턴하는 함수 
		
		//변수 가공. 
		//1.lastPage 
		int lastPage = (int)Math.ceil((double)productListTotal/rowPerPage);
		//2. 숫자리스트의 첫번째 1, 11, 21, 31 ..
		int startIdx = (int) ((Math.floor(currentPage/10.0)*10)+1);
		//3. 숫자리스트의 마지막번째 10, 20, 30, 40... 
		int endIdx = ((int)Math.ceil((currentPage/10.0)))*10;
		
		if(endIdx>lastPage) {
			endIdx = lastPage;
		}
		
		//int endPage = ((int)Math.ceil((double)(currentPage/10.0))*10);
		//int endCorrIdx = 
		
		System.out.println("========lastPage:"+lastPage);
		System.out.println("========startIdx:"+startIdx);
		System.out.println("========endIdx:"+endIdx);
		
		//System.out.println("========lastPage:"+startPage);
		//System.out.println("========lastPage:"+endPage);
		
		
		
		
		ProductPageVO page = new ProductPageVO(); 
		
		page.setBeginRow((currentPage-1)*rowPerPage); 
		page.setRowPerPage(rowPerPage);				  //0*rowPerPage    1    2    3   4....
													  //1*rowPerPage
													  //2*rowPerPage
		//page.setStartPage(((currentPage/10.0)*10)+1); //각 페이지의 1, 11, 21, 31을 나타내기 위함 
		
		
		/*
		 * 1.currentPage에 10을 나눈다.
		 * 2.소수부분을 버린다 (정수형 변환)
		 * 3.*10을 한다. 
		 * 4.1을 더한다. 
		 * result: 1, 11 ... 
		 */
		
		
		//page.setEndPage(((int)Math.ceil((currentPage/10.0)))*10); //각 페이지의 마지막 숫자페이지 10, 20, 30,...페이지를 나타내기 위함 
		//page.setEndPage(startPage+9);
		//System.out.println("Service부분========startPage:"+startPage);
	 	//System.out.println("Service부분========endPage:"+page);
		
		//dao 
		List<ProductListVO> list = productlistDAO.all(page);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage); 
		map.put("list", list);
		map.put("startIdx", startIdx); 
		map.put("endIdx", endIdx); 
		//map.put("productListTotal",productListTotal); 
		
		return map; 
		
	}	
	
}
