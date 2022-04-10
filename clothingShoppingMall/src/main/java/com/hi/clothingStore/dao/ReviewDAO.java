package com.hi.clothingStore.dao;

import java.util.List;

import com.hi.clothingStore.vo.ReviewVO;

// 인터페이스 선언
public interface ReviewDAO {

	// 후기 작성
	public void reviewCreate(ReviewVO review) throws Exception;
	
	// 후기 리스트
	public List<ReviewVO> reviewList(int product_idx) throws Exception;
}
