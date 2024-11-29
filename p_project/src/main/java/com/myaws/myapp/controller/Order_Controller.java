package com.myaws.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/order_/")
public class Order_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Order_Controller.class);
	
	@RequestMapping(value="order_.aws", method=RequestMethod.GET)
	public String order_() {
		
		return "WEB-INF/order_/order_"; 
	}
	
}
