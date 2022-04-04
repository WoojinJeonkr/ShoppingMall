package com.hi.clothingStore.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hi.clothingStore.vo.MemberVO;

@Component
public class MemberDAO {

	@Autowired
	SqlSessionTemplate my;

	//회원가입
	public int create(MemberVO vo) {
		int result = 0;
		try {
			result = my.insert("member.create", vo);
		}catch(Exception e) {
			System.out.println("에러발생.");
		}
		return result;
	}
	//로그인
	public MemberVO login(MemberVO vo) {
		return my.selectOne("member.login", vo);
	}
	
	public MemberVO  idCheck(MemberVO vo) {
		MemberVO  vo2  = my.selectOne("member.idCheck", vo);
		return vo2;
	}
	
}
