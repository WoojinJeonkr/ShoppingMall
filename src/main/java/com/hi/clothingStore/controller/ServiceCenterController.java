package com.hi.clothingStore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hi.clothingStore.dao.ServiceCenterDAO;
import com.hi.clothingStore.service.ServiceCenterCriteria;
import com.hi.clothingStore.service.ServiceCenterPageMaker;
import com.hi.clothingStore.vo.ServiceCenterVO;


@Controller
public class ServiceCenterController {

	@Autowired
	ServiceCenterDAO dao;
	
	@RequestMapping("serviceWrite")
	public String create(ServiceCenterVO vo,Model model) {
		int result =dao.create(vo);
		dao.number(vo);
		if(result==1) {
			return "serviceInsert";
		}else {
			System.out.println("실패");
			return "er";
		}
	}
	
	@RequestMapping("serviceAnswer")
	public String create2(ServiceCenterVO vo,Model model) {
		dao.update2(vo);
		int result =dao.create2(vo);
		dao.number(vo);
		if(result==1) {
			return "serviceInsert";
		}else {
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
		System.out.println(vo.getService_id_origin());
		System.out.println(vo.getService_idx());
		dao.delete(vo);
	}
	@RequestMapping("serviceOne")
	public void readone(ServiceCenterVO vo, Model model) {
		ServiceCenterVO one= dao.readOne(vo);
		model.addAttribute("one", one);
	}
	
	@RequestMapping("serviceList")
	public void readlist(Model model,HttpServletRequest request,ServiceCenterCriteria cri) {
		ServiceCenterPageMaker pageMaker = new ServiceCenterPageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(dao.countBoardList());
	    
		List<ServiceCenterVO> list=dao.all(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping("serviceStatistics")
	public void readcnt(Model model,HttpServletRequest request) {
		int a = dao.count_deli();
		int b= dao.count_order();
		int c = dao.count_product();
		int d = dao.count_user();
		
		int result[]= {a,b,c,d};
		for (int i=0; i<result.length; i++) {
			System.out.println(result[i]);
		}
		
		model.addAttribute("a", a);
		model.addAttribute("b", b);
		model.addAttribute("c", c);
		model.addAttribute("d", d);
		
	}
	
	@RequestMapping("serviceSearch")
	public void readlist2(Model model,ServiceCenterVO vo,ServiceCenterCriteria cri) {
		
		System.out.println(vo.getSearchType());
		System.out.println(vo.getKeyword());
		List<ServiceCenterVO> list=dao.all2(vo);
		System.out.println(list);
		
		model.addAttribute("list", list);
		
	
	}
	
}
