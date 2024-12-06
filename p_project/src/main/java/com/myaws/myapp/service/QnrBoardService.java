package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.List;

import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface QnrBoardService {

	// 게시글 작성
	public int reviewInsert(QnrBoardVo qv);
	
	// 리뷰 총 개수
	public int reviewTotalCnt(int product_key);
	
	// 모든 리뷰 추출
	public ArrayList<QnrBoardVo> reviewSelectAll(int product_key, int block);
	
	// 모든 QnA 추출
	public ArrayList<QnrBoardVo> qnaSelectAll(SearchCriteria scri);
	
	// QnA 총 개수 추출
	public int qnaTotalCount(SearchCriteria scri);
	
	// QnA 작성
	public int qnaInsert(QnrBoardVo qv);
	
	// 특정 QnA 게시글 추출
	public QnrBoardVo qnaSelectOne(int qnrboard_key);
	
	// QnA 수정
	public int qnaUpdate(QnrBoardVo qv);
	
	// QnA 삭제
	public int qnaDelete(QnrBoardVo qv);
	
	// QnA 답변 작성
	public int qnaReply(QnrBoardVo qv);
	
	// 로그인 한 회원이 쓴 글의 origin_num과 같은 origin_num을 가지고 있는 게시글 찾기
	public List<Integer> getUserOriginNums(int user_key_int);
}
