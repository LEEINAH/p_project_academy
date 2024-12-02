package com.myaws.myapp.service;

import java.util.ArrayList;

import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface ProductService {
	
	// ��ǰ �� ���� ����
	public int productTotalCount(SearchCriteria scri);
	
	// ��� ��ǰ ����
	public ArrayList<ProductVo> productSelectAll(SearchCriteria scri);
	
	// Ư�� �Խñ� ����
	public ProductVo productSelectOne(int product_key);
	
	// ��ȸ�� ������Ʈ
	public int productViewCntUpdate(int product_key);

}
