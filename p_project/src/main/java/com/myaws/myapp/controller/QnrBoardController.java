package com.myaws.myapp.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myaws.myapp.domain.PageMaker;
import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.service.QnrBoardService;
import com.myaws.myapp.service.UserService;
import com.myaws.myapp.util.MediaUtils;
import com.myaws.myapp.util.UploadFileUtiles;
import com.myaws.myapp.util.UserIp;

@Controller
@RequestMapping(value="/qnrBoard/")
public class QnrBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnrBoardController.class);
	
	@Autowired(required=false)
	private QnrBoardService qnrBoardService;
	
	@Autowired(required=false)
	private PageMaker pm;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@ResponseBody
	@RequestMapping(value="/{product_key}/{block}/reviewList.aws", method=RequestMethod.GET)
	public JSONObject reviewList(
			@PathVariable("product_key") int product_key, 
			@PathVariable("block") int block) {
		
		String moreView = "";
		int nextBlock = 0;
		int cnt = qnrBoardService.reviewTotalCnt(product_key);
		if (cnt > block*4) {
			moreView = "Y";
			nextBlock = block+1;
		} else {
			moreView = "N";
			nextBlock = block;
		}
		
		ArrayList<QnrBoardVo> qlist = qnrBoardService.reviewSelectAll(product_key, block);
		
		JSONObject js = new JSONObject();
		js.put("qlist", qlist);
		js.put("moreView", moreView);
		js.put("nextBlock", nextBlock);
		
		return js;
	}
	
	@RequestMapping(value="reviewWrite.aws", method=RequestMethod.GET)
	public String reviewWrite(@RequestParam("product_key") int product_key, Model model) {
		
		model.addAttribute("product_key", product_key);
		
		return "WEB-INF/qnrBoard/reviewWrite"; 
	}
	
	@RequestMapping(value="reviewWriteAction.aws", method=RequestMethod.POST)
	public String reviewWriteAction(
			QnrBoardVo qv,
			@RequestParam("attachfile") MultipartFile attachfile,
			@RequestParam("product_key") int product_key,
			HttpServletRequest request,
			RedirectAttributes rttr
			) throws Exception {
		
		MultipartFile file = attachfile;
		String uploadedFileName = "";
		
		if (! file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			// ���ε� ���� �̸� ����
		}
		
		String user_key = request.getSession().getAttribute("user_key").toString();
		int user_key_int = Integer.parseInt(user_key); // ȸ����ȣ�� ���������� ����
		
		// pv�� ������ 3���� ���� ��´�
		qv.setUploadedFilename(uploadedFileName);
		qv.setUser_key(user_key_int);
		qv.setProduct_key(product_key);
		
		int value = qnrBoardService.reviewInsert(qv);

		String path = "";
		if (value == 1) { 
			path = "redirect:/product/productContent.aws?product_key="+product_key; 
		} else { 
			rttr.addFlashAttribute("msg", "�Է��� �߸� �Ǿ����ϴ�.");
			path = "redirect:/qnrBoard/reviewWrite.aws"; 
		}	
		
		return path; 
	}
		
	@RequestMapping(value="qnaList.aws", method=RequestMethod.GET)
	public String qnaList(SearchCriteria scri, Model model) {
		
		int cnt = qnrBoardService.qnaTotalCount(scri);
		
		scri.setPerPageNum(15); 
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
			
		ArrayList<QnrBoardVo> qlist = qnrBoardService.qnaSelectAll(scri);
			
		model.addAttribute("qlist", qlist);
		model.addAttribute("pm", pm);
		
		return "WEB-INF/qnrBoard/qnaList"; 
	}
	
	@RequestMapping(value="qnaWrite.aws", method=RequestMethod.GET)
	public String qnaWrite() {
		
		return "WEB-INF/qnrBoard/qnaWrite"; 
	}
	
	@RequestMapping(value="qnaWriteAction.aws", method=RequestMethod.POST)
	public String qnaWriteAction(
			QnrBoardVo qv,
			@RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request,
			RedirectAttributes rttr
			) throws Exception {
		
		MultipartFile file = attachfile;
		String uploadedFileName = "";
		
		if (! file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			// ���ε� ���� �̸� ����
		}
		
		String user_key = request.getSession().getAttribute("user_key").toString();
		int user_key_int = Integer.parseInt(user_key); // ȸ����ȣ�� ���������� ����
		
		qv.setUser_key(user_key_int);
		qv.setUploadedFilename(uploadedFileName);
		
		int value = qnrBoardService.qnaInsert(qv);

		String path = "";
		if (value == 2) { 
			path = "redirect:/qnrBoard/qnaList.aws"; 
		} else { 
			rttr.addFlashAttribute("msg", "�Է��� �߸� �Ǿ����ϴ�.");
			path = "redirect:/qnrBoard/qnaWrite.aws"; 
		}	
		
		return path;  
	}
	
	@RequestMapping(value="qnaContent.aws", method=RequestMethod.GET)
	public String qnaContent(
			@RequestParam("qnrboard_key") int qnrboard_key, 
			Model model,
			HttpServletRequest request,
			RedirectAttributes rttr) {
		
		QnrBoardVo qv = qnrBoardService.qnaSelectOne(qnrboard_key);
		model.addAttribute("qv", qv);
		
		String user_key = request.getSession().getAttribute("user_key").toString();
		int user_key_int = Integer.parseInt(user_key); // ȸ����ȣ�� ���������� ����
		
		String grade = request.getSession().getAttribute("grade").toString();
		
		String path = "";
		
	    // �����ڴ� ��� �Խñۿ� ���� ����
	    if ("A".equals(grade)) {
	        path = "WEB-INF/qnrBoard/qnaContent";
	    } 
	    // ȸ���� �ڽ��� �ۼ��� �۰� �ش� ���� origin_num�� ���� ��� �Խñ� ���� ����
	    else {
	        // ȸ���� �ۼ��� origin_num ��������
	        List<Integer> userOriginNums = qnrBoardService.getUserOriginNums(user_key_int);

	        // ���� �Խñ��� origin_num�� ȸ���� origin_num ��Ͽ� ���ԵǾ� �ִ��� Ȯ��
	        if (userOriginNums.contains(qv.getOrigin_num())) {
	            path = "WEB-INF/qnrBoard/qnaContent";
	        } else {
	            rttr.addFlashAttribute("msg", "���� ������ �����ϴ�.");
	            path = "redirect:/qnrBoard/qnaList.aws";
	        }
	    }

	    return path;
	}
	
	@RequestMapping(value="qnaModify.aws", method=RequestMethod.GET)
	public String qnaModify(@RequestParam("qnrboard_key") int qnrboard_key, Model model) {
		
		QnrBoardVo qv = qnrBoardService.qnaSelectOne(qnrboard_key);
		model.addAttribute("qv", qv);
		
		String path = "WEB-INF/qnrBoard/qnaModify";
		return path; 
	}	
	
	@RequestMapping(value="qnaModifyAction.aws", method=RequestMethod.POST)
	public String boardModifyAction(
			QnrBoardVo qv,
			@RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request,
			RedirectAttributes rttr
			) throws Exception {
		
		MultipartFile file = attachfile;
		String uploadedFileName = "";
		
		if (! file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			// ���ε� ���� �̸� ����
		}

		String user_key = request.getSession().getAttribute("user_key").toString();
		int user_key_int = Integer.parseInt(user_key); // ȸ����ȣ�� ���������� ����
		
		String path = "";
		
		if (qv.getUser_key() == user_key_int) {
			qv.setUploadedFilename(uploadedFileName);

			int value = qnrBoardService.qnaUpdate(qv);
			
			if (value == 1) {
				path = "redirect:/qnrBoard/qnaContent.aws?qnrboard_key=" + qv.getQnrboard_key();
			}
		} else { 
		    rttr.addFlashAttribute("msg", "�ڽ��� �Խñ۸� ���� �� �� �ֽ��ϴ�.");
		    path = "redirect:/qnrBoard/qnaList.aws";
		}
				
		return path; 
	}
	
	@RequestMapping(value="qnaDeleteAction.aws", method=RequestMethod.POST)
    public String qnaDeleteAction(
    		@RequestParam("qnrboard_key") int qnrboard_key,
			RedirectAttributes rttr) {
	 
		QnrBoardVo qv = qnrBoardService.qnaSelectOne(qnrboard_key); 
		 
		int value = qnrBoardService.qnaDelete(qv);
		System.out.println("deleteaction value ===================> " + value);
		String path = ""; 
		 
		if(value == 1 || value == 2) {
			rttr.addFlashAttribute("msg", "�Խñ��� �����Ǿ����ϴ�."); 
			path = "redirect:/qnrBoard/qnaList.aws"; 
		}
	 
		return path; 
	}
	 
	@RequestMapping(value="qnaReply.aws", method=RequestMethod.GET)
	public String qnaReply(
			@RequestParam("qnrboard_key") int qnrboard_key, 
			Model model,
			HttpServletRequest request,
			RedirectAttributes rttr) {
		
		QnrBoardVo qv = qnrBoardService.qnaSelectOne(qnrboard_key);
		model.addAttribute("qv", qv);
		
		String grade = request.getSession().getAttribute("grade").toString();
		
		String path = "";
		
		if (grade.equals("A")) {
			path = "WEB-INF/qnrBoard/qnaReply";
		} else { 
		    rttr.addFlashAttribute("msg", "�����ڸ� �亯�� �ۼ� �� �� �ֽ��ϴ�.");
		    path = "redirect:/qnrBoard/qnaList.aws";
		}
		
		return path;  
	}	
	
	@RequestMapping(value="qnaReplyAction.aws", method=RequestMethod.POST)
	public String qnaReplyAction(
			QnrBoardVo qv,
			@RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request,
			RedirectAttributes rttr
			) throws Exception {
		
		MultipartFile file = attachfile;
		String uploadedFileName = "";
		
		if (! file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			// ���ε� ���� �̸� ����
		}
		
		String user_key = request.getSession().getAttribute("user_key").toString();
		int user_key_int = Integer.parseInt(user_key); // ȸ����ȣ�� ���������� ����
		
		qv.setUploadedFilename(uploadedFileName);
		qv.setUser_key(user_key_int);
		System.out.println("qv.origin_num =============> " +qv.getOrigin_num());
		
		int max_qnrboard_key = qnrBoardService.qnaReply(qv);
		
		String path = "";
		if (max_qnrboard_key != 0) { 
			path = "redirect:/qnrBoard/qnaContent.aws?qnrboard_key=" + max_qnrboard_key; 
		} else { 
			rttr.addFlashAttribute("msg", "�Է��� �߸� �Ǿ����ϴ�.");
			path = "redirect:/qnrBoard/qnaReply.aws?qnrboard_key=" + qv.getQnrboard_key(); 
		}	
		
		return path; 
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/displayFile.aws", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(
			@RequestParam("fileName") String fileName,
			@RequestParam(value="down", defaultValue="0") int down
			) {
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		try{
			
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // Ȯ���ڸ� ������
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
