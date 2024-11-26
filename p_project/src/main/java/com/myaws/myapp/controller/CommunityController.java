package com.myaws.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myaws.myapp.service.UserService;

@Controller
@RequestMapping(value="/community/")
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="communitymain.aws", method=RequestMethod.GET)
	public String userLogin() {
		
		return "WEB-INF/community/communitymain"; 
	}
	
}
