package com.hi.clothingStore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hi.clothingStore.dao.ReviewDAOImpl;
import com.hi.clothingStore.service.ReviewServiceImpl;
import com.hi.clothingStore.vo.MemberVO;
import com.hi.clothingStore.vo.ReviewListVO;
import com.hi.clothingStore.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewServiceImpl service;
	
	@Autowired
	ReviewDAOImpl dao;
	
	// 구매 후기 목록
	@ResponseBody
	@RequestMapping(value = "/views/ReviewList", method = RequestMethod.GET)
	public List<ReviewListVO> getReviewList(@RequestParam("n") int product_idx) throws Exception{
		List<ReviewListVO> review = service.reviewList(product_idx);
		return review;
	}
	
	/*
	// 상품 조회 - 후기 작성
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String reviewCreate(ReviewVO review, HttpSession session) throws Exception {
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 review.setUser_id(member.getUser_id());
		 
		 service.reviewCreate(review);
		 
		 return "redirect:/shop/view?n=" + review.getProduct_idx();
	}
	*/
	
	// 구매 후기 작성
	@ResponseBody
	@RequestMapping(value = "/views/ReviewCreate", method = RequestMethod.POST)
	public void reviewCreate(ReviewVO review, HttpSession session) throws Exception {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		review.setUser_id(member.getUser_id());
		
		service.reviewCreate(review);
	}
	
	// 구매 후기 삭제
	@ResponseBody
	@RequestMapping(value = "/views/ReviewDelete", method = RequestMethod.POST)
	public int getReviewList(ReviewVO review, HttpSession session) throws Exception {
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String user_id = service.idCheck(review.getReview_idx());
		
		if(member.getUser_id().contentEquals(user_id)) {
			review.setUser_id(member.getUser_id());
			service.reviewDelete(review);
			/*if 결과가 참이라면 삭제 작업을 진행한 뒤 변수 result에 1을 저장하고,
			    거짓이면 아무 작업도 하지 않고 종료함*/
			result = 1;
		}
		
		return result;
	}
}
