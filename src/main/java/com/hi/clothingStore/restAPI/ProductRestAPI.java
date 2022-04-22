package com.hi.clothingStore.restAPI;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hi.clothingStore.dao.ProductListDAO;
import com.hi.clothingStore.vo.ProductListVO4;

@RestController
public class ProductRestAPI {

	@Autowired
	ProductListDAO productListDao; 
	
	@PostMapping("orderInsert")
	public int orderInsert(Model model, ProductListVO4 vo) {
		System.out.println("======================ProductListController의 orderInsert vo"+ vo);
		int result =productListDao.purchaseInsertInfo(vo); 
		return result;
	}
	
	/*
	 * @GetMapping("getUserLevel")
	 * 
	 * @ResponseBody public MemberVO memberGetUserLevel(Model model, String user_id)
	 * {
	 * 
	 * System.out.println("ProductListController의 getUserLevel user_id"+user_id);
	 * MemberVO levelValue= productListDao.getMemberLevel(user_id);
	 * 
	 * return levelValue;
	 * 
	 * }
	 */
	
}
