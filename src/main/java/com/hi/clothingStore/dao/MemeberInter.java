package com.hi.clothingStore.dao;

import java.util.List;

import com.hi.clothingStore.vo.MemberVO;
//인터페이스구현
public interface MemeberInter {

	// 회원가입
	int create(MemberVO vo);

	// 로그인
	MemberVO login(MemberVO vo);

	// 아이디 중복확인
	MemberVO idCheck(String user_id);

	// 비밀번호 수정시 기존 비밀번호와 다른지 체크
	MemberVO modyPw(String user_id, String user_pw);

	// 회원수정 update는 리턴값이 int
	int update(MemberVO vo);

	// 회원탈퇴
	int delete(MemberVO vo);

	// mypage구현
	MemberVO myPage(MemberVO vo);

	//	관리자가 회원전체 검색
	List<MemberVO> readAll(MemberVO vo);

	//	관리자가 회원검색
	MemberVO readOne(MemberVO vo);

}