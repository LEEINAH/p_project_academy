package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface ProductService {
	
	// ��ǰ �� ���� ����
	public int productTotalCount(SearchCriteria scri, int category_code);
	
	// ��� ��ǰ ����
	public ArrayList<ProductVo> productSelectAll(SearchCriteria scri, int category_code);
	
	// Ư�� �Խñ� ����
	public ProductVo productSelectOne(int product_key);
	
	// ��ȸ�� ������Ʈ
	public int productViewCntUpdate(int product_key);

}
