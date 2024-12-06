package com.myaws.myapp.domain;

public class CartVo {
	
	private int cart_key;
	private int product_cnt;
	private int user_key;
	private int product_key;
	private String delyn;
	private String product_img1;
	private String product_name;
	private String product_price;
	
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public int getCart_key() {
		return cart_key;
	}
	public void setCart_key(int cart_key) {
		this.cart_key = cart_key;
	}
	public int getProduct_cnt() {
		return product_cnt;
	}
	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
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

}
