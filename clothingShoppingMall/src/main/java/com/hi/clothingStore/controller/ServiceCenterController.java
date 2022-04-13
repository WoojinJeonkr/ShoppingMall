package com.hi.clothingStore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.clothingStore.dao.ServiceCenterDAO;
import com.hi.clothingStore.vo.ServiceCenterVO;


@Controller
public class ServiceCenterController {

	@Autowired
	ServiceCenterDAO dao;
	
	@RequestMapping("serviceWrite")
	public String create(ServiceCenterVO vo) {
		System.out.println("게시글등록요청");
		int result =dao.create(vo);
		dao.number(vo);
		if(result==1) {
			System.out.println("게시글등록");
			
			return "serviceInsert";

		}else {
			System.out.println("실패");
			return "er";
		}
	}
	
	@RequestMapping("serviceUpdate1")
	public void update(ServiceCenterVO vo) {
		dao.update(vo);
	}
	
	@RequestMapping("serviceUpdate2")
	public void preupdate(ServiceCenterVO vo, Model model) {
		ServiceCenterVO one = dao.readOne(vo);
		model.addAttribute("one",one);
		System.out.println("update요청_");
	}
	
	
	@RequestMapping("serviceDelete")
	public void delete(ServiceCenterVO vo) {
		dao.delete(vo);
	}
	@RequestMapping("serviceOne")
	public void readone(ServiceCenterVO vo, Model model) {
		ServiceCenterVO one= dao.readOne(vo);
		model.addAttribute("one", one);
	}
	
	@RequestMapping("serviceList")
	public void readlist(Model model) {
		List<ServiceCenterVO> list=dao.all();
		model.addAttribute("list", list);
	}
	
}
