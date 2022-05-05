package com.hi.clothingStore.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hi.clothingStore.dao.ReviewDAO;
import com.hi.clothingStore.vo.ReviewListVO;
import com.hi.clothingStore.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO dao;
	
	// 후기 작성
	@Override
	public void reviewCreate(ReviewVO review) throws Exception {
		dao.reviewCreate(review);
	}
	
	// 후기 목록 보기
	@Override
	public List<ReviewListVO> reviewList(int product_idx) throws Exception {
		return dao.reviewList(product_idx);
	}
	
	// 후기 삭제
	@Override
	public void reviewDelete(ReviewVO review) throws Exception {
		dao.reviewDelete(review);
	}
	
	// 아이디 체크
	@Override
	public String idCheck(int review_idx) throws Exception {
		return dao.idCheck(review_idx);
	}

	// 후기 수정
	@Override
	public void reviewUpdate(ReviewVO review) throws Exception {
		dao.reviewUpdate(review);
	}
	
	//평균 평점
	@Override
	public Double scoreAvg(int product_idx) throws Exception {
		return dao.scoreAvg(product_idx);
	}
	
	// 후기 존재 여부 체크
	@Override
	public int product_idxCheck(int product_idx) throws Exception {
		return dao.product_idxCheck(product_idx);
	}
}