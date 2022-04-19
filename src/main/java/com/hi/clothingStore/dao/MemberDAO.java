package com.hi.clothingStore.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hi.clothingStore.vo.MemberVO;
import com.hi.clothingStore.vo.ProductListVO;

@Component
public class MemberDAO {

	@Autowired
	SqlSessionTemplate my;

	//회원가입
	public int create(MemberVO vo) {
		int result = 0;
		try {
			result = my.insert("member.create", vo);//create는 member.xml의  namespace="member"
		}catch(Exception e) {
			System.out.println("에러발생.");
			e.printStackTrace();
		}
		return result;
	}
	//로그인
	public MemberVO login(MemberVO vo) {
		return my.selectOne("member.login", vo);
	}
	//아이디 중복확인
	public MemberVO  idCheck(String user_id) {//String user_id은 컨트롤러에서 받아온 값.
		MemberVO  vo2  = my.selectOne("member.idCheck", user_id);
		//"member.idCheck"라는 메퍼에 user_id를 가지고 가겠다는 의미.
		//"member.idCheck"는 namespace="member"의 id="idCheck"로 가겠다는 의미
		//my.selectOne("member.idCheck", user_id);의 값이 xml에서 나와서 MemberVo타입의 vo2(변수)로 들어감(=)
		//MemberVO는 xml의 리턴타입 resultType="memberVO"과 동일해야함.
		return vo2;
	}
	//비밀번호 수정시 기존 비밀번호와 다른지 체크
	public MemberVO  modyPw(String user_id) {
		//컨트롤러에 user_id의 값이 들어오므로 (String user_id)가 있어야 값을 받을 수 있다.
		MemberVO  vo2 = my.selectOne("member.modyPw", user_id);
		//my.selectOne("member.modyPw", user_id);이 xml에 들어가서 
		//member.xml의 select * from member where user_id = #{user_id}가 실행되고  
		//해당 아이디 행 한 줄을 받아와 vo2에 넣어준다. 
		//그리고 다시 컨트롤러로감.
		return vo2;
	}
	
	public MemberVO one(MemberVO vo) {
		return my.selectOne("member.one", vo);
	}
	//회원수정 update는 리턴값이 int
	public int update(MemberVO vo) {
		return my.update("member.update", vo);
	}
	
	public int delete(MemberVO vo) {
		return my.delete("book.delete1", vo);
	}
	//mypage구현 
	public MemberVO myPage(MemberVO vo) {
		return my.selectOne("member.myPage", vo);
	}
	
}
