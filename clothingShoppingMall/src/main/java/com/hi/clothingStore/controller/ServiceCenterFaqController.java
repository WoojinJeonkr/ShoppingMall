package com.hi.clothingStore.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.clothingStore.dao.ServiceCenterFaqDAO;
import com.hi.clothingStore.vo.ServiceCenterFaqVO;

@Controller
public class ServiceCenterFaqController {

	@Autowired
	ServiceCenterFaqDAO dao; 
	
	@RequestMapping("faqList")
	public void list(Model model) {
		List<ServiceCenterFaqVO> list=dao.all();
		model.addAttribute("list", list);
	}
	
}
