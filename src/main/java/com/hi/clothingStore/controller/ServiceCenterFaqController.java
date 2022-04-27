package com.hi.clothingStore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.clothingStore.dao.ServiceCenterFaqDAO;
import com.hi.clothingStore.vo.ServiceCenterFaqVO;
import com.hi.clothingStore.vo.ServiceCenterVO;

@Controller
public class ServiceCenterFaqController {

	@Autowired
	ServiceCenterFaqDAO dao; 
	
	@RequestMapping("faqList")
	public void list(Model model) {
		List<ServiceCenterFaqVO> list=dao.all();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("faqListView")
	public void list_cate(ServiceCenterFaqVO vo, Model model, HttpServletRequest request) {
		String msg =request.getParameter("service_faq_category");
		List<ServiceCenterFaqVO>list=dao.cateList(vo, msg);
		model.addAttribute("list", list);

	}
	
	@RequestMapping("serviceNoticeList")
	public void list1(Model model) {
		List<ServiceCenterFaqVO> list=dao.all_notice();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("serviceNoticeOne")
	public void readone(ServiceCenterFaqVO vo, Model model) {
		ServiceCenterFaqVO one= dao.one(vo);
		model.addAttribute("one", one);

	}
	
	@RequestMapping("serviceFaqCreate")
	public String create(ServiceCenterFaqVO vo) {
		System.out.println("게시글등록요청");
		int result =dao.create(vo);
		if(result==1) {
			System.out.println("게시글등록");
			
			return "serviceFaqInsert";

		}else {
			System.out.println("실패");
			return "er";
		}
	}
	@RequestMapping("serviceNoticeCreate")
	public String create1(ServiceCenterFaqVO vo) {
		System.out.println("게시글등록요청");
		int result =dao.create1(vo);
		if(result==1) {
			System.out.println("게시글등록");
			
			return "serviceNoticeInsert";

		}else {
			System.out.println("실패");
			return "er";
		}
	}
	@RequestMapping("serviceNoticeDelete")
	public void delete(ServiceCenterFaqVO vo) {
		dao.delete1(vo);
	}
	
	@RequestMapping("serviceNoticeUpdate1")
	public void update(ServiceCenterFaqVO vo) {
		dao.update(vo);
	}
	
	@RequestMapping("serviceNoticeUpdate2")
	public void preupdate(ServiceCenterFaqVO vo, Model model) {
		ServiceCenterFaqVO one = dao.one(vo);
		model.addAttribute("one", one);
		System.out.println("update요청_");
	}
	
	@RequestMapping("serviceFaqDelete")
	public String deletefaq (ServiceCenterFaqVO vo, HttpServletRequest request) {
		String[] msg =request.getParameterValues("service_faq_idx");
		int size = msg.length;
		for (int i=0; i<size; i++) {
			System.out.println(msg[i]);
			int s=Integer.parseInt(msg[i]);
			dao.delete(vo, s);
		}
		return "redirect:serviceMain.jsp";
	}
	
	
	@RequestMapping("serviceFaqUpdate1")
	public void update_faq(ServiceCenterFaqVO vo) {
		dao.update2(vo);
	}
	
	@RequestMapping("serviceFaqUpdate2")
	public void preupdate_faq(ServiceCenterFaqVO vo, Model model, HttpServletRequest request) {
		String[] msg =request.getParameterValues("service_faq_idx");
		ServiceCenterFaqVO one = dao.one(vo);
		model.addAttribute("one", one);
		
		System.out.println("update요청_");
		
		
	}
}
