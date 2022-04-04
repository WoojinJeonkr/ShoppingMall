package com.hi.clothingStore.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.clothingStore.dao.MemberDAO;
import com.hi.clothingStore.vo.MemberVO;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao; //주소주입!!
	//회원과 관련된 여러가지 제어를 담당하는 클래스 
	//회원가입,검색,수정,탈퇴,로그인 기능을 제어함.
	
	@RequestMapping("memberCheck")
	public String login(MemberVO vo, HttpSession session) throws Exception {
		System.out.println(vo);
		MemberVO vo2 = dao.login(vo);
		System.out.println(vo2);
		//vo2가 로그인에 실패한 경우 null
		//vo2가 로그인에 성공한 경우 주소가 들어있음.
		if(vo2 != null) { //로그인에 성공했을 때
			//세션을 잡자!
			session.setAttribute("userId", vo2.getId());
			session.setAttribute("userName", vo2.getName());
			return "redirect:member.jsp";
		}else { //로그인에 실패했을 때 
			return "memberCheck";
		}
	}

	@RequestMapping("memberCreate")
	public String create(MemberVO vo) throws Exception {
		System.out.println(vo);
		int result = dao.create(vo);
		if(result == 1) {
			return "memberOk";
		}else {                     // int result = dao.idCheck(vo);가 1이면 아이디 중복이고 0이면 중복아님으로 하고싶음. 
			return "memberCreate";
		}
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:member.jsp";
	}
	//아이디중복체크
	@RequestMapping("memberIdCheck")
	public void idCheck(MemberVO vo, Model model) {
		System.out.println(vo);
		MemberVO  vo2 = dao.idCheck(vo);
		System.out.println("결과>> " + vo2);
		int result = 1;
		if (vo2 == null ) {
			result = 0; //쓸 수 있는 id임.
		}
		model.addAttribute("result", result);
	}
	
	
}
