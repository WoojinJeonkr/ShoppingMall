package com.hi.clothingStore.dao;

import java.util.ArrayList;
import java.util.List;

import java.util.Map;
import com.hi.clothingStore.vo.LikeVO;
import com.hi.clothingStore.vo.ProductListVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LikeDAO {

	@Autowired
	SqlSessionTemplate my;
	
	//List 내부에는 int가 아니라 Integer 객체로 들어가야 함. 
	
	public List<Integer> MainLikeCount(LikeVO vo) {
		System.out.println("MainLikeCount vo:"+vo);
		return my.selectList("productlike.MainLikeCountList", vo);
	}
	
	//상품별 좋아요 수 갱신 메서드. 
	public List<Map<String, Object>> SumProductLike() {
		return my.selectList("productlike.SumProductLike");
	}
	
	
	
	
	
	
	
	
	
}
