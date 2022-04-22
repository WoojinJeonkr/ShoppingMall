package com.hi.clothingStore.service;

import java.util.List;

import com.hi.clothingStore.vo.ReviewListVO;
import com.hi.clothingStore.vo.ReviewVO;

// 인터페이스 선언
public interface ReviewService {

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
	
	// 후기 존재 여부 체크 --> 후기 평균 평점의 조건문을 위해 필요한 구문입니다
	public int product_idxCheck(int product_idx) throws Exception;
}
