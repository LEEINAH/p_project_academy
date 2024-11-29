package com.myaws.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myaws.myapp.service.UserService;

@Controller
@RequestMapping(value="/product/")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="productList1.aws", method=RequestMethod.GET)
	public String productList1() {
		
		return "WEB-INF/product/productList1"; 
	}
	
	@RequestMapping(value="productList2.aws", method=RequestMethod.GET)
	public String productList2() {
		
		return "WEB-INF/product/productList2"; 
	}
	
	@RequestMapping(value="productList3.aws", method=RequestMethod.GET)
	public String productList3() {
		
		return "WEB-INF/product/productList3"; 
	}
	
	@RequestMapping(value="productContent.aws", method=RequestMethod.GET)
	public String productContent() {
		
		return "WEB-INF/product/productContent"; 
	}

	
}
