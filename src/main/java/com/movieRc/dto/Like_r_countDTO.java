package com.movieRc.dto;

public class Like_r_countDTO {
private int l_count;
private int seq_review;
private String user_id;


public Like_r_countDTO() {}


public Like_r_countDTO(int l_count, int seq_review, String user_id) {
	super();
	this.l_count = l_count;
	this.seq_review = seq_review;
	this.user_id = user_id;
}


public int getL_count() {
	return l_count;
}


public void setL_count(int l_count) {
	this.l_count = l_count;
}


public int getSeq_review() {
	return seq_review;
}


public void setSeq_review(int seq_review) {
	this.seq_review = seq_review;
}




public String getUser_id() {
	return user_id;
}


public void setUser_id(String user_id) {
	this.user_id = user_id;
}


@Override
public String toString() {
	return l_count + " : " + seq_review + " : " + user_id;
}



}
