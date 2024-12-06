package com.myaws.myapp.domain;

public class QnrBoardVo {

	private int qnrboard_key;
	private String subject;
	private String content;
	private String w_date;
	private String img;
	private int star;
	private int origin_num;
	private int user_key;
	private int product_key;
	private String uploadedFilename;
	private String division;
	private String delyn;
	private String username;
	private int level_;
	
	public int getLevel_() {
		return level_;
	}
	public void setLevel_(int level_) {
		this.level_ = level_;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public int getQnrboard_key() {
		return qnrboard_key;
	}
	public void setQnrboard_key(int qnrboard_key) {
		this.qnrboard_key = qnrboard_key;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getOrigin_num() {
		return origin_num;
	}
	public void setOrigin_num(int origin_num) {
		this.origin_num = origin_num;
	}
	public int getUser_key() {
		return user_key;
	}
	public void setUser_key(int user_key) {
		this.user_key = user_key;
	}
	public int getProduct_key() {
		return product_key;
	}
	public void setProduct_key(int product_key) {
		this.product_key = product_key;
	}
	public String getUploadedFilename() {
		return uploadedFilename;
	}
	public void setUploadedFilename(String uploadedFilename) {
		this.uploadedFilename = uploadedFilename;
	}	
}
