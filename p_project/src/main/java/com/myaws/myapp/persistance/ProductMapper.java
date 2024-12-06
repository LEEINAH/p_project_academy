package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface ProductMapper {

	// 상품 총 개수 추출
	public int productTotalCount(HashMap<String,Object> hm);
	
	// 모든 상품 추출
	public ArrayList<ProductVo> productSelectAll(HashMap<String,Object> hm);
	
	// 특정 게시글 추출
	public ProductVo productSelectOne(int product_key);
	
	// 조회수 업데이트
	public int productViewCntUpdate(int product_key);
	
	
}
