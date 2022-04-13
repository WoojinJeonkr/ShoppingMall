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

	public ProductListVO productOne(ProductListVO vo) {
		System.out.println("ProductlistVO vo:"+vo);
		return my.selectOne("productlist.one", vo);
	}

	public List<Map<String,Object>> productList(Map<String,Object> map) {
		System.out.println("ProductLitsDAO map:"+map);
		return my.selectList("productlist.list", map);
	}
	
	public List<String> selectCategoryList(){
		return my.selectList("productlist.selectCategoryList"); 
	}
	
	
	public int funcCount(Map<String,Object> map) {
		System.out.println("funcCount map:"+map);
		return my.selectOne("productlist.funcCount", map); 
	}
	
	
	public int productListCount() {
		return my.selectOne("productlist.count");
	}
	
	public int productInsert(ProductListVO vo) {
		return my.insert("productlist.insertProduct", vo);
	}
	public int productUpdate(ProductListVO vo) {
		System.out.println("productUpdate dao의 vo:"+ vo);
		return my.update("productlist.updateProduct", vo);
	}
	
	public int productDelete(ProductListVO vo) {
		return my.delete("productlist.deleteProduct", vo);
	}
	
	
}
