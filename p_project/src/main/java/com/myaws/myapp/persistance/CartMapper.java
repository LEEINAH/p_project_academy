package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.myaws.myapp.domain.CartVo;
import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface CartMapper {
	
	// �Խñ� ����
	public int cartInsert(CartVo cv);
	
	// ��ǰ �� ���� ����
	public int productTotalCount(HashMap<String,Object> hm);
		
	// ��ǰ �� ���� ����
	public ArrayList<CartVo> productSelectAll(HashMap<String,Object> hm);	

}
