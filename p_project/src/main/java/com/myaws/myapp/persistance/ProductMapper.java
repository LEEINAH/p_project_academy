package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface ProductMapper {

	// ��ǰ �� ���� ����
	public int productTotalCount(HashMap<String,Object> hm);
	
	// ��� ��ǰ ����
	public ArrayList<ProductVo> productSelectAll(HashMap<String,Object> hm);
	
	// Ư�� �Խñ� ����
	public ProductVo productSelectOne(int product_key);
	
	// ��ȸ�� ������Ʈ
	public int productViewCntUpdate(int product_key);
	
	
}
