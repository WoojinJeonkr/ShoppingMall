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

	@RequestMapping("productList")
	//RequestParam을 사용하면 해당 파라미터가 있어야 한다. 
	//선택적으로 사용하고자 한다면 required=false로 설정 후, 디폴트 값 설정 
	public void list(Model model, @RequestParam(value="currentPage",defaultValue = "1",required = false)int currentPage,
								  @RequestParam(value = "rowPerPage", defaultValue = "30",required = false) int rowPerPage) {
		
		System.out.println("productList의 currentPage"+currentPage);
		System.out.println("productList의 rowPerPage"+rowPerPage);
		
		Map<String,Object> map = productListService.getProductList(currentPage, rowPerPage);
		
		model.addAttribute("currentPage", currentPage); 
		model.addAttribute("lastPage", map.get("lastPage")); 
		model.addAttribute("list", map.get("list")); 
		
	}
	
	@RequestMapping("productIn")
	public void insert(ProductListVO vo, Model model)  {
		int result = dao.insert(vo); //성공하면 1 실패하면0 
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
