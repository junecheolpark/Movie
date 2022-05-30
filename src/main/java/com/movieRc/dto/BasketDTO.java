package com.movieRc.dto;

public class BasketDTO {
	private int seq_basket;
	private String user_id;
	private String movieCd;
	private String user_category;
	
	public BasketDTO() {}
	public BasketDTO(int seq_basket, String user_id, String movieCd, String user_category) {		
		this.seq_basket = seq_basket;
		this.user_id = user_id;
		this.movieCd = movieCd;
		this.user_category = user_category;
	}
	public int getSeq_basket() {
		return seq_basket;
	}
	public void setSeq_basket(int seq_basket) {
		this.seq_basket = seq_basket;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public String getUser_category() {
		return user_category;
	}
	public void setUser_category(String user_category) {
		this.user_category = user_category;
	}
	@Override
	public String toString() {
		return seq_basket + " : " + user_id + " : " + movieCd + " : " + user_category;
	}
	
}
