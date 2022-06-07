package com.movieRc.dto;

public class LikePostDTO {
	private int seq_like;
	private int p_like_check;
	private String user_id;
	private int seq_post;
	private String user_category;
	
	public LikePostDTO() {}
	
	public LikePostDTO(int seq_like, int p_like_check, String user_id, int seq_post, String user_category) {
		super();
		this.seq_like = seq_like;
		this.p_like_check = p_like_check;
		this.user_id = user_id;
		this.seq_post = seq_post;
		this.user_category = user_category;
	}

	public int getSeq_like() {
		return seq_like;
	}

	public void setSeq_like(int seq_like) {
		this.seq_like = seq_like;
	}

	public int getP_like_check() {
		return p_like_check;
	}

	public void setP_like_check(int p_like_check) {
		this.p_like_check = p_like_check;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
		return "LikePostDTO [seq_like=" + seq_like + ", p_like_check=" + p_like_check + ", user_id=" + user_id
				+ ", seq_post=" + seq_post + ", user_category=" + user_category + "]";
	}
	
	
}
