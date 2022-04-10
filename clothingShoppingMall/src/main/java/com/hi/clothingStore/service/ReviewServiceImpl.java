package com.hi.clothingStore.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hi.clothingStore.dao.ReviewDAO;
import com.hi.clothingStore.vo.ReviewVO;

// 인터페이스 구현
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
	public List<ReviewVO> reviewList(int product_idx) throws Exception {
		return dao.reviewList(product_idx);
	}

}
