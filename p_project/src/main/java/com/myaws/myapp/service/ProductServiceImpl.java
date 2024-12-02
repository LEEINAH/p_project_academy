package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myaws.myapp.domain.ProductVo;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.persistance.ProductMapper;
import com.myaws.myapp.persistance.UserMapper;

@Service
public class ProductServiceImpl implements ProductService {

	private ProductMapper pm;

	@Autowired
	public ProductServiceImpl(SqlSession sqlSession) {
	  	this.pm = sqlSession.getMapper(ProductMapper.class); // 실행 파일이 있는지 확인하기 위해 class를 붙임
												              // mybatis를 쓰기 위해 mapper와 연동
	}
	
	@Override
	public ArrayList<ProductVo> productSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("keyword", scri.getKeyword());
		hm.put("perPageNum", scri.getPerPageNum());		
		
		ArrayList<ProductVo> plist = pm.productSelectAll(hm);
		
		return plist;
	}
	
	@Override
	public int productTotalCount(SearchCriteria scri) {
		
		int cnt = pm.productTotalCount(scri);
		return cnt;
	}
	
	@Override
	public ProductVo productSelectOne(int product_key) {
		
		ProductVo pv = pm.productSelectOne(product_key);
		return pv;
	}

	@Override
	public int productViewCntUpdate(int product_key) {
		
		int cnt = pm.productViewCntUpdate(product_key);
		return cnt;
	}
}
