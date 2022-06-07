package com.movieRc.dto;

public class LikeCommentDTO {

	private int seq_like;
	private int c_like_check;
	private String user_id;
	private int seq_comment;
	private String user_category;
	
	public LikeCommentDTO() {}
	
	public LikeCommentDTO(int seq_like, int c_like_check, String user_id, int seq_comment, String user_category) {
		super();
		this.seq_like = seq_like;
		this.c_like_check = c_like_check;
		this.user_id = user_id;
		this.seq_comment = seq_comment;
		this.user_category = user_category;
	}

	public int getSeq_like() {
		return seq_like;
	}

	public void setSeq_like(int seq_like) {
		this.seq_like = seq_like;
	}

	public int getC_like_check() {
		return c_like_check;
	}

	public void setC_like_check(int c_like_check) {
		this.c_like_check = c_like_check;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getSeq_comment() {
		return seq_comment;
	}

	public void setSeq_comment(int seq_comment) {
		this.seq_comment = seq_comment;
	}

	public String getUser_category() {
		return user_category;
	}

	public void setUser_category(String user_category) {
		this.user_category = user_category;
	}

	@Override
	public String toString() {
		return "LikeCommentDTO [seq_like=" + seq_like + ", c_like_check=" + c_like_check + ", user_id=" + user_id
				+ ", seq_comment=" + seq_comment + ", user_category=" + user_category + "]";
	}
	
	
}
