package com.hi.clothingStore.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@SuppressWarnings("null")
	@RequestMapping("likeCheck")
	@ResponseBody
	public int memberLike(Model model,String user_id, Integer product_idx) {
		
		
		//user_id null값인 경우 처리. 
		if(user_id==null && user_id.isEmpty()) {
			user_id = "";
		}
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id); 
		paramMap.put("product_idx", product_idx); 
		
		int result = likeDAO.selectOneLikeCount(paramMap);
		
		System.out.println("===============likeCheck result"+result);
		
		model.addAttribute("result",result); 
		
		return result;
	}
	

	@SuppressWarnings("null")
	@PutMapping("likeCheckRevert")
	public int memberLikeRevert(Model model,String user_id, Integer product_idx) {
		
		
		//user_id null값인 경우 처리. 
		if(user_id==null && user_id.isEmpty()) {
			user_id = "";
		}
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id); 
		paramMap.put("product_idx", product_idx); 
		
		Integer result = likeDAO.memberLikeRevert(paramMap);
		
		/*
		 * if(result==null) { result=1; }
		 */

		System.out.println("===============likeCheckRevert result"+result);  
		
		//model.addAttribute("result",result); 
		
		return result;
	}
	
	@SuppressWarnings("null")
	@RequestMapping("likeCheckInsert")
	@ResponseBody
	public int memberLikeInsert(Model model,String user_id, Integer product_idx) {
		
		
		//user_id null값인 경우 처리. 
		if(user_id==null && user_id.isEmpty()) {
			user_id = "";
		}
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id); 
		paramMap.put("product_idx", product_idx); 
		
		int result = likeDAO.memberLikeInsert(paramMap);
		//if(result==null) { result=1; }
		System.out.println("===============likeCheckInsert result"+result); //1이면 삭제 성공 0이면 삭제 실패 
		
		model.addAttribute("result",result); //성공시 1 실패시 0 
		
		return result;
	}

	
	
	@RequestMapping("createMemberLike")
	public int memberLike(Model model, LikeVO vo) {
		
		int result = likeDAO.createMemberLike(vo);
		
		return 0;
	}
	

	
	@RequestMapping("deleteMemberLike")
	public int memberLikeCancel(Model model,LikeVO vo) {
		
		
		
		return 0; 
	}
	
	
	
}
