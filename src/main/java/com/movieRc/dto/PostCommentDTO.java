package com.movieRc.dto;

public class PostCommentDTO {
	private int seq_post_comment;
	private String user_nickname;
	private String comment_date;
	private String comment_content;
	private String user_id;
	private int seq_post;
	private String user_category;
	
	public PostCommentDTO() {}
	
	public PostCommentDTO(int seq_post_comment, String user_nickname, String comment_date, String comment_content,
			String user_id, int seq_post, String user_category) {
		super();
		this.seq_post_comment = seq_post_comment;
		this.user_nickname = user_nickname;
		this.comment_date = comment_date;
		this.comment_content = comment_content;
		this.user_id = user_id;
		this.seq_post = seq_post;
		this.user_category = user_category;
	}

	public int getSeq_post_comment() {
		return seq_post_comment;
	}

	public void setSeq_post_comment(int seq_post_comment) {
		this.seq_post_comment = seq_post_comment;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
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
		return "PostCommentDTO [seq_post_comment=" + seq_post_comment + ", user_nickname=" + user_nickname + ", comment_date="
				+ comment_date + ", comment_content=" + comment_content + ", user_id=" + user_id + ", seq_post="
				+ seq_post + ", user_category=" + user_category + "]";
	}
	
	
	
}
