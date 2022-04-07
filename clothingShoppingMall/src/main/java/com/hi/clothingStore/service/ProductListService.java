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
		//입력받은 숫자를 올림한 정수를 리턴하는 함수 
		//1.lastPage 
		int lastPage = (int)Math.ceil((double)productListTotal/rowPerPage);
		System.out.println("========lastPage:"+lastPage);
		
		ProductPageVO page = new ProductPageVO(); 
		
		page.setBeginRow((currentPage-1)*rowPerPage); 
		page.setRowPerPage(rowPerPage);				  //0*rowPerPage    1    2    3   4....
													  //1*rowPerPage
													  //2*rowPerPage
		
		//dao 
		List<ProductListVO> list = productlistDAO.all(page);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage); 
		map.put("list", list); 
		
		return map; 
		
	}	
	
}
