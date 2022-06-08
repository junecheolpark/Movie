package com.movieRc.dto;

// 리뷰 DTO
public class ReviewDTO {
    private int seq_review;
    private String movieCd;
    private String user_id;
    private String user_category;
    private String user_nickname;
    private String r_content;
    private String r_date;
    private int r_grade;

    public ReviewDTO() {
    }

    public ReviewDTO(int seq_review, String movieCd, String user_id, String user_category, String user_nickname, String r_content, String r_date, int r_grade) {
        this.seq_review = seq_review;
        this.movieCd = movieCd;
        this.user_id = user_id;
        this.user_category = user_category;
        this.user_nickname = user_nickname;
        this.r_content = r_content;
        this.r_date = r_date;
        this.r_grade = r_grade;
    }

    public int getSeq_review() {
        return seq_review;
    }

    public void setSeq_review(int seq_review) {
        this.seq_review = seq_review;
    }

    public String getMovieCd() {
        return movieCd;
    }

    public void setMovieCd(String movieCd) {
        this.movieCd = movieCd;
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

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public String getR_content() {
        return r_content;
    }

    public void setR_content(String r_content) {
        this.r_content = r_content;
    }

    public String getR_date() {
        return r_date;
    }

    public void setR_date(String r_date) {
        this.r_date = r_date;
    }

    public int getR_grade() {
        return r_grade;
    }

    public void setR_grade(int r_grade) {
        this.r_grade = r_grade;
    }
}
