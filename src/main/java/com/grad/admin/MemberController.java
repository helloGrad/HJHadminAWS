package com.grad.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.grad.admin.security.Auth;
import com.grad.admin.security.AuthUser;
import com.grad.admin.service.MemberService;
import com.grad.admin.vo.MemberVo;


/*
 * 정예린,박가혜, 로그인 기능
 */	
@Controller
@RequestMapping("/user")
public class MemberController {

	@Autowired
	MemberService memberService;


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "login";
	}
 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String register(@ModelAttribute MemberVo memberVo) {

		memberService.register(memberVo);

		return "redirect:/user/login";
	}


	
}