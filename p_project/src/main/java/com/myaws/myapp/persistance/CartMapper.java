package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.myaws.myapp.domain.CartVo;
import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface CartMapper {
	
	// 게시글 생성
	public int cartInsert(CartVo cv);
	
	// 상품 총 개수 추출
	public int productTotalCount(HashMap<String,Object> hm);
		
	// 상품 총 개수 추출
	public ArrayList<CartVo> productSelectAll(HashMap<String,Object> hm);	

}
