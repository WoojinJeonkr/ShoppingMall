package com.hi.clothingStore.controller;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hi.clothingStore.dao.ProductListDAO;
import com.hi.clothingStore.service.LikeListService;
import com.hi.clothingStore.service.ProductListService;
import com.hi.clothingStore.vo.LikeVO;
import com.hi.clothingStore.vo.MemberVO;
import com.hi.clothingStore.vo.ProductListVO;
import com.hi.clothingStore.vo.ProductListVO2;
import com.hi.clothingStore.vo.ProductListVO4;

@Controller
public class ProductListController {

	@Autowired
	ProductListService productListService;
	LikeListService likeListService;

	@Autowired
	ProductListDAO dao;

	// 장바구니 추가
	@RequestMapping("productAdd")
	public void plus(ProductListVO vo, Model model, HttpSession session) {
		System.out.println("add vo" + vo);
		ArrayList<ProductListVO> list = null;
		if (session.getAttribute("basket") != null) {
			list = (ArrayList<ProductListVO>) session.getAttribute("basket");
		} else {
			list = new ArrayList<ProductListVO>();
		}
		list.add(vo);
		session.setAttribute("basket", list);
		model.addAttribute("size", list.size());
	}

	// 상품 상세보기 페이지
	@RequestMapping("productOne")
	public void one(MemberVO vo, ProductListVO2 vo2, Model model, HttpSession session,
			@RequestParam(value = "0", required = false) String user_id,
			@RequestParam(value = "0", required = false) String user_level
	) {
		System.out.println("ProductlistController vo2:" + vo2);
		ProductListVO2 vo3 = dao.productOne(vo2);

		// vo.setLevel(getuserLevel.);
		// MemberVO [user_id=null, user_pw=null, user_name=null, user_age=0,
		// user_tel=null, user_tag=null, user_addr=null, level=2]

		
//		if(user_id!=null) {
//			MemberVO = dao.getMemberLevel(user_id);
//			
//		}
		
		if(session.getAttribute("user_level")==null) {
			vo.setLevel(0);
		}else if((int)session.getAttribute("user_level")==1) {
			vo.setLevel(1);
		}else if((int)session.getAttribute("user_level")==2) {
			vo.setLevel(2);
		}
		
//		
//		 if((int)session.getAttribute("user_level")==1) {
//			 vo.setLevel(1);
//		 }else
//		 if((int)session.getAttribute("user_level")==2){
//			 vo.setLevel(2);
//		 }else {vo.setLevel(0); }
		  
		 

		session.setAttribute("user_level", vo.getLevel());
		session.setAttribute("user_id", vo.getUser_id());

		model.addAttribute("one", vo3);
	}

