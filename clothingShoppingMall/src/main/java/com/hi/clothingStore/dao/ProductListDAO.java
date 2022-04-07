package com.hi.clothingStore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hi.clothingStore.vo.ProductListVO;
import com.hi.clothingStore.vo.ProductPageVO;



@Component
public class ProductListDAO {

	@Autowired
	SqlSessionTemplate my;

	public ProductListVO one(ProductListVO vo) {
		System.out.println("ProductlistVO vo:"+vo);
		return my.selectOne("productlist.one", vo);
	}
	
	
	//전체 리스트 가져오기 
	public List<ProductListVO> all(ProductPageVO page) {
		return my.selectList("productlist.list", page);
	}
	
	public int count() {
		return my.selectOne("productlist.count");
	}
	
	public int insert(ProductListVO vo) {
		return my.insert("productlist.in", vo);
	}
	public int up(ProductListVO vo) {
		System.out.println("DAO vo"+vo);
		return my.update("productlist.up", vo);
	}
	public int del(ProductListVO vo) {
		System.out.println("DAO del vo"+vo);
		return my.delete("productlist.del", vo);
	}
	
	
}
