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
	
	//상품 리스트 서비스 
	public Map<String, Object> getProductList(int currentPage, int rowPerPage, String categoryName, String searchWord){

	   System.out.println("ProductListService currentPage:"+currentPage);
	   System.out.println("ProductListService rowPerPage:"+rowPerPage);
	   System.out.println("ProductListService categoryName:"+categoryName);
	   System.out.println("ProductListService searchWord:"+searchWord);
		
		  //카테고리 내용 	
		  //팬츠, 가디건&풀오버, 데님/진, 드레스, 맨투맨&후디, 블레이저, 
		  //셔츠&블라우스, 쇼츠, 스커트 , 재킷&코트 , 탑&티셔츠  
		
		int productListTotal = productlistDAO.productListCount();


		System.out.println("========productListTotal:"+productListTotal);
		//Math.ceil() 입력받은 숫자보다 크거나 같은 정수 중 가장 적은 정수를 리턴 
		//Math.floor() 소수점 버림. 정수반환 
		//입력받은 숫자를 올림한 정수를 리턴하는 함수 
		
		//변수 가공. 
		//1.lastPage 
		//int lastPage = (int)Math.ceil((double)productListTotal/rowPerPage);
		int startIdx=0; 
		
		//-----------------------------------------------------------
		//10,20.30..단위에서 페이지 이전숫자리스트 안 보이는 것 해결할것. 

		
		if(currentPage%10!=0) {//10의 배수가 아닐 때 
			startIdx = (int) ((Math.floor(currentPage/10.0)*10)+1);//2. 숫자리스트의 첫번째 1, 11, 21, 31 ..
		}else {
			startIdx = currentPage-9; 
		}
		
		//10의 배수 일때 
			/*
			 * 현재 페이지가 10이면 startIdx = 1 
			 * 현재 페이지가 20이면 startIdx = 11
			 * 현재 페이지가 30이면 startIdx = 21
			 * startIdx = 현재페이지에서 -9라는 규칙이 나온다.  
			 */
		//if(currentPage%10==0) {	
		//	startIdx = currentPage-9; 
		//}
		
		
		//-----------------------------------------------------------
		//3. 숫자리스트의 마지막번째 10, 20, 30, 40... 
		int endIdx = ((int)Math.ceil((currentPage/10.0)))*10;
		//int endPage = ((int)Math.ceil((double)(currentPage/10.0))*10);
		//int endCorrIdx = 
		
		//System.out.println("========lastPage:"+lastPage);
		System.out.println("========startIdx:"+startIdx);
		System.out.println("========endIdx:"+endIdx);
		
		//System.out.println("========lastPage:"+startPage);
		//System.out.println("========lastPage:"+endPage);
		
		ProductPageVO page = new ProductPageVO(); 
		
		//beginRow, rowPerPage
		
		page.setBeginRow((currentPage-1)*rowPerPage); 
		page.setRowPerPage(rowPerPage);				  //0*rowPerPage    1    2    3   4....
													  //1*rowPerPage
													  //2*rowPerPage
		page.setProduct_category(categoryName);
		page.setSearchWord(searchWord);
		//page.setStartPage(((currentPage/10.0)*10)+1); //각 페이지의 1, 11, 21, 31을 나타내기 위함 
		
		int beginRow = page.getBeginRow();
		
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
		
		//페이징 뿐만 아니라 담아질 것들이 많아질 것을 예상해 map에 다 담아준다. 카테고리..검색..페이징..등등 
		//DAO로 넘겨주는 변수들 
		
		
		//1~20 1 페이지 
		//21~40 2페이지 
		//41~60 3페이지 .... 
		
		//-------------------------------------------------------
		// %20 20으로 나누었을 때 나머지가 1
		//     20으로 나누었을때 나머지가 2 
		//     20으로 나누었을 때 나머지가 3
		//-------------------------------------------------------------
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow",beginRow);
		paramMap.put("rowPerPage",rowPerPage);
		paramMap.put("categoryName",categoryName); 
		paramMap.put("searchWord",searchWord); 
		


		//dao 호출 
		List<Map<String,Object>> list = productlistDAO.productList(paramMap);
		List<String> categoryList = productlistDAO.selectCategoryList();
		int funcCount = productlistDAO.funcCount(paramMap);
		

		int lastPage = (int)Math.ceil((double)funcCount/rowPerPage);
		
		 
		//상품이 있는 위치까지만 숫자리스트 보일 수 있게  
		if(endIdx>lastPage) { 
			endIdx = lastPage;
		}

		System.out.println("Service의 funcCount:"+funcCount);
		System.out.println("Service의 list:"+list);
		System.out.println("Service의 categoryList:"+categoryList);
		
		
		//Service에서 Controller로 넘어가는 변수 
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("lastPage", lastPage); 
		returnMap.put("list", list);
		returnMap.put("startIdx", startIdx); 
		returnMap.put("endIdx", endIdx); 
		returnMap.put("categoryList",categoryList); 
		returnMap.put("funcCount", funcCount); 
		returnMap.put("categoryName", categoryName); 
		returnMap.put("searchWord", searchWord); 
		
		//map.put("productListTotal",productListTotal); 
		
		return returnMap; 
		
	}	
	
}
