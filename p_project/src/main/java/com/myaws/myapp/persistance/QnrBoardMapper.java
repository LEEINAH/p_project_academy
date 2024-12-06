package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface QnrBoardMapper {
	
	// 게시글 생성
	public int reviewInsert(QnrBoardVo qv);
	
	// 리뷰 총 개수
	public int reviewTotalCnt(int product_key);
	
	// 모든 리뷰 추출
	public ArrayList<QnrBoardVo> reviewSelectAll(int product_key, int block);
	
	// 모든 QnA 추출
	public ArrayList<QnrBoardVo> qnaSelectAll(HashMap<String,Object> hm);
	
	// QnA 총 개수 추출
	public int qnaTotalCount(SearchCriteria scri);
	
	// QnA 게시글 생성
	public int qnaInsert(QnrBoardVo qv);
	
	// 게시글 생성 후 null값이 들어가있는 origin_num에 maxqnrBoard_key값을 넣어주는 Update 메서드
	public int qnrBoard_keyUpdate(int qnrboard_key);
	
	// 특정 QnA 게시글 추출
	public QnrBoardVo qnaSelectOne(int qnrboard_key);
	
	// QnA 수정
	public int qnaUpdate(QnrBoardVo qv);
	
	// QnA 삭제
	public int qnaDelete(QnrBoardVo qv);	
	
	// 게시글 답변 생성
	public int qnaReplyInsert(QnrBoardVo qv);
	
	// 로그인 한 회원이 쓴 글의 origin_num과 같은 origin_num을 가지고 있는 게시글 찾기	
	public List<Integer> selectUserOriginNums(int user_key);

}
