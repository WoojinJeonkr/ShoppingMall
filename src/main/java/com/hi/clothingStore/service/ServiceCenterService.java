package com.hi.clothingStore.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi.clothingStore.dao.ServiceCenterDAO;
import com.hi.clothingStore.vo.ServiceCenterVO;
@Service
public class ServiceCenterService {

	@Autowired
	ServiceCenterDAO dao;
	 public List<ServiceCenterVO> getSearchList(ServiceCenterVO vo) throws Exception{
		return dao.selectSearchList(vo);
		 
		 
	 }
	}
