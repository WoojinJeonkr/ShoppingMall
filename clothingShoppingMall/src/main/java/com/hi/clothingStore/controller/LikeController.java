package com.hi.clothingStore.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hi.clothingStore.service.LikeListService;
import com.hi.clothingStore.service.ProductListService;
import com.hi.clothingStore.vo.LikeVO;

@Controller
public class LikeController {

	@Autowired
	LikeListService likeListService; 
	
//	@RequestMapping("likeTotal")
//	public List<Integer> list(Model model, LikeVO vo) {
//		
//		
//		List<Integer> list = likeListService.getProductLikeList(vo);
//		
//		//model.addAttribute("", );
//		
//		model.addAttribute(list); 
//		
//		//return 은 파일 이름 addAttribute는 변수 
//		return "";
//		
//	}
	
	
	
	
	
}
