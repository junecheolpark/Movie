package com.movieRc.dto;

public class BlacklistDTO {
	private String user_id;
	private String user_category;
	private String black_date;
	private String black_reason;
	private String black_YN;
	
	public BlacklistDTO() {}
	public BlacklistDTO(String user_id, String user_category, String black_date, String black_reason, String black_YN) {
		super();
		this.user_id = user_id;
		this.user_category = user_category;
		this.black_date = black_date;
		this.black_reason = black_reason;
		this.black_YN = black_YN;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_category() {
		return user_category;
	}
	public void setUser_category(String user_category) {
		this.user_category = user_category;
	}
	public String getBlack_date() {
		return black_date;
	}
	public void setBlack_date(String black_date) {
		this.black_date = black_date;
	}
	public String getBlack_reason() {
		return black_reason;
	}
	public void setBlack_reason(String black_reason) {
		this.black_reason = black_reason;
	}
	public String getBlack_YN() {
		return black_YN;
	}
	public void setBlack_YN(String black_YN) {
		this.black_YN = black_YN;
	}
	@Override
	public String toString() {
		return user_id + " : " + user_category + " : " + black_date + " : " + black_reason + " : " + black_YN;
	}
	
}
