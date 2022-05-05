package com.hi.clothingStore.dao;

import java.util.List;

import com.hi.clothingStore.vo.ReviewListVO;
import com.hi.clothingStore.vo.ReviewVO;

public interface ReviewDAO {

	// 후기 작성
	public void reviewCreate(ReviewVO review) throws Exception;
	
	// 후기 리스트
	public List<ReviewListVO> reviewList(int product_idx) throws Exception;
	
	// 후기 삭제
	public void reviewDelete(ReviewVO review) throws Exception;
	
	// 아이디 체크
	public String idCheck(int review_idx) throws Exception;

	// 후기 수정
	public void reviewUpdate(ReviewVO review) throws Exception;
	
	// 평균 평점
	public Double scoreAvg(int product_idx) throws Exception;
	
	// 후기 존재 여부 체크
	public int product_idxCheck(int product_idx) throws Exception;
}