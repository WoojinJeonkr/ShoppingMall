package com.hi.clothingStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.clothingStore.dao.LikeDAO;
import com.hi.clothingStore.service.LikeListService;
import com.hi.clothingStore.vo.LikeVO;

@Controller
public class LikeController {

	@Autowired
	LikeListService likeListService; 
	
	@Autowired
	LikeDAO likeDAO;
	
	
	
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
	
	@RequestMapping("createMemberLike")
	public int memberLike(Model model, LikeVO vo) {
		
		int result = likeDAO.createMemberLike(vo);
		
		return 0;
	}
	
	@RequestMapping("selectMemberLikeOne")
	public LikeVO selectOneLike(Model model,LikeVO vo) {
		
		return vo;
		
	}
	
	@RequestMapping("deleteMemberLike")
	public int memberLikeCancel(Model model,LikeVO vo) {
		
		
		
		return 0; 
	}
	
	
	
}
