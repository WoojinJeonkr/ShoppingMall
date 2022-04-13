package com.hi.clothingStore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.clothingStore.dao.LikeDAO;
import com.hi.clothingStore.vo.LikeVO;

@Service
public class LikeListService {

	@Autowired
	LikeDAO likeDAO;
	
	public List<Integer> getProductLikeList(LikeVO vo) {
		
			 
		List<Integer> totalLike= likeDAO.MainLikeCount(vo);
		System.out.println("LikeListService의 totallike"+totalLike);
		System.out.println("LikeListService의 totallike size"+totalLike.size());
		
		
		
		return totalLike;
		
		
	}
	
	
	
	
	
	
	
	
	
	
}
