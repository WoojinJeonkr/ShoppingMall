package com.hi.clothingStore.dao;

import java.util.List;
import java.util.Map;

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

	public List<Map<String,Object>> all(Map<String,Object> map) {
		System.out.println("ProductLitsDAO map:"+map);
		return my.selectList("productlist.list", map);
	}
	
	public List<String> selectCategoryList(){
		return my.selectList("productlist.selectCategoryList"); 
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
