package com.myaws.myapp.service;

import java.util.ArrayList;

import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface ProductService {
	
	// 상품 총 개수 추출
	public int productTotalCount(SearchCriteria scri);
	
	// 모든 상품 추출
	public ArrayList<ProductVo> productSelectAll(SearchCriteria scri);
	
	// 특정 게시글 추출
	public ProductVo productSelectOne(int product_key);
	
	// 조회수 업데이트
	public int productViewCntUpdate(int product_key);

}
