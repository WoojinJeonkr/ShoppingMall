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
	
	접근제한 함수에 대해
	1. public : 모든 곳에서 접근 가능
	2. private : 자기 자신 클래스에서만 접근 가능
	3. protected : 자기 자신 클래스와 상속된 클래스에서 접근 가능
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
		/*
		삭제 진행 과정
		
		1. 현재 세션에서 user_id를 가져와서 userId에 저장
		2. 아이디 체크용 쿼리의 결과를 가져와서 변수 user_id에 저장
		3. 두 아이디를 비교했을 때 결과가 
		      참이라면 변수 result에 1을 저장 --> 아이디가 같아서  삭제 작업 진행 o
		      거짓이라면 변수 result에 0을 저장 --> 아이다가 달라서 삭제 작업 진행 x
		*/
		String userId = (String)session.getAttribute("user_id");
		String user_id = reviewServiceImpl.idCheck(review.getReview_idx());
		
		if(userId.contentEquals(user_id)) {
			review.setUser_id(userId);
			reviewServiceImpl.reviewDelete(review);
			result = 1;
		}
		return result;
	}
	
	// 구매 후기 수정
	@ResponseBody
	@RequestMapping(value = "reviewUpdate", method = RequestMethod.POST)
	public int getReviewList1(ReviewVO review, HttpSession session) throws Exception {
		System.out.println("후기 수정이 호출되었습니다.");
		int result = 0;
		
		String userId = (String)session.getAttribute("user_id");
		String user_id = reviewServiceImpl.idCheck(review.getReview_idx());
		/*
		 System.out.println("----" + review.getReview_content());
		 System.out.println(review.getReview_idx()); System.out.println(userId);
		 System.out.println(user_id);
		 */
		
		if(userId.equals(user_id)){
			review.setUser_id(userId);
			reviewServiceImpl.reviewUpdate(review);
			result = 1;
		}
		return result;
	}
	
	// 평균 평점 출력
	@ResponseBody
	@RequestMapping(value = "scoreAvg")
	public double scoreAvg(int product_idx) throws Exception {
		System.out.println("평균 평점이 출력되었습니다 ");
		System.out.println(product_idx);
		double scoreTotal = reviewServiceImpl.scoreAvg(product_idx);
		System.out.println(scoreTotal);
		return scoreTotal;
		
	}
}