package com.myaws.myapp.service;

import java.util.ArrayList;

import com.myaws.myapp.domain.CartVo;
import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface CartService {
	
	// ��ǰ �� ���� ����
	public int cartInsert(CartVo cv);
	
	// ��ǰ �� ���� ����
	public int productTotalCount(SearchCriteria scri,int user_key_int);
		
	// ��ǰ �� ���� ����
	public ArrayList<CartVo> productSelectAll(SearchCriteria scri,int user_key_int);	

}
