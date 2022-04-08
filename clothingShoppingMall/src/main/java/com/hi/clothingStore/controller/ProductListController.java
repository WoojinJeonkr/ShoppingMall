package com.hi.clothingStore.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hi.clothingStore.dao.ProductListDAO;
import com.hi.clothingStore.service.ProductListService;
import com.hi.clothingStore.vo.ProductListVO;

@Controller
public class ProductListController {

	@Autowired
	ProductListService productListService; 
	
	@Autowired
	ProductListDAO dao;
	
	@RequestMapping("productAdd")
	public void plus(ProductListVO vo, Model model, HttpSession session) {
		System.out.println("add vo"+vo);
		ArrayList<ProductListVO> list = null; 
		if(session.getAttribute("basket")!=null) {
			list = (ArrayList<ProductListVO>)session.getAttribute("basket"); 
		}else {
			list = new ArrayList<ProductListVO>();
		}
		list.add(vo); 
		session.setAttribute("basket", list);
		model.addAttribute("size", list.size()); 
	}
	
	@RequestMapping("productOne")
	public void one(ProductListVO vo, Model model) {
		System.out.println("ProductlistController vo2:"+vo);
		ProductListVO vo2 = dao.one(vo);
		model.addAttribute("one", vo2);
	}

	/*HTTP Request 파라미터를 Handler 메소드의 파라미터 타입에 전달받을 때 
	 * 사용하는 애노테이션이다. 
	 * Handler메소드의 파라미터 타입이 Simple Type이고, 지원하는 인자 타입이 아닌 경우 
	 * @RequestParam으로 먼저 resolve되고 이후에 @ModelAttribute로 resolve된다 
	 * @RequestParam이 붙여진 인자의 타입이 String이 아닌 경우 Type Conversion이 
	 * 자동으로 적용된다 
	 * @RequestParam이 String이 아닐 경우 Object로 변경해주는 건 
	 * DataBinder, 이 DataBinder가 사용하는 PropertyEditor가 
	 * Java Bean spec을 따르기 때문에 이를 사용해서 바인딩 하려는 클래스는 무조건 
	 * Java Bean spec을 충족해야 하고 즉 , setter가 존재해야 한다 
	 */
	@RequestMapping("productList")
	public void list(Model model, @RequestParam(value="currentPage",defaultValue = "1",required = false)int currentPage,
								 // @RequestParam(value="startPage",defaultValue = "1",required = false)int startPage,
								 // @RequestParam(value="endPage",defaultValue = "1",required = false)int endPage,
								  @RequestParam(value = "rowPerPage", defaultValue = "20",required = false) int rowPerPage) {
		
		System.out.println("productList의 currentPage"+currentPage);
		System.out.println("productList의 rowPerPage"+rowPerPage);
		
		Map<String,Object> map = productListService.getProductList(currentPage, rowPerPage);
		
		model.addAttribute("currentPage", currentPage); 
		model.addAttribute("lastPage", map.get("lastPage")); 
		model.addAttribute("startidx",map.get("startidx")); 
		model.addAttribute("endidx",map.get("endidx")); 
		model.addAttribute("list", map.get("list")); 
		
	}
	
	/*
	 * Java Bean: Java Bean API 명세를 따르는 클래스 
	 * 1. 기본 생성자를 가지고 있어야 한다. 
	 * 2. 인스턴스 변수는 private 접근 지정자이어야 한다. 
	 * 3. public의 getter와 setter를 가지고 있어야 한다. 
	 * 4. Serializable 인터페이스를 구현해야 한다. (선택)
	 * 
	 * @RequestBody 
	 * Form data가 아닌 json형식의 데이터를 가진 요청이 들어왔을 경우 
	 * Handler method는 @RequestBody애노테이션이 붙여진 인자를 
	 * JSON 형태의 데이터에서 setter없는 클래스의 객체로 만들어 준다 
	 * 
	 * @RequestBody?
	 * -HTTP Request body를 읽고 HttpMessageConverter를 
	 * 통해서 deserialized시켜 Handler 메소드의 특정 인자 타입의 객체로 변환하기 위한
	 * 애노테이션이다. 
	 * 
	 * MVC Config의 Message Converters 옵션을 사용함으로써 
	 * message conversion을 설정 및 customizing할 수 있다. 
	 * javax의 @valid, spring의 @validated 애노테이션을 사용함으로써 
	 * 유효성 검사를 할 수 있다. 
	 * 
	 * 
	 * 
	 */
	
	
	
	
	
	@RequestMapping("productIn")
	public void insert(ProductListVO vo, Model model)  {
		int result = dao.insert(vo); 
		//model.addAttribute("result",result);
		//if(result == 1) {
		//	return "productIn";
		//}else {
		//	return "productNo"; 
		//}
	}
	
	@RequestMapping("productInsert")
	public void insert2(ProductListVO vo, Model model) {
	
	}

	@RequestMapping("productDel")
	public void delete(ProductListVO vo, Model model) {
		System.out.println("Del ProductlistVO vo"+vo);
		int result = dao.del(vo);
		model.addAttribute("result", result);
	}
	
	@RequestMapping("basketDel")
	public void delete2(ProductListVO vo, Model model) {
		System.out.println("basketDel vo"+vo);
		
	}

	@RequestMapping("productUp")
	public void update(ProductListVO vo, Model model) {
		System.out.println("======Controller productUp vo========"+vo);
		ProductListVO vo2 = dao.one(vo); 
		model.addAttribute("one", vo2); 
	}
	
	@RequestMapping("productUpdate")
	public String update2(ProductListVO vo, Model model) {
		System.out.println("======Controller productUpdate vo========"+vo);
		int result = dao.up(vo); 
		if(result == 1) {
			return "productUpdate";
		}else {
			return "productNo"; 
		}
	}
	
}
