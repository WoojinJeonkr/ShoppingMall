package com.hi.clothingStore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hi.clothingStore.dao.ReviewDAOImpl;
import com.hi.clothingStore.service.ReviewServiceImpl;
import com.hi.clothingStore.vo.MemberVO;
import com.hi.clothingStore.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewServiceImpl service;
	
	@Autowired
	ReviewDAOImpl dao;
	
	// 상품 조회 - 후기 작성
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String reviewCreate(ReviewVO review, HttpSession session) throws Exception {
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 review.setUser_id(member.getUser_id());
		 
		 service.reviewCreate(review);
		 
		 return "redirect:/shop/view?n=" + review.getProduct_idx();
	}
}