	/*
	 * HTTP Request 파라미터를 Handler 메소드의 파라미터 타입에 전달받을 때 사용하는 애노테이션이다. Handler메소드의
	 * 파라미터 타입이 Simple Type이고, 지원하는 인자 타입이 아닌 경우
	 * 
	 * @RequestParam으로 먼저 resolve되고 이후에 @ModelAttribute로 resolve된다
	 * 
	 * @RequestParam이 붙여진 인자의 타입이 String이 아닌 경우 Type Conversion이 자동으로 적용된다
	 * 
	 * @RequestParam이 String이 아닐 경우 Object로 변경해주는 건 DataBinder, 이 DataBinder가 사용하는
	 * PropertyEditor가 Java Bean spec을 따르기 때문에 이를 사용해서 바인딩 하려는 클래스는 무조건 Java Bean
	 * spec을 충족해야 하고 즉 , setter가 존재해야 한다
	 */
	@RequestMapping("productList")
	public String list(Model model, MemberVO memberVo, LikeVO vo,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "20", required = false) int rowPerPage,
			@RequestParam(value = "categoryName", required = false) String categoryName,
			@RequestParam(value = "searchWord", required = false) String searchWord, HttpSession session) {

		// 카테고리나 검색 이동 후 전체 상품목록으로 이동하는데 필요한 코드.

		System.out.println("=================productList의 memberVO" + memberVo);

		session.getAttribute("user_id");
		session.getAttribute("user_level");

		System.out.println("productListController의 categoryName 전" + categoryName);

		if (categoryName != null && categoryName.equals("")) {
			categoryName = null;
		}

		if (searchWord != null && searchWord.equals("")) {
			searchWord = null;
		}

		System.out.println("productListController의 categoryName 후" + categoryName);

		System.out.println("Controller productList의 rowPerPage" + searchWord);
		System.out.println("Controller productList의 productCategory" + categoryName);
		System.out.println("Controller productList의 currentPage" + currentPage);
		System.out.println("Controller productList의 rowPerPage" + rowPerPage);

		Map<String, Object> map = productListService.getProductList(currentPage, rowPerPage, categoryName, searchWord);
		// List<Integer> productLikeList = likeListService.getProductLikeList(vo);

		System.out.println("PLC map" + map);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("productListTotal", map.get("productListTotal"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("startIdx", map.get("startIdx"));
		model.addAttribute("endIdx", map.get("endIdx"));
		model.addAttribute("voListResult", map.get("voListResult"));
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("funcCount", map.get("funcCount"));
		model.addAttribute("categoryName", map.get("categoryName"));
		model.addAttribute("searchWord", map.get("searchWord"));
		// model.addAttribute("productLikeList",productLikeList);

		return "productList";

	}

	/*
	 * Java Bean: Java Bean API 명세를 따르는 클래스 1. 기본 생성자를 가지고 있어야 한다. 2. 인스턴스 변수는
	 * private 접근 지정자이어야 한다. 3. public의 getter와 setter를 가지고 있어야 한다. 4. Serializable
	 * 인터페이스를 구현해야 한다. (선택)
	 * 
	 * @RequestBody Form data가 아닌 json형식의 데이터를 가진 요청이 들어왔을 경우 Handler
	 * method는 @RequestBody애노테이션이 붙여진 인자를 JSON 형태의 데이터에서 setter없는 클래스의 객체로 만들어 준다
	 * 
	 * @RequestBody? -HTTP Request body를 읽고 HttpMessageConverter를 통해서 deserialized시켜
	 * Handler 메소드의 특정 인자 타입의 객체로 변환하기 위한 애노테이션이다.
	 * 
	 * MVC Config의 Message Converters 옵션을 사용함으로써 message conversion을 설정 및
	 * customizing할 수 있다. javax의 @valid, spring의 @validated 애노테이션을 사용함으로써 유효성 검사를 할
	 * 수 있다.
	 */

	// 상품 등록이 성공적으로 이루어졌는지 확인하기 위함.
	@RequestMapping("productIn")
	public String insert(ProductListVO vo, Model model) {
		int result = dao.productInsert(vo);
		System.out.println("productInsert의 result 값 1이면 성공 0이면 실패 " + result);
		// model.addAttribute("result",result);
		if (result == 1) {
			return "productSuccess";
		} else {
			return "productNo";
		}
	}

	// 상품 등록 화면으로 이동하기 위함.
	@RequestMapping("productInsert")
	public void insert2(ProductListVO vo, Model model) {

	}

	// 상품 삭제
	@RequestMapping("productDel")
	public void delete(ProductListVO vo, Model model) {
		System.out.println("Del ProductlistVO vo" + vo);
		int result = dao.productDelete(vo);
		model.addAttribute("result", result);
	}

	@RequestMapping("basketDel")
	public void delete2(ProductListVO vo, Model model) {
		System.out.println("basketDel vo" + vo);

	}

	// 상품 업데이트 잘 되었는지 확인.
	@RequestMapping("productUp")
	public void update(ProductListVO2 vo2, Model model) {
		System.out.println("======Controller productUp vo2========" + vo2);
		ProductListVO2 vo3 = dao.productOne(vo2);
		model.addAttribute("one", vo3);
	}

	// 상품 업데이트 정보 넘어오는 곳.
	@RequestMapping("productUpdate")
	public String update2(ProductListVO vo, Model model) {
		System.out.println("======Controller productUpdate vo========" + vo);
		int result = dao.productUpdate(vo);
		if (result == 1) {
			return "productSuccess";
		} else {
			return "productNo";
		}
	}

	//공공데이터 페이지로 이동 
	@RequestMapping("publicData")
	public void publicData() {

	}

	@RequestMapping("orderHistory")
	public void orderHistory(Model model, String user_id) {

		System.out.println("selectProductMyLike user_id" + user_id);

		/*
		 * //user_id null값인 경우 처리. if(user_id==null && user_id.isEmpty()) { user_id =
		 * ""; }
		 */
		List<Map<String, Object>> myOrder = dao.myOrderHistory(user_id);
		System.out.println("===============restAPI myOrderHistory" + myOrder);

		/*
		 * for(Map<String, Object> result : myLikeInfo) {
		 * System.out.println("myLikeInfo result:"+result);
		 * 
		 * }
		 */

		model.addAttribute("myOrder", myOrder);

		// return myProductLike; //json 변수 값 리턴

	}

	@RequestMapping("ProductpurchaseList")
	public String purchaseList(ProductListVO4 vo, Model model) {
		int result = dao.purchaseInsertInfo(vo);
		System.out.println("purchaseInsertInfo의 result 값 1이면 성공 0이면 실패 " + result);
		// model.addAttribute("result",result);
		if (result == 1) {
			return "productSuccess";
		} else {
			return "productNo";
		}
	}

	@RequestMapping("purchaseList")
	public void purchaseListMove() {

	}

}
