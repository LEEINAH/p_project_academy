package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.persistance.QnrBoardMapper;

@Service
public class QnrBoardServiceImpl implements QnrBoardService {

	private QnrBoardMapper qm;

	@Autowired
	public QnrBoardServiceImpl(SqlSession sqlSession) {
	  	this.qm = sqlSession.getMapper(QnrBoardMapper.class); // 실행 파일이 있는지 확인하기 위해 class를 붙임
	  												   		   // mybatis를 쓰기 위해 mapper와 연동
	}
	
	@Override
	@Transactional
	public int reviewInsert(QnrBoardVo qv) {
	
		int value = qm.reviewInsert(qv);
		
		return value;
	}
	
	@Override
	public ArrayList<QnrBoardVo> reviewSelectAll(int product_key, int block) {
		
		block = block*4;
		ArrayList<QnrBoardVo> qlist = qm.reviewSelectAll(product_key, block);
		return qlist;
	}
	
	@Override
	public int reviewTotalCnt(int product_key) {
		
		int cnt = qm.reviewTotalCnt(product_key);
		return cnt;
	}
	
	@Override
	public ArrayList<QnrBoardVo> qnaSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("perPageNum", scri.getPerPageNum());		
		
		ArrayList<QnrBoardVo> qlist = qm.qnaSelectAll(hm);
		
		return qlist;
	}

	@Override
	public int qnaTotalCount(SearchCriteria scri) {
		
		int cnt = qm.qnaTotalCount(scri);
		return cnt;
	}
	
	@Override
	@Transactional
	public int qnaInsert(QnrBoardVo qv) {
	
		int value = qm.qnaInsert(qv);
		int maxBidx = qv.getQnrboard_key();
		int value2 = qm.qnrBoard_keyUpdate(maxBidx);
		
		return value+value2;
	}
	
	@Override
	public QnrBoardVo qnaSelectOne(int qnrboard_key) {
		
		QnrBoardVo qv = qm.qnaSelectOne(qnrboard_key);
		return qv;
	}
	
	@Override
	public int qnaUpdate(QnrBoardVo qv) {

		int value = qm.qnaUpdate(qv);		
		return value;
	}
	
	@Override
	public int qnaDelete(QnrBoardVo qv) {
		
		int value = qm.qnaDelete(qv);
		return value;
	}
	
	@Transactional // update, insert 둘 중 하나라도 실행 실패하면 원복
	@Override
	public int qnaReply(QnrBoardVo qv) {

		qm.qnaReplyInsert(qv);
		
		int max_qnrboard_key = qv.getQnrboard_key();
		
		return max_qnrboard_key;
	}
	
	public List<Integer> getUserOriginNums(int user_key) {
		
	    return qm.selectUserOriginNums(user_key);
	}
}
