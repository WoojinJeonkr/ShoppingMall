package com.hi.clothingStore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hi.clothingStore.vo.ServiceCenterFaqVO;


@Component
public class ServiceCenterFaqDAO {

	@Autowired
	SqlSessionTemplate my; 
	
	public List<ServiceCenterFaqVO> all() {
		return my.selectList("servicecenterfaq.list");
	}
	
}
