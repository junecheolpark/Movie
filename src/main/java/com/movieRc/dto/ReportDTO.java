package com.movieRc.dto;

public class ReportDTO {
	private int seq_report;
	private String category_check;
	private String rp_content;
	private String user_id;
	private int seq_review;
	private int seq_comment;
	private int seq_post;
	private String user_category;
	
	public ReportDTO() {}
	public ReportDTO(int seq_report, String category_check, String rp_content, String user_id, int seq_review,
			int seq_comment, int seq_post, String user_category) {
		
		this.seq_report = seq_report;
		this.category_check = category_check;
		this.rp_content = rp_content;
		this.user_id = user_id;
		this.seq_review = seq_review;
		this.seq_comment = seq_comment;
		this.seq_post = seq_post;
		this.user_category = user_category;
	}
	public int getSeq_report() {
		return seq_report;
	}
	public void setSeq_report(int seq_report) {
		this.seq_report = seq_report;
	}
	public String getCategory_check() {
		return category_check;
	}
	public void setCategory_check(String category_check) {
		this.category_check = category_check;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getSeq_review() {
		return seq_review;
	}
	public void setSeq_review(int seq_review) {
		this.seq_review = seq_review;
	}
	public int getSeq_comment() {
		return seq_comment;
	}
	public void setSeq_comment(int seq_comment) {
		this.seq_comment = seq_comment;
	}
	public int getSeq_post() {
		return seq_post;
	}
	public void setSeq_post(int seq_post) {
		this.seq_post = seq_post;
	}
	public String getUser_category() {
		return user_category;
	}
	public void setUser_category(String user_category) {
		this.user_category = user_category;
	}
	@Override
	public String toString() {
		return seq_report + " : " + category_check + " : " + rp_content + " : " + user_id + " : " + seq_review + " : " + seq_comment + 
				" : " + seq_post + " : " + user_category;
	}
	
}
