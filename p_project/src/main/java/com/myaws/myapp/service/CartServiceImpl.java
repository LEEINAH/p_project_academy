package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myaws.myapp.domain.CartVo;
import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.persistance.CartMapper;
import com.myaws.myapp.persistance.ProductMapper;

@Service
public class CartServiceImpl implements CartService {

	private CartMapper cm;

	@Autowired
	public CartServiceImpl(SqlSession sqlSession) {
	  	this.cm = sqlSession.getMapper(CartMapper.class); // 실행 파일이 있는지 확인하기 위해 class를 붙임
												           // mybatis를 쓰기 위해 mapper와 연동
	}

	@Override
	public int cartInsert(CartVo cv) {

		int value = cm.cartInsert(cv);
		
		return value;
	}

	@Override
	public int productTotalCount(SearchCriteria scri, int user_key) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("perPageNum", scri.getPerPageNum());	
		hm.put("user_key", user_key);
		
		System.out.println("TotalCount user_key ====================> " + user_key);
		
		int cnt = cm.productTotalCount(hm);
		return cnt;
	}

	@Override
	public ArrayList<CartVo> productSelectAll(SearchCriteria scri, int user_key) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("perPageNum", scri.getPerPageNum());	
		hm.put("user_key", user_key);
		
		System.out.println("SelectAl user_key ====================> " + user_key);
		
		ArrayList<CartVo> clist = cm.productSelectAll(hm);
		
		return clist;
	}
}
