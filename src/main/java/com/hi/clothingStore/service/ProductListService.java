package com.hi.clothingStore.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.clothingStore.dao.LikeDAO;
import com.hi.clothingStore.dao.ProductListDAO;
import com.hi.clothingStore.vo.ProductPageVO;

@Service
public class ProductListService {

	@Autowired
	ProductListDAO productlistDAO;
	
	@Autowired
	LikeDAO likeDAO;
	
	//상품 리스트 서비스 
	public Map<String, Object> getProductList(int currentPage, int rowPerPage, String categoryName, String searchWord){

	   System.out.println("ProductListService currentPage:"+currentPage);
	   System.out.println("ProductListService rowPerPage:"+rowPerPage);
	   System.out.println("ProductListService categoryName:"+categoryName);
	   System.out.println("ProductListService searchWord:"+searchWord);
		
		
	    //상품 총 리스트 토탈 카운트 
		int productListTotal = productlistDAO.productListCount();
		
		//=========================================================페이징 가공===============================================
		
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
		
		//================================================================페이징 가공===================================================================
		
		//=========================================================좋아요 전체 리스트 업데이트 ==============================================================
				
		//product_idx 상품에 따른 총 좋아요 개수 메서드. 
		//List에 담아주지 않을 시 Type mismatch: cannot convert from Map<String,Object> to List<Object>
		//List와 Map은 저장하는 구조가 다름. 
		//List는 Memory안에 특정한 동일 공간에 사용. 내부구현은 배열로 되어있기 때문. 
		//단순히 쇼핑몰 페이지에서 상품을 나열할 때는 순차적으로 저장된 데이터를 화면에 배치시키는
		//ArrayList가 좋고, 삽입, 삭제가 빈번하게 이루어지는 경우는 
		//기존 크기의 배열을 늘린 후 삽입/삭제 데이터를 처리하고 copy된 데이터를 붙여야 하므로 
		//많은 양의 요소를 copy하기 때문에 내부적으로 성능이 떨어질 수 있다. 
		
		//Map은 List처럼 한꺼번에 저장하는 것이 아니라 Map에 저장할 떄마다 빈 공간을 찾아 저장. 
		//데이터 저장 속도가 느리고, 쌍을 이루는 Key, Value 형태로 이루어진다. 
		//단순한 포지션(인덱스)보다, 저장하고 싶은 데이터가 특별한 Key일 때 map을 사용하는 것이 좋다. 
		
		
		ArrayList<Map<String, Object>> productLikeRenew = (ArrayList<Map<String, Object>>) likeDAO.SumProductLike(page);
		
		System.out.println("***************ProductListService의 productLikeRenew"+productLikeRenew);
		
		/*
		 * [{product_idx=3, likecheck=2}, {product_idx=10, likecheck=2},
		 * {product_idx=12, likecheck=1}, {product_idx=5, likecheck=1}, {product_idx=7,
		 * likecheck=1}, {product_idx=11, likecheck=1}, {product_idx=13, likecheck=1},
		 * {product_idx=20, likecheck=1}, {product_idx=30, likecheck=1},{product_idx=40,
		 * likecheck=1}, {product_idx=59, likecheck=1}]
		 */

				
		//java.lang.ClassCastException: java.util.ArrayList cannot be cast to java.util.HashMap 에러 발생하므로 분리시키겠음. 
		
		
		//규칙 체크. 
		//HashMap<String, Object> test = (HashMap<String, Object>) productLikeRenew.get(0).entrySet();
		//test = (HashMap<String, Object>) productLikeRenew.get(1).entrySet();
		//test = (HashMap<String, Object>) productLikeRenew.get(2).entrySet();
		
		
		//System.out.println("*************************ProductListService의 test"+test);
		//*************************ProductListService의 test{product_idx=3, likecheck=2}
		
		/*
		 * int hashIndex = -1; HashMap<String, Object> reNew2 = new HashMap<String,
		 * Object>();
		 * 
		 * 
		 * 
		 * for(Map<String, Object> reNew : productLikeRenew) { hashIndex++;
		 * System.out.println("hashIndex"+hashIndex);
		 * 
		 * //HashMap<String, Object> hashTest // (HashMap<String, Object>)
		 * reNew.get(hashIndex); //System.out.println("reNew"+reNew);
		 * //reNew2.putAll(reNew);
		 * 
		 * //reNew2.put()
		 * 
		 * Iterator<Entry<String,Object>> entries = reNew.entrySet().iterator();
		 * 
		 * //System.out.println("entries입니다."+entries); while(entries.hasNext()) {
		 * Map.Entry<String, Object> entry = entries.next();
		 * 
		 * System.out.println("entry"+entry);
		 * //System.out.println("[Key]"+entry.getKey()+"[Value]"+entry.getValue());
		 * //reNew2.putAll((Map<? extends String, ? extends Object>) entry);
		 * 
		 * }
		 * 
		 * }
		 */
				
		//System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■like reNew2:"+reNew2);
		
		//=========================================================좋아요 전체 리스트 업데이트 ==============================================================
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow",beginRow);
		paramMap.put("rowPerPage",rowPerPage);
		paramMap.put("categoryName",categoryName); 
		paramMap.put("searchWord",searchWord); 
		
		//dao 호출 
		//List<Map<String,Object>> list = productlistDAO.productList(paramMap);
		List<Map<String,Object>> list = productlistDAO.productList(paramMap);
		
		
		//String data = list.get(0).get("product_idx").toString();
		//System.out.println("★★★★★★★★★★★★★★★★★★★★★★List<Map<String,Object> 가공 test :"+data);
		
		//=====================================================좋아요 1차 가공================================================================
		
		ArrayList<Map<String,Object>> voListResult = new ArrayList<Map<String,Object>>();
		
		//likecheck : 0으로 반복문을 통해서 각각의 map에 넣어준다.
		//전체의 상품리스트들의 좋아요를 보여주기 위함. 
		
			for(Map<String, Object> voList : list) {
				//System.out.println("ProductListService에 존재하는 voList:"+voList);
				//Map<String,Object> voList2 = list.get(list.indexOf(voList));  
				voList.put("likecheck", 0); 
				
				
				System.out.println("==ProductList Service의 voList들:"+voList);
				
				voListResult.add(voList); 
				//이 반복문이 끝나면 사라지므로 따로 담아둘 객체를 선언해서 담아준다. 
				
				//System.out.println("");
				//Map<String, Object> data = list.get(0); 
				//data.put("likecheck", 0);
		}
			
		
		//like check:0이 잘 들어간 것을 확인. 
		System.out.println("========voListResult"+voListResult);
		
		//ArrayList<Map<String,Object>> voListResult
		//ArrayList<Map<String,Object>> productLikeRenew
		
		
		/*
		 * IndexOutofRange에러.. 첫 페이지만 기준으로 상품이 들어온 20개의 정보에만 현재 likecheck가 들어오는 걸로 되어있어서 
		 * 그거보다 큰 product_idx를 지금 현재 못 넣는 상태. 
		 * 페이지 넘어갈 때마다 product_idx도 페이징으로 제한을 걸어 IndexOutofRange 방지완료.
		 * 전체 정보를 가져온뒤 likecheck를 넣어주고 그것을 20개로 나누고.. 전체정보를 가져온 곳에다가 업데이트 시킬것...
		 */
		
		//ArrayList 두 개를 가져와서 product_idx를 기준으로 likehceck만 갱신할 수 있도록 넣어준다. 
		//MySQL 의 INT형 컬럼 데이터를 HashMap 타입으로 받아 java에서 사용하려고 할때 오류 발생 String.valueOf로 해결. 
		//Mybatis에서 int형 컬럼 데이터를 map으로 받을 때 자동으로 BigDecimal로 변환 시킴. 
		//BigDecimal은 Integer의 자식임. 그래서 오토박싱과 오토언박싱이 일어남.  
		//ex) int index = ((BigDecimal)dataMap.put("number")).intValue(); 
		//이렇게 해결해도 됌. 
		
		for(int i=0;i<productLikeRenew.size();i++) {
			 try { 
			System.out.println("================voListResult에서 likecheck변환될 개수:"+i);
			
			
			Map<String,Object> map2 = productLikeRenew.get(i); 
			
			
			System.out.println("map2========================"+map2);
			int product_idx = Integer.parseInt(String.valueOf(map2.get("product_idx"))); 
			int likecheck = Integer.parseInt(String.valueOf((map2.get("likecheck"))));
			
			
			
			
			Map<String,Object> map = voListResult.get(product_idx-1); 
			//원래는 자리에 맞춰서 likecheck를 변환해서 넣을 생각이었으나 
			//페이지가 넘어갈 때마다 중복해서 likecheck의 총 하트 개수가 중복되서 들어가기 떄문에 
			//ArrayList 두 개의 product_idx 가 일치하는 순간에만 넣을 수 있도록 if 조건문 작성 
			int comp_idx = Integer.parseInt(String.valueOf(map.get("product_idx"))); 
			 
			System.out.println("map=========================="+map);
			
			
			if(comp_idx==product_idx) { //if조건문을 추가해주니 해당 부분에만 잘 입력되는 것을 확인했음. 
			
				map.put("likecheck", likecheck); 
			}
			
			
			System.out.println("product_idx"+product_idx);
			System.out.println("likecheck"+likecheck);
			
			 }catch(IndexOutOfBoundsException e) {//여러가지 기능들이 복합적으로 한 페이지에 들어있기 때문에 
				 								//잘 되던 기능들도 새로운 기능들이 추가됨에 따라 에러가 날 수 있는 상황의 여지가 있으므로 
				 								//예외처리를 넣어줬음. 
				e.printStackTrace();
			}
			
			 
			 
			 
		} 
		System.out.println("2차 가공한 결과 voListResult"+voListResult);
		
		//System.out.println("★★★★★★★★★★★★★★★★★★★★★★List<Map<String,Object> 가공 test"+data);
		
		//map 데이터를 바꾸려면 반복문 또는 스트림을 활용 
		
		//		for(Map<String,Object> l : list) {
		//			System.out.println("============리스트에 담겨있는 map =======================");
		//			System.out.println("product_idx"+l.get("product_idx"));
		//			System.out.println("product_price"+l.get("product_price"));
		//			System.out.println("product_description"+l.get("product_description"));
		//			System.out.println("product_title"+l.get(" product_title"));
		//			System.out.println("product_category"+l.get("product_category"));
		//			System.out.println("product_img"+l.get("product_img"));
		//			System.out.println("product_rgstdate"+l.get("product_rgstdate"));
		//		}
		
		//		Spliterator<Map<String, Object>>list2 = list.spliterator();
		//		
		//		System.out.println("***************ProductListService list ***************** "+list);
		//		System.out.println("***************ProductListService list ***************** "+List(list2));
		
		/*
		 *[{product_rgstdate=2022-04-05 11:20:12.0, product_idx=1, product_price=49900, product_description=크롭트 가디건, 
		 * 분리.
		 * 
		 * List에서 빼고 
		 * Map 딕셔너리 형태로 담긴 Object마다 숫자 0을 채워 넣어준다음에.. 
		 * VO 없는 상태로 진행. 
		 * 
		 */
		
		//=====================================================좋아요 1차 가공================================================================
		
		//map 
		//Map<String,Object> map = new HashMap<String, Object>();
		
		//map.put("", value)
		//list.add(map); 
		
		//================================================숫자리스트 가공====================================================
		List<String> categoryList = productlistDAO.selectCategoryList();
		int funcCount = productlistDAO.funcCount(paramMap);
		

		int lastPage = (int)Math.ceil((double)funcCount/rowPerPage);
		
		 
		//상품이 있는 위치까지만 숫자리스트 보일 수 있게  
		if(endIdx>lastPage) { 
			endIdx = lastPage;
		}

		System.out.println("Service의 funcCount:"+funcCount);
		System.out.println("Service의 categoryList:"+categoryList);
		
		
		//================================================숫자리스트 가공====================================================
		
		//Service에서 Controller로 넘어가는 변수 
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("lastPage", lastPage); 
		returnMap.put("voListResult", voListResult);
		returnMap.put("startIdx", startIdx); 
		returnMap.put("endIdx", endIdx); 
		returnMap.put("categoryList",categoryList); 
		returnMap.put("funcCount", funcCount); 
		returnMap.put("categoryName", categoryName); 
		returnMap.put("searchWord", searchWord); 
		//returnMap.put("like", like); 
		
		
		//map.put("productListTotal",productListTotal); 
		
		return returnMap; 
		
	}
	
}
