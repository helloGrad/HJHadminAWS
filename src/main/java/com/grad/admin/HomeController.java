package com.grad.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.grad.admin.security.Auth;
import com.grad.admin.service.MemberService;



@Controller
public class HomeController {
	
	
	@Autowired
	MemberService memberService;
	
	
	/*
	 * 허주한
	 */
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("countList", memberService.countNotiOrganz());
		model.addAttribute("notiList", memberService.getNewNoti());
		model.addAttribute("organzList", memberService.getNewOrganz());
		
		return "home";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model, @RequestParam String type) {
		
		return "testview";
	}
	
}
