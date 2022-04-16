package com.hi.clothingStore.restAPI;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hi.clothingStore.dao.LikeDAO;

@RestController
public class LikeRestAPI {

	@Autowired
	LikeDAO likeDAO; 
	
	@GetMapping("getProductIdxByLike")
	@ResponseBody
	public List<Map<String, Object>> getProductIdxByLike(){
		return likeDAO.ProductIdxByLike();
	}
	
	
	
	
	
	
}
