package com.hi.clothingStore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println("컨트롤러 memberCheck1 로그인vo >> " + vo);
		MemberVO vo2 = dao.login(vo);
		System.out.println("컨트롤러 memberCheck1 로그인vo2 >> " + vo2);
		//vo2가 로그인에 실패한 경우 null
		//vo2가 로그인에 성공한 경우 주소가 들어있음.
		if(vo2 != null) { //로그인에 성공했을 때
			//세션을 잡자!//세션을 너무 많이 잡으면 용량 차지를 많이해서 안좋다.
			session.setAttribute("user_id", vo2.getUser_id());
			session.setAttribute("user_name", vo2.getUser_name());
			session.setAttribute("user_level", vo2.getLevel());
			return "member";
		} else { //로그인에 실패했을 때 
			return "memberCheck";
		}
	}

	//회원가입
	@RequestMapping("memberCreate1")
	public String create(MemberVO vo) throws Exception {
		System.out.println("회원가입vo >> " + vo);
		int result = dao.create(vo);
		if(result == 1) {
			return "memberOk";//회원가입성공
		}else {                 
			return "memberUnCreate";//회원가입 실패
		}
	}
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member";
	}
	//아이디중복체크
	@RequestMapping("memberIdCheck")//memberCre.jsp에 ajax의 url의 주소로 들어가 있다.
	public void idCheck(Model model, String user_id) {
		// MemberVO vo가 없는 이유는 id중복채크만 하면 되는데 vo전체 값을 받아 올 필요가 없기 때문.
		// String user_id는 memberCre.jsp의 ajax의 data가 넘어오는 값을 받기 위해 꼭 넣어주어야 한다.
		// user_id라고 지정한 이유는 값을 컨트롤러로 받고 sql문의 user_id 컬럼과 같아야함.
		//그래서 user_id로 씀
		System.out.println(user_id);
		//ajax로부터 데이터 넘어오는지 확인하기. 
		MemberVO  vo2 = dao.idCheck(user_id);//dao라는idCheck라는 곳으로 user_id를 가지고 가겠다.
		//dao의 리턴 vo2를 받은 값이dao.idCheck(user_id)인데 이 값을
		// MemberVO타입의  vo2변수 안에 넣어준다.
		//MemberVO타입은 user_id,user_pw,user_tel...등의 값을 받을 수 있는 바구니를 뜻한다.
		System.out.println("컨트롤러 결과>> " + vo2);
		int result = 1; //기존에 있는 id로 쓸 수 없는 id.
		if (vo2 == null ) {//db에 같은 아이디가 없다면,
			result = 0; //쓸 수 있는 id임.
		}
		model.addAttribute("result", result);
		//컨트롤러에서 jsp로 넘겨주는 값을 담아주기 위해 model메서드 사용.
		//result가  views아래에 있는 memberIdCheck로 간다음 result가 컨트롤러로 오고, result가 memberCre의 ajax로 감
	}
	
	//비밀번호 변경, 이전과 같은 비밀번호일 경우 쓸 수 없는 비밀번호로 구현
	@RequestMapping("memberModyPw")
	public void modyPw(Model model, String user_id, String user_pw) {
		//memberUpdate.jsp에 있는 ajax의 data값 user_id와 user_pw를 받아오기 위해 객체를 써준다.
		//그리고 받아온 객체를 dao에 넘겨주고 user_id에 해당하는 db의 행 한 줄을 xml에서 받아온다.
		// xml에서 받아온  리턴값을 dao에서  vo2로 준다.
		MemberVO  vo2 = dao.modyPw(user_id, user_pw);
		//dao에서 받아온 리턴vo2가 dao.modyPw(user_id, user_pw)가 되고 다시 MemberVO vo2객체에 넣어준다.
		//ajax에서 값이 잘 넘어왔는지 찍어보자.
		System.out.println("memberModyPw컨트롤러결과user_id >> " + user_id);
		System.out.println("memberModyPw컨트롤러결과user_pw(변경된 비번) >> " + user_pw);
		System.out.println("memberModyPw컨트롤러결과vo2 >> " + vo2);
		System.out.println("memberModyPw컨트롤러결과vo2.getUser_pw()(기존비번) >> " + vo2.getUser_pw());
		int result = 0; //사용가능한 pw
		//user_id에 해당하는 vo2한 줄을 가져와서 vo2안에 있는 user_pw의 값을 내가 입력한 값vo.getUser_pw()이랑 비교!
		if (user_pw.equals(vo2.getUser_pw())) {
			//vo에 들어있는 내가 입력한 pw인 getUser_pw()와 vo2(db에 있는)에 들어있는 pw인 getUser_pw가 같은지(equals)확인.
			result = 1; //비밀번호가 같으면 result=1을 주어 사용 할 수 없는 pw로 지정.
		}
		System.out.println("memberModyPw컨트롤러결과result는 >> " + result);
		model.addAttribute("result", result);
		//컨트롤러에서 jsp로 넘겨주는 값을 담아주기 위해 model메서드 사용.
		///////////////////////////////그림그린거맞는지확인.
	}
	//회원 수정 컨트롤러
	@RequestMapping("memberUpdate")
	public String update(MemberVO vo, Model model) {
		System.out.println("회원수정vo를 찍어보자: "+vo);
		//수정하고 싶은 것이 있으면 수정처리 요청
		int result = dao.update(vo); 
		if(result == 0) {//리턴값 result가 0이면 update가 안되었다는 의미로  view의 memberNo.jsp를 호출
			return "memberNo";
		}else {//0이 아니면 업데이트가 되었다는 의미(1이므로)로  view의 memberUpdate.jsp를 호출
			return "memberUpdate";
		}
	}
	
	//회원탈퇴 컨트롤러
	@RequestMapping("memberDelete")
	public String delete(MemberVO vo, Model model, HttpSession session) {
		int result = dao.delete(vo);
		model.addAttribute("result", result);
		System.out.println("memberDelete컨트롤러결과vo >> " + vo);
		System.out.println("memberDelete컨트롤러결과result는 >> " + result);
		session.invalidate();//세션끊어주기.
		return "memberDelete";//views아래의 memberDelete를 호출하여 alert("회원수정되었습니다.")띄우고 바로 productList.jsp로 이동하도록 구현
	}
	//관리자아이디로 회원탈퇴 하기
	@RequestMapping("memberAdDelete")
	public void delete(MemberVO vo) {
		dao.delete(vo);
		System.out.println("memberAdDelete컨트롤러결과vo >> " + vo);
	}
	
	@RequestMapping("member")
	//member와 같은 이름이 views아래에 있어야 한다. 
	//views아래에 있는 회원가입페이지(member.jsp)를 호출하려면 컨트롤러 꼭 거쳐가기때문에 컨트롤러에 해당 코드가 있어야함
	public void member() {	
	}
	
	//마이페이지(views 아래에 myPage.jsp 호출)/관리자페이지
	@RequestMapping("myPage")//myPage와 같은 이름이 views아래에 있어야 한다. views호출하려면 컨트롤러 꼭 거쳐가기때문에 컨트롤러에 해당 코드가 있어야함
	public String myPage(MemberVO vo, HttpSession session) throws Exception {
			//세션잡은 user_level이 null이면 비회원이므로 로그인하도록 views 아래에 memberUnlogin 호출
			if((session.getAttribute("user_level")) == null) { 
				return "memberUnlogin";
			//세션 user_level이 2이면 관리자계정이므로 views아래에 관리자회원관리 페이지로 이동	
			} else if((int)(session.getAttribute("user_level")) == 2) { 
				return "memberAdmin";
			//그 외는 회원이므로 views아래에 마이페이지 호출	
			} else {
				return "myPage";
			} 
		}
	//관리자일시->회원전체검색
	@RequestMapping("memberAdmin")
	public void readAll(MemberVO vo, Model model) {
		List<MemberVO> list = dao.readAll(vo);
		//System.out.println("memberAdmin의 vo >> " + vo);vo는 //넣은값이 없어서 null이 나온다.
		System.out.println("memberAdmin의 list >> " + list);
		//model.addAttribute("readAll");
		model.addAttribute("list", list);
	}
	@RequestMapping("one")
	public void one(MemberVO vo, Model model) {
		MemberVO one = dao.readOne(vo);
		model.addAttribute("one", one);
	}

	@RequestMapping("memberOne")
	public void one1(MemberVO vo, Model model) {
		MemberVO one = dao.readOne(vo);
		model.addAttribute("one", one);
	}

}

