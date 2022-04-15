package com.hi.clothingStore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hi.clothingStore.dao.ReviewDAOImpl;
import com.hi.clothingStore.service.ReviewServiceImpl;
import com.hi.clothingStore.vo.MemberVO;
import com.hi.clothingStore.vo.ReviewListVO;
import com.hi.clothingStore.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewServiceImpl reviewServiceImpl;
	
	@Autowired
	ReviewDAOImpl dao;
	
	/*
	@RequestBody를 넣어 주는 이유
	뷰에서 컨트롤러에 전달한 데이터와, 컨트롤러가 받으려는 매개변수 데이터형이 일치하지 않는 경우
	또는 다수인 경우 @RequestBody를 넣어준다
	*/
	
	// 구매 후기 목록
	// reviewList?product_idx=${one.product_idx}
	@ResponseBody
	@RequestMapping("reviewList")
	public List<ReviewListVO> getReviewList(int product_idx) throws Exception{
		//public List<ReviewListVO> getReviewList(@RequestParam("n") int product_idx) throws Exception{
		System.out.println("후기 목록이 호출되었습니다.");
		List<ReviewListVO> review = reviewServiceImpl.reviewList(product_idx);
		return review;
	}
	
	/*
	// 상품 조회 - 후기 작성
	@RequestMapping(value = "/views/reviewCreate", method = RequestMethod.POST)
	public String reviewCreate(ReviewVO review, HttpSession session) throws Exception {
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 review.setUser_id(member.getUser_id());
		 
		 service.reviewCreate(review);
		 
		 return "redirect:/shop/view?n=" + review.getProduct_idx();
	}
	*/
	
	// 구매 후기 작성
	@ResponseBody
	@RequestMapping(value = "reviewCreate", method = RequestMethod.POST)
	public void reviewCreate(ReviewVO review, HttpSession session) throws Exception {
		System.out.println("후기 작성이 호출되었습니다.");
		String user_id = (String)session.getAttribute("user_id");
		review.setUser_id(user_id);
		
		reviewServiceImpl.reviewCreate(review);
	}
	
	// 구매 후기 삭제
	@ResponseBody
	@RequestMapping(value = "reviewDelete", method = RequestMethod.POST)
	public int getReviewList(ReviewVO review, HttpSession session) throws Exception {
		System.out.println("후기 삭제가 호출되었습니다.");
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("user_id");
		String user_id = reviewServiceImpl.idCheck(review.getReview_idx());
		
		if(member.getUser_id().contentEquals(user_id)) {
			review.setUser_id(member.getUser_id());
			reviewServiceImpl.reviewDelete(review);
			/*if 결과가 참이라면 삭제 작업을 진행한 뒤 변수 result에 1을 저장하고,
			    거짓이면 아무 작업도 하지 않고 종료함*/
			result = 1;
		}
		return result;
	}
	
	// 구매 후기 수정
	@ResponseBody
	@RequestMapping(value = "reviewUpdate", method = RequestMethod.POST)
	public int reviewUpdate(ReviewVO review, HttpSession session) throws Exception {
		System.out.println("후기 수정이 호출되었습니다.");
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("user_id");
		String user_id = reviewServiceImpl.idCheck(review.getReview_idx());
		
		if(member.getUser_id().equals(user_id)){
			review.setUser_id(member.getUser_id());
			reviewServiceImpl.reviewUpdate(review);
			result = 1;
		}
		return result;
	}
}