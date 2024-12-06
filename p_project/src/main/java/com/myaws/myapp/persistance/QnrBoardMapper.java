package com.myaws.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface QnrBoardMapper {
	
	// �Խñ� ����
	public int reviewInsert(QnrBoardVo qv);
	
	// ���� �� ����
	public int reviewTotalCnt(int product_key);
	
	// ��� ���� ����
	public ArrayList<QnrBoardVo> reviewSelectAll(int product_key, int block);
	
	// ��� QnA ����
	public ArrayList<QnrBoardVo> qnaSelectAll(HashMap<String,Object> hm);
	
	// QnA �� ���� ����
	public int qnaTotalCount(SearchCriteria scri);
	
	// QnA �Խñ� ����
	public int qnaInsert(QnrBoardVo qv);
	
	// �Խñ� ���� �� null���� ���ִ� origin_num�� maxqnrBoard_key���� �־��ִ� Update �޼���
	public int qnrBoard_keyUpdate(int qnrboard_key);
	
	// Ư�� QnA �Խñ� ����
	public QnrBoardVo qnaSelectOne(int qnrboard_key);
	
	// QnA ����
	public int qnaUpdate(QnrBoardVo qv);
	
	// QnA ����
	public int qnaDelete(QnrBoardVo qv);	
	
	// �Խñ� �亯 ����
	public int qnaReplyInsert(QnrBoardVo qv);
	
	// �α��� �� ȸ���� �� ���� origin_num�� ���� origin_num�� ������ �ִ� �Խñ� ã��	
	public List<Integer> selectUserOriginNums(int user_key);

}
