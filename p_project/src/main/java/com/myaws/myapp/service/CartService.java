package com.myaws.myapp.service;

import java.util.ArrayList;

import com.myaws.myapp.domain.CartVo;
import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface CartService {
	
	// 상품 총 개수 추출
	public int cartInsert(CartVo cv);
	
	// 상품 총 개수 추출
	public int productTotalCount(SearchCriteria scri,int user_key_int);
		
	// 상품 총 개수 추출
	public ArrayList<CartVo> productSelectAll(SearchCriteria scri,int user_key_int);	

}
