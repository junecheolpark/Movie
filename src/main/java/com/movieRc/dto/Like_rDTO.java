package com.movieRc.dto;

// 좋아요 기능구현 dto
public class Like_rDTO {
    private int seq_like;
    private int r_like_check;
    private String user_id;
    private String user_category;
    private int seq_review;


    public Like_rDTO() {
    }

    public Like_rDTO(int seq_like, int r_like_check, String user_id, String user_category, int seq_review) {
        this.seq_like = seq_like;
        this.r_like_check = r_like_check;
        this.user_id = user_id;
        this.user_category = user_category;
        this.seq_review = seq_review;
    }

    public int getSeq_like() {
        return seq_like;
    }

    public void setSeq_like(int seq_like) {
        this.seq_like = seq_like;
    }

    public int getR_like_check() {
        return r_like_check;
    }

    public void setR_like_check(int r_like_check) {
        this.r_like_check = r_like_check;
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

    public int getSeq_review() {
        return seq_review;
    }

    public void setSeq_review(int seq_review) {
        this.seq_review = seq_review;
    }
}