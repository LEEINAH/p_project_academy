package com.myaws.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myaws.myapp.service.UserService;

@Controller
@RequestMapping(value="/qnrBoard/")
public class QnrBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnrBoardController.class);
	
	@RequestMapping(value="reviewWrite.aws", method=RequestMethod.GET)
	public String reviewWrite() {
		
		return "WEB-INF/qnrBoard/reviewWrite"; 
	}
	
	@RequestMapping(value="qnaList.aws", method=RequestMethod.GET)
	public String qnaList() {
		
		return "WEB-INF/qnrBoard/qnaList"; 
	}
	
	@RequestMapping(value="qnaWrite.aws", method=RequestMethod.GET)
	public String qnaWrite() {
		
		return "WEB-INF/qnrBoard/qnaWrite"; 
	}
	
}
