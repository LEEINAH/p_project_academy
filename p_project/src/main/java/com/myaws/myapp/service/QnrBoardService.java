package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.List;

import com.myaws.myapp.domain.QnrBoardVo;
import com.myaws.myapp.domain.SearchCriteria;

public interface QnrBoardService {

	// �Խñ� �ۼ�
	public int reviewInsert(QnrBoardVo qv);
	
	// ���� �� ����
	public int reviewTotalCnt(int product_key);
	
	// ��� ���� ����
	public ArrayList<QnrBoardVo> reviewSelectAll(int product_key, int block);
	
	// ��� QnA ����
	public ArrayList<QnrBoardVo> qnaSelectAll(SearchCriteria scri);
	
	// QnA �� ���� ����
	public int qnaTotalCount(SearchCriteria scri);
	
	// QnA �ۼ�
	public int qnaInsert(QnrBoardVo qv);
	
	// Ư�� QnA �Խñ� ����
	public QnrBoardVo qnaSelectOne(int qnrboard_key);
	
	// QnA ����
	public int qnaUpdate(QnrBoardVo qv);
	
	// QnA ����
	public int qnaDelete(QnrBoardVo qv);
	
	// QnA �亯 �ۼ�
	public int qnaReply(QnrBoardVo qv);
	
	// �α��� �� ȸ���� �� ���� origin_num�� ���� origin_num�� ������ �ִ� �Խñ� ã��
	public List<Integer> getUserOriginNums(int user_key_int);
}
