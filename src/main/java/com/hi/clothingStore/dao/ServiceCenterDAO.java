package com.hi.clothingStore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hi.clothingStore.vo.ServiceCenterVO;


@Component
public class ServiceCenterDAO {

	@Autowired
	SqlSessionTemplate my; 
	
	public int create (ServiceCenterVO vo) {
		return my.insert("servicecenter.create",vo);
	}
	
	public ServiceCenterVO readOne (ServiceCenterVO vo) {
		return my.selectOne("servicecenter.one",vo);
	}
	
	public List<ServiceCenterVO> all() {
		return my.selectList("servicecenter.list");
	}
	
	public int update (ServiceCenterVO vo) {
		return my.insert("servicecenter.up",vo);
	}
	
	public int delete (ServiceCenterVO vo) {
		return my.insert("servicecenter.del",vo);
	}
	public int number (ServiceCenterVO vo) {
		return my.update("servicecenter.number",vo);
	}
}
