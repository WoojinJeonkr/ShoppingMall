package com.hi.clothingStore.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.clothingStore.vo.ReviewListVO;
import com.hi.clothingStore.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "review";
	
	// 후기 작성
	@Override
	public void reviewCreate(ReviewVO review) throws Exception{
		sql.insert(namespace + ".reviewCreate", review);
	}
	
	// 후기 리스트
	@Override
	public List<ReviewListVO> reviewList(int product_idx) throws Exception {
		return sql.selectList(namespace + ".reviewList", product_idx);
	}
	
	// 후기 삭제
	@Override
	public void reviewDelete(ReviewVO review) throws Exception {
		sql.delete(namespace + ".reviewDelete", review);
	}
	
	// 아이디 체크
	@Override
	public String idCheck(int review_idx) throws Exception {
		return sql.selectOne(namespace + ".reviewUserIdCheck", review_idx);
	}
	
	// 후기 수정
	@Override
	public void reviewUpdate(ReviewVO review) throws Exception {
		sql.update(namespace + ".reviewUpdate", review);
	}
	
	// 평균 평점
	@Override
	public Double scoreAvg(int product_idx) throws Exception {
		return sql.selectOne(namespace + ".scoreAvg", product_idx);
	}
	
	// 후기 존재 여부 체크
	public int product_idxCheck(int product_idx) throws Exception {
		return sql.selectOne(namespace + ".reviewPrductIdxCheck", product_idx);
	}
}