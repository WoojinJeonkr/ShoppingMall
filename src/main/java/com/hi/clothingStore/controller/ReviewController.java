package com.hi.clothingStore.controller;

import java.io.File;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hi.clothingStore.dao.ReviewDAOImpl;
import com.hi.clothingStore.service.ReviewServiceImpl;
import com.hi.clothingStore.vo.ReviewListVO;
import com.hi.clothingStore.vo.ReviewVO;

/*
 전송하는 데이터가 1메가바이트가 넘어가면 메모리 대신 디스크를 사용하고
 한 파일의 최대크기 - 1키로*1키로*50 = 50메가바이트
 전체 요청에 대한 사이즈 - 250메가
 */
@MultipartConfig(
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*50,
		maxRequestSize=1024*1024*50*5
)

@Controller
public class ReviewController {

	@Autowired
	ReviewServiceImpl reviewServiceImpl;
	
	@Autowired
	ReviewDAOImpl dao;
	
	// 구매 후기 목록
	@ResponseBody
	@RequestMapping(value = "reviewList", method = RequestMethod.GET)
	public List<ReviewListVO> getReviewList(int product_idx) throws Exception{
		System.out.println("후기 목록이 호출되었습니다.");
		List<ReviewListVO> review = reviewServiceImpl.reviewList(product_idx);
		return review;
	}
	
	// 구매 후기 작성
	@ResponseBody
	@RequestMapping("reviewCreate")
	public void reviewCreate(HttpServletRequest request, ReviewVO review, MultipartFile file, HttpSession session, String url) throws Exception {
		System.out.println(file);
		System.out.println("후기 작성이 호출되었습니다.");
		
		String user_id = (String)session.getAttribute("user_id");
		review.setUser_id(user_id);
		System.out.println(review.getReview_content());
		String s1 = request.getContextPath();
		System.out.println(s1);
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		System.out.println("업로드 경로는 " + uploadPath); 
		String savedName = file.getOriginalFilename();
		System.out.println(uploadPath + "\\" + savedName);
		File target = new File(uploadPath + "\\" + savedName);
		review.setReview_img(savedName);
		
		if (!target.isDirectory()) {
			target.mkdir();
		}
		file.transferTo(target);
		
		reviewServiceImpl.reviewCreate(review);
	}
	
	// 구매 후기 삭제
	@ResponseBody
	@RequestMapping(value = "reviewDelete", method = RequestMethod.POST)
	public int getReviewList(ReviewVO review, HttpSession session) throws Exception {
		System.out.println("후기 삭제가 호출되었습니다.");
		int result = 0;
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

		if(userId.equals(user_id)){
			review.setUser_id(userId);
			reviewServiceImpl.reviewUpdate(review);
			result = 1;
		}
		return result;
	}
	
	// 평균 평점 출력
	@ResponseBody
	@RequestMapping("scoreAvg")
	public double scoreAvg(ReviewVO review, int product_idx) throws Exception {
		int reviewcount = reviewServiceImpl.product_idxCheck(review.getProduct_idx());
		if (reviewcount != 0) {
			double scoreTotal = reviewServiceImpl.scoreAvg(product_idx);
			System.out.println(scoreTotal);
			return scoreTotal;
		} else {
			return 0;
		}
	}
}