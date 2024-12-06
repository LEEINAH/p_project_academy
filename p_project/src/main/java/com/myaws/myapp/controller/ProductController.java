package com.myaws.myapp.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myaws.myapp.domain.PageMaker;
import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.service.ProductService;
import com.myaws.myapp.service.UserService;
import com.myaws.myapp.util.MediaUtils;

@Controller
@RequestMapping(value="/product/")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired(required=false)
	private ProductService productService;
	
	@Autowired(required=false)
	private PageMaker pm;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="productList.aws", method=RequestMethod.GET)
	public String productList(SearchCriteria scri, Model model, 
			@RequestParam("category_code") int category_code) {
		
		if (category_code == 0) {
			
			int cnt1 = productService.productTotalCount(scri, 1);
			int cnt2 = productService.productTotalCount(scri, 2);
			int cnt3 = productService.productTotalCount(scri, 3);
			
			int cnt = cnt1+cnt2+cnt3;
			
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			ArrayList<ProductVo> plist1 = productService.productSelectAll(scri, 1);
			ArrayList<ProductVo> plist2 = productService.productSelectAll(scri, 2);
			ArrayList<ProductVo> plist3 = productService.productSelectAll(scri, 3);
			
			ArrayList<ProductVo> plist = new ArrayList<>();
			
			for (ProductVo pv : plist1) {
				plist.add(pv);
			}
			
			for (ProductVo pv : plist2) {
				plist.add(pv);
			}
			
			for (ProductVo pv : plist3) {
				plist.add(pv);
			}
			
			model.addAttribute("plist", plist);
			model.addAttribute("pm", pm);
			model.addAttribute("cnt", cnt);
			model.addAttribute("category_code", category_code);
			
			return "WEB-INF/product/productList";
		} else {
		
			int cnt = productService.productTotalCount(scri, category_code);
			
			pm.setScri(scri);
			pm.setTotalCount(cnt);
				
			ArrayList<ProductVo> plist = productService.productSelectAll(scri, category_code);
				
			model.addAttribute("plist", plist);
			model.addAttribute("pm", pm);
			model.addAttribute("cnt", cnt);
			model.addAttribute("category_code", category_code);
			
			return "WEB-INF/product/productList"; 
		}
	}
	
	@RequestMapping(value="productContent.aws", method=RequestMethod.GET)
	public String productContent(@RequestParam("product_key") int product_key, Model model) {
		
		productService.productViewCntUpdate(product_key);
		
		ProductVo pv = productService.productSelectOne(product_key);
		model.addAttribute("pv", pv);
		
		return "WEB-INF/product/productContent"; 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/displayFile.aws", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(
			@RequestParam("fileName") String fileName,
			@RequestParam(value="down", defaultValue="0") int down
			) {
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		try{
			
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // 확장자를 꺼낸다
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();		
			 
			in = new FileInputStream(uploadPath+fileName);
			System.out.println("uploadPath ========> " + uploadPath);
			
			if(mType != null){
				
				if (down==1) {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");	
					
				}else {
					headers.setContentType(mType);	
				}
				
			}else{
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
