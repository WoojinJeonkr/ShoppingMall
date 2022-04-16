package com.hi.clothingStore.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hi.clothingStore.vo.LikeVO;
import com.hi.clothingStore.vo.ProductPageVO;

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
	public List<Map<String, Object>> SumProductLike(ProductPageVO vo) {
		return my.selectList("productlike.SumProductLike", vo);
	}
	
	//회원이 하트 버튼 클릭했을 때 메서드 
	public int createMemberLike(LikeVO vo) {
		System.out.println("createMemberLike의 vo:"+vo);
		return my.insert("productlike.createMemberLike", vo);
	}
	
	//회원이 이전에 하트를 눌렀는지 안 눌렀는지 알게 해주는 메서드 
	public LikeVO selectOneLike(LikeVO vo) {
		System.out.println("selectOneLike vo"+vo);
		return my.selectOne("productlike.selectOneLike", vo); 
	}
	
	
	//좋아요 누른 정보 삭제 
	public int deleteMemberLike(LikeVO vo) {
		System.out.println("deleteMemberLike vo"+vo);
		return my.delete("productlike.deleteMemberLike", vo); 
	}
	
	//상품인덱스에 따른 좋아요 
	public List<Map<String, Object>> ProductIdxByLike() {
		return my.selectList("productlike.productIdxByLike"); 
	}
	
	
	
	
	
	
	
	
	
	
	
}
