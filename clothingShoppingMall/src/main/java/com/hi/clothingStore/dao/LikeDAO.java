package com.hi.clothingStore.dao;

import java.util.List;

import java.util.Map;
import com.hi.clothingStore.vo.LikeVO;
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
	
	
	
	
	
	
	
	
	
	
}
