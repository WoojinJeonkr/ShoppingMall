package com.hi.clothingStore.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.clothingStore.dao.MemberDAO;
import com.hi.clothingStore.vo.MemberVO;
import com.hi.clothingStore.vo.ProductListVO;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao; //주소주입!!
	//회원과 관련된 여러가지 제어를 담당하는 클래스 
	//회원가입,검색,수정,탈퇴,로그인 기능을 제어함.
	
	//로그인
	@RequestMapping("memberCheck1")
	public String login(MemberVO vo, HttpSession session) throws Exception {
		System.out.println(vo);
		MemberVO vo2 = dao.login(vo);
		System.out.println(vo2);
		//vo2가 로그인에 실패한 경우 null
		//vo2가 로그인에 성공한 경우 주소가 들어있음.
		if(vo2 != null) { //로그인에 성공했을 때
			//세션을 잡자!//세션을 너무 많이 잡으면 용량 차지를 많이해서 안좋다.
			session.setAttribute("userId", vo2.getUser_id());
			session.setAttribute("userName", vo2.getUser_name());
			
			return "redirect:member.jsp";
		} else { //로그인에 실패했을 때 
			return "memberCheck";
		}
	}

	//회원가입
	@RequestMapping("memberCreate1")
	public String create(MemberVO vo) throws Exception {
		System.out.println(vo);
		int result = dao.create(vo);
		if(result == 1) {
			return "memberOk";//회원가입성공
		}else {                     // int result = dao.idCheck(vo);가 1이면 아이디 중복이고 0이면 중복아님으로 하고싶음. 
			return "memberCreate";//회원가입 실패
		}
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:member.jsp";
	}
	//아이디중복체크
	@RequestMapping("memberIdCheck")//memberCre.jsp에 ajax의 url의 주소로 들어가 있다.
	public void idCheck(MemberVO vo, Model model) {
		System.out.println(vo);
		MemberVO  vo2 = dao.idCheck(vo);
		System.out.println("결과>> " + vo2);
		int result = 1; //기존에 있는 id로 쓸 수 없는 id.
		if (vo2 == null ) {
			result = 0; //쓸 수 있는 id임.
		}
		model.addAttribute("result", result);
	}
	//비밀번호 변경, 이전과 같은 비밀번호일 경우 쓸 수 없는 비밀번호로 구현
	@RequestMapping("memberModyPw")
	public void modyPw(MemberVO vo, Model model) {
		System.out.println(vo);
		MemberVO  vo2 = dao.modyPw(vo);//vo1:내가 입력한 값들 담김.,vo2:db에서 가져온 id,pw,tel,..의 값들.
		System.out.println("결과>> " + vo2);
		int result = 0; //쓸 수 없는 pw
		if (vo.getUser_pw().equals(vo2.getUser_pw()) ) {
			//vo에 들어있는 내가 입력한 pw인 getUser_pw()와 vo2(db에 있는)에 들어있는 pw인 getUser_pw가 같은지(equals)확인.
			result = 1; //쓸 수 있는 pw
		}
		model.addAttribute("result", result);
	}
	//회원 수정 컨트롤러
	@RequestMapping("memberUp")
	public void up(MemberVO vo, Model model) {
		//수정하기버튼을 누르면, 기존의 db에 저장된 데이터를
		//가지고 와서, 수정할 수 있는 화면에 넣어주어야 한다.
		//그러기 위해서는 로그인 부분을 만들 때 사용한 member를 가져오면 된다.
		MemberVO vo2 = dao.one(vo);
		model.addAttribute("one", vo2);
	}
	//회원 수정 컨트롤러
	@RequestMapping("memberUpdate")
	public String update(MemberVO vo, Model model) {
		System.out.println("회원수정vo를 찍어보자: "+vo);
		//수정하고 싶은 것이 있으면 수정처리 요청
		int result = dao.update(vo); 
		if(result == 1) {
			return "memberUpdate";
		}else {
			return "memberNo"; 
		}
	}
	//회원탈퇴 컨트롤러
	@RequestMapping("memberDelete")
	public String delete1(MemberVO vo, Model model, HttpSession session) {
		int result = dao.delete(vo);
		model.addAttribute("result", result);
		session.invalidate();
		return "redirect:member.jsp";
	}
}

