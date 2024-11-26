package com.myaws.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myaws.myapp.service.UserService;

@Controller
@RequestMapping(value="/user/")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired(required=false)
	private UserService userService;
	
	@RequestMapping(value="userLogin.aws", method=RequestMethod.GET)
	public String userLogin() {
		
		return "WEB-INF/user/userLogin"; 
	}
	
	@RequestMapping(value="userJoin.aws", method=RequestMethod.GET)
	public String userJoin() {
		
		return "WEB-INF/user/userJoin"; 
	}
	
}
