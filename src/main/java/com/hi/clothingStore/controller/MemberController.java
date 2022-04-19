package com.hi.clothingStore.controller;

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
		System.out.println(vo);
		MemberVO vo2 = dao.login(vo);
		System.out.println(vo2);
		//vo2가 로그인에 실패한 경우 null
		//vo2가 로그인에 성공한 경우 주소가 들어있음.
		if(vo2 != null) { //로그인에 성공했을 때
			//세션을 잡자!//세션을 너무 많이 잡으면 용량 차지를 많이해서 안좋다.
			session.setAttribute("user_id", vo2.getUser_id());
			session.setAttribute("user_name", vo2.getUser_name());
			
			return "member";
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
		
		//id 중복체크를 눌러보니 결과 null 이 뜸. 
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
		//컨트롤러에서 jsp로 넘겨주는 값을 담아주기 위해 model메서드 사용. result가 memberCre.jsp의 ajax로 감
	}
	
	//비밀번호 변경, 이전과 같은 비밀번호일 경우 쓸 수 없는 비밀번호로 구현
	@RequestMapping("memberModyPw")
	public void modyPw(MemberVO vo, Model model, HttpSession session) {
		System.out.println(vo.getUser_pw());
		MemberVO  vo2 = dao.modyPw((String)(session.getAttribute("user_id")));
		//(session.getAttribute("user_id"))이렇게 세션으로 넘어온값은 타입이 오브젝트 이므로 string으로 바꿔주는 작업을 해야한다.
		//vo2:user_id가 컨트롤러에서 DAO로 가서 xml로 가서 리턴 vo2를 받아온 것이 왼쪽 vo2에 담김.vo2:db에서 가져온 id,pw,tel,..의 값들.
		//user_id의 세션값을 dao.modyPw에 가져가서 return값이 db행 한 줄 이므로, vo2가방에 들어간다.
		//user_id에 해당하는 vo2한 줄을 가져와서 vo2안에 있는 user_pw의 값을 내가 입력한 값vo.getUser_pw()이랑 비교!
		System.out.println("컨트롤러결과>> " + vo2);
		int result = 0; //사용가능한 pw
		if (vo.getUser_pw().equals(vo2.getUser_pw()) ) {
			//vo에 들어있는 내가 입력한 pw인 getUser_pw()와 vo2(db에 있는)에 들어있는 pw인 getUser_pw가 같은지(equals)확인.
			result = 1; //비밀번호가 같으면 result=1을 주어 사용 할 수 없는 pw로 지정.
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
		if(result == 0) {//리턴값 result가 0이면 update가 안되었다는 의미로  view의 memberNo.jsp를 호출
			return "memberNo";
		}else {//0이 아니면 업데이트가 되었다는 의미(1이므로)로  view의 memberUpdate.jsp를 호출
			return "memberUpdate";
		}
	}
	//회원탈퇴 컨트롤러
	@RequestMapping("memberDelete")
	public String delete1(MemberVO vo, Model model, HttpSession session) {
		int result = dao.delete(vo);
		model.addAttribute("result", result);
		session.invalidate();
		return "member";
	}
	
	@RequestMapping("member")//member와 같은 이름이 views아래에 있어야 한다. views호출하려면 컨트롤러 꼭 거쳐가기때문에 컨트롤러에 해당 코드가 있어야함
	public void member() {
		
	}
	
	//마이페이지(views 아래에 myPage.jsp 호출)
	@RequestMapping("myPage")//myPage와 같은 이름이 views아래에 있어야 한다. views호출하려면 컨트롤러 꼭 거쳐가기때문에 컨트롤러에 해당 코드가 있어야함
	public String myPage(MemberVO vo, Model model, HttpSession session) throws Exception {

			//vo2가 로그인에 실패한 경우 null
			//vo2가 로그인에 성공한 경우 주소가 들어있음.
			if((String)(session.getAttribute("user_id")) != null) { //세션이 있으면 mypage호출
				//세션을 잡자!//세션을 너무 많이 잡으면 용량 차지를 많이해서 안좋다.
				return "myPage";
			} else { //로그인에 실패했을 때 
				return "memberUnlogin";
			}
		}
}

