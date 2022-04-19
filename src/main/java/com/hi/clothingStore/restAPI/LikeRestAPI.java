package com.hi.clothingStore.restAPI;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hi.clothingStore.dao.LikeDAO;
import com.hi.clothingStore.dao.ProductListDAO;
import com.hi.clothingStore.vo.LikeVO;
import com.hi.clothingStore.vo.ProductListVO4;

@RestController
public class LikeRestAPI {

	@Autowired
	LikeDAO likeDAO; 
	
	@GetMapping("getProductIdxByLike")
	@ResponseBody
	public List<Map<String, Object>> getProductIdxByLike(){
		return likeDAO.ProductIdxByLike();
	}
	
	@SuppressWarnings("null")
	@GetMapping("selectMemberLikeOne")
	@ResponseBody
	public LikeVO selectOneLike(Model model,String user_id, Integer product_idx) {
		
		System.out.println("selectOneLike user_id"+user_id);
		System.out.println("selectOneLike product_idx"+product_idx);
		
		
		//user_id null값인 경우 처리. 
		if(user_id==null && user_id.isEmpty()) {
			user_id = "";
		}
	
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id); 
		paramMap.put("product_idx", product_idx); 
		
		LikeVO LikeOne  = likeDAO.selectOneLike(paramMap);
		System.out.println("===============restAPI LikeOne"+LikeOne);
		
		
		return LikeOne;
		
	}
	

	@GetMapping("myProductLike")
	@ResponseBody
	public List<Map<String,Object>> selectProductMyLike(Model model,String user_id) {
		
		System.out.println("selectProductMyLike user_id"+user_id);
		
		/*
		 * //user_id null값인 경우 처리. if(user_id==null && user_id.isEmpty()) { user_id =
		 * ""; }
		 */
		List<Map<String,Object>> myLikeInfo  = likeDAO.myProductLike(user_id);
		System.out.println("===============restAPI myLikeInfo"+myLikeInfo);
		
		model.addAttribute("myLikeInfo",myLikeInfo);
		
		return myLikeInfo; //json 변수 값 리턴 
		
	}
	

}
