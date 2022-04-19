package com.hi.clothingStore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hi.clothingStore.vo.ServiceCenterFaqVO;
import com.hi.clothingStore.vo.ServiceCenterVO;


@Component
public class ServiceCenterFaqDAO {

	@Autowired
	SqlSessionTemplate my; 
	
	public List<ServiceCenterFaqVO> all() {
		return my.selectList("servicecenterfaq.list");
	}
	public int create (ServiceCenterFaqVO vo) {
		return my.insert("servicecenterfaq.create",vo);
	}
	
	public List<ServiceCenterFaqVO> all_notice() {
		return my.selectList("servicecenterfaq.list_notice");
	}
	
	public ServiceCenterFaqVO one (ServiceCenterFaqVO vo) {
		return my.selectOne("servicecenterfaq.one",vo);
	}
	public int delete1 (ServiceCenterFaqVO vo) {
		return my.insert("servicecenterfaq.del",vo);
	}
	
	public int delete (ServiceCenterFaqVO vo, int s) {
		return my.insert("servicecenterfaq.del",s);
	}
	
	public int create1 (ServiceCenterFaqVO vo) {
		return my.insert("servicecenterfaq.create1",vo);
	}
	public int update2 (ServiceCenterFaqVO vo) {
		return my.insert("servicecenterfaq.up",vo);
	}
	public int update (ServiceCenterFaqVO vo) {
		return my.insert("servicecenterfaq.up2",vo);
	}
	
	public List<ServiceCenterFaqVO> cateList(ServiceCenterFaqVO vo, String msg) {
		return my.selectList("servicecenterfaq.list_cate",msg);
	}
}
