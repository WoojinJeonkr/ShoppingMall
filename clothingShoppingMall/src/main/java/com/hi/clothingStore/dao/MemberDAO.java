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
	public MemberVO  idCheck(MemberVO vo) {
		MemberVO  vo2  = my.selectOne("member.idCheck", vo);
		return vo2;
	}
	//비밀번호 수정시 기존 비밀번호와 다른지 체크
	public MemberVO  modyPw(MemberVO vo) {
		MemberVO  vo2  = my.selectOne("member.modyPw", vo);
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
	
}
