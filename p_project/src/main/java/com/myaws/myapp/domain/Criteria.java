package com.myaws.myapp.domain;

public class Criteria {

	private int page = 1;
	private int perPageNum = 8;
	
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
}