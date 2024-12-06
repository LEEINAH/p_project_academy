package com.myaws.myapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myaws.myapp.domain.UserVo;
import com.myaws.myapp.service.UserService;

@Controller
@RequestMapping(value="/user/")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired(required=false)
	private UserService userService;
	
	@Autowired(required=false)
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="userLogin.aws", method=RequestMethod.GET)
	public String userLogin() {
		
		System.out.println("�α��� ������ ���Գ�?");
		
		return "WEB-INF/user/userLogin"; 
	}
	
	@RequestMapping(value="userLoginAction.aws", method=RequestMethod.POST)
	public String userLoginAction(
			@RequestParam("userid") String userid, 
			@RequestParam("userpwd") String userpwd,
			RedirectAttributes rttr, HttpSession session) {

		UserVo uv = userService.userLoginCheck(userid);
		// ����� ��й�ȣ�� �����´�
		
		String path ="";
		if (uv != null) { // ��ü ���� ������
			String reservedPwd = uv.getUserpwd();
			
			if (bCryptPasswordEncoder.matches(userpwd, reservedPwd)) { // ��й�ȣ�� ��ġ�ϸ� ���� ��������
				// System.out.println("��й�ȣ ��ġ");
				rttr.addAttribute("user_key", uv.getUser_key());
				rttr.addAttribute("userId", uv.getUserid());
				rttr.addAttribute("userName", uv.getUsername());
				
				session.setAttribute("grade", uv.getGrade());
				
				logger.info("saveUrl : " + session.getAttribute("saveUrl"));
				
				if (session.getAttribute("saveUrl") != null) {
					path = "redirect:" + session.getAttribute("saveUrl").toString();
				} else {
					path = "redirect:/";
				}
				
			} else { // ��ġ���� ������ �α��� ��������
				rttr.addAttribute("user_key", "");
				rttr.addAttribute("userId", "");
				rttr.addAttribute("userName", "");
				rttr.addFlashAttribute("msg", "���̵�/��й�ȣ�� Ȯ���� �ּ���.");
				path = "redirect:/user/userLogin.aws";
			}
		} else {
			rttr.addAttribute("user_key", "");
			rttr.addAttribute("userId", "");
			rttr.addAttribute("userName", "");
			rttr.addFlashAttribute("msg", "�ش��ϴ� ���̵� �����ϴ�.");
			path = "redirect:/user/userLogin.aws";
		}
		return path; 
	}
	
	@RequestMapping(value="userJoin.aws", method=RequestMethod.GET)
	public String userJoin() {
		
		return "WEB-INF/user/userJoin"; 
	}
	
	@RequestMapping(value="userJoinAction.aws", method=RequestMethod.POST)
	public String uJoinAction(UserVo uv) {
		
		logger.info("userJoinAction ����");
		logger.info("bCryptPasswordEncoder : " + bCryptPasswordEncoder);
		
		String userpwd_enc = bCryptPasswordEncoder.encode(uv.getUserpwd()); // �Է� ���� �н����带 ��ȣȭ ���Ѽ�
		uv.setUserpwd(userpwd_enc); // uv�� �ٽ� ��´�
		
		int value = userService.userInsert(uv);
		logger.info("value : " + value);
		
		String path = "";
		if (value == 1) {
			path = "redirect:/";
		} else if (value == 0) {
			path = "redirect:/user/userJoin.aws";
		}
		
		return path; 
	}
	
	@RequestMapping(value="userLogout.aws", method=RequestMethod.GET)
	public String userLogout(HttpSession session) {
		
		session.removeAttribute("user_key");
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.invalidate();
		
		return "redirect:/"; 
	}
	
}
