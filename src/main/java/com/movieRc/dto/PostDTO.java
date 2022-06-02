package com.movieRc.dto;

public class PostDTO {
 private int seq_post;
 private String user_nickname;
 private String p_title;
 private String p_content;
 private String p_date;
 private int p_veiw_count;
 private String user_id;
 private String user_category;
 
 public PostDTO() {}
 
public PostDTO(int seq_post, String user_nickname, String p_title, String p_content, String p_date, int p_veiw_count,
		String user_id, String user_category) {
	this.seq_post = seq_post;	
	this.user_nickname = user_nickname;
	this.p_title = p_title;
	this.p_content = p_content;
	this.p_date = p_date;
	this.p_veiw_count = p_veiw_count;
	this.user_id = user_id;
	this.user_category = user_category;
}
public int getSeq_post() {
	return seq_post;
}
public void setSeq_post(int seq_post) {
	this.seq_post = seq_post;
}
public String getUser_nickname() {
	return user_nickname;
}
public void setUser_nickname(String user_nickname) {
	this.user_nickname = user_nickname;
}
public String getP_title() {
	return p_title;
}
public void setP_title(String p_title) {
	this.p_title = p_title;
}
public String getP_content() {
	return p_content;
}
public void setP_content(String p_content) {
	this.p_content = p_content;
}
public String getP_date() {
	return p_date;
}
public void setP_date(String p_date) {
	this.p_date = p_date;
}
public int getP_veiw_count() {
	return p_veiw_count;
}
public void setP_veiw_count(int p_veiw_count) {
	this.p_veiw_count = p_veiw_count;
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
@Override
public String toString() {
	return "PostDTO [seq_post=" + seq_post + ", user_nickname=" + user_nickname + ", p_title=" + p_title
			+ ", p_content=" + p_content + ", p_date=" + p_date + ", p_veiw_count=" + p_veiw_count + ", user_id="
			+ user_id + ", user_category=" + user_category + "]";
}
 
}
