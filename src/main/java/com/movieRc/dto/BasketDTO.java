package com.movieRc.dto;

public class BasketDTO {
	private int seq_basket;
	private String user_id;
	private String movieCd;
	private String movieNm;
	private String movieNmEn;
	private String prdtYear;
	private String user_category;
	
	public BasketDTO() {}
	public BasketDTO(int seq_basket, String user_id, String movieCd, String movieNm, String movieNmEn, String prdtYear,
			String user_category) {
		this.seq_basket = seq_basket;
		this.user_id = user_id;
		this.movieCd = movieCd;
		this.movieNm = movieNm;
		this.movieNmEn = movieNmEn;
		this.prdtYear = prdtYear;
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

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getMovieNmEn() {
		return movieNmEn;
	}

	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}

	public String getPrdtYear() {
		return prdtYear;
	}

	public void setPrdtYear(String prdtYear) {
		this.prdtYear = prdtYear;
	}

	public String getUser_category() {
		return user_category;
	}

	public void setUser_category(String user_category) {
		this.user_category = user_category;
	}
	@Override
	public String toString() {
		return "seq_basket=" + seq_basket + ", user_id=" + user_id + ", movieCd=" + movieCd + ", movieNm="
				+ movieNm + ", movieNmEn=" + movieNmEn + ", prdtYear=" + prdtYear + ", user_category=" + user_category;
	}
	
	
	
}
