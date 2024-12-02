package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface ProductMapper {

	// ��ǰ �� ���� ����
	public int productTotalCount(SearchCriteria scri);
	
	// ��� ��ǰ ����
	public ArrayList<ProductVo> productSelectAll(HashMap<String,Object> hm);
	
	// Ư�� �Խñ� ����
	public ProductVo productSelectOne(int product_key);
	
	// ��ȸ�� ������Ʈ
	public int productViewCntUpdate(int product_key);
}
