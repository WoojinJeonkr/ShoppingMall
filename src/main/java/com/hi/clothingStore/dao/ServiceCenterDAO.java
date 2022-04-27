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

	public int create(ServiceCenterVO vo) {
		return my.insert("servicecenter.create", vo);
	}

	public ServiceCenterVO readOne(ServiceCenterVO vo) {
		return my.selectOne("servicecenter.one", vo);
	}

	public List<ServiceCenterVO> all() {
		return my.selectList("servicecenter.list");
	}

	public int update(ServiceCenterVO vo) {
		return my.insert("servicecenter.up", vo);
	}

	public int delete(ServiceCenterVO vo) {
		if (vo.getService_id_origin() == vo.getService_idx()) {
			System.out.println("f");
			return my.delete("servicecenter.del2", vo);
		} else {
			return my.delete("servicecenter.del", vo);
		}
	}

	public int number(ServiceCenterVO vo) {
		return my.update("servicecenter.number", vo);
	}

	public int create2(ServiceCenterVO vo) {
		return my.insert("servicecenter.create2", vo);
	}

	public List<ServiceCenterVO> all2(ServiceCenterVO vo) {
		if (vo.getSearchType().equals("service_title")) {
			return my.selectList("servicecenter.list1", vo);
		} else {
			return my.selectList("servicecenter.list2", vo);
		}
	}

	public int update2(ServiceCenterVO vo) {
		return my.update("servicecenter.upseq", vo);
	}

}
