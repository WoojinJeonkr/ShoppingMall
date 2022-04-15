package com.hi.clothingStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hi.clothingStore.service.LikeListService;

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
