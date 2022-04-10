package com.hi.clothingStore.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.clothingStore.vo.ReviewVO;

// 인터페이스 구현
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
	public List<ReviewVO> reviewList(int product_idx) throws Exception {
		return sql.selectList(namespace + ".reviewList", product_idx);
	}
}
