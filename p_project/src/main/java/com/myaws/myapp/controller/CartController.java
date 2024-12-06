package com.myaws.myapp.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myaws.myapp.domain.CartVo;
import com.myaws.myapp.domain.PageMaker;
import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.service.CartService;
import com.myaws.myapp.service.QnrBoardService;
import com.myaws.myapp.util.MediaUtils;
import com.myaws.myapp.util.UploadFileUtiles;

@Controller
@RequestMapping(value="/cart/")
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired(required=false)
	private CartService cartService;
	
	@Autowired(required=false)
	private PageMaker pm;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="cartInsert.aws", method=RequestMethod.POST)
	public String cartInsert(
			CartVo cv,
			@RequestParam("product_key") int product_key, 
			HttpServletRequest request,
			RedirectAttributes rttr) {
		
		String user_key = request.getSession().getAttribute("user_key").toString();
		int user_key_int = Integer.parseInt(user_key); // 회원번호를 숫자형으로 추출
			
		cv.setProduct_key(product_key);
		cv.setUser_key(user_key_int);
		
		int value = cartService.cartInsert(cv);
		
		String path = "";
		
		if (value == 1) { 
			rttr.addFlashAttribute("msg", "상품이 장바구니에 담겼습니다.");
			path = "redirect:/product/productContent.aws?product_key="+product_key; 
		}
		
		return path;  
	}
	
	@RequestMapping(value="cartList.aws", method=RequestMethod.GET)
	public String cartList(
			SearchCriteria scri, 
			Model model,
			HttpServletRequest request) {
		
		String user_key = request.getSession().getAttribute("user_key").toString();
		int user_key_int = Integer.parseInt(user_key); // 회원번호를 숫자형으로 추출
		
		System.out.println("user_key_int ======================> " + user_key_int);
		
		int cnt = cartService.productTotalCount(scri, user_key_int);
		
		scri.setPerPageNum(5); 
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		ArrayList<CartVo> clist = cartService.productSelectAll(scri, user_key_int);
			
		model.addAttribute("clist", clist);
		model.addAttribute("pm", pm);
		
		return "WEB-INF/cart/cartList";  
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
