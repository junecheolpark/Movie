package com.movieRc.dto;

public class MemberDTO {
	private String user_id;
	private String user_category;
	private String user_k;
	private String user_pw;
	private String user_nickname;
	private String user_name;
	private int user_birth;
	private String user_phone;
	private String postcode;
	private String roadAddr;
	private String detailAddr;
	private String extraAddr;
	private String grade;

	public MemberDTO() {
	}

	public MemberDTO(String user_id, String user_category, String user_k, String user_pw, String user_nickname,
			String user_name, int user_birth, String user_phone, String postcode, String roadAddr, String detailAddr,
			String extraAddr, String grade) {
		
		this.user_id = user_id;
		this.user_category = user_category;
		this.user_k = user_k;
		this.user_pw = user_pw;
		this.user_nickname = user_nickname;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_phone = user_phone;
		this.postcode = postcode;
		this.roadAddr = roadAddr;
		this.detailAddr = detailAddr;
		this.extraAddr = extraAddr;
		this.grade = grade;
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

	public String getUser_k() {
		return user_k;
	}

	public void setUser_k(String user_k) {
		this.user_k = user_k;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(int user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getRoadAddr() {
		return roadAddr;
	}

	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getExtraAddr() {
		return extraAddr;
	}

	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return user_id + " : " + user_category + " : " + user_k + " : " + user_pw + " : " + user_nickname + " : "
				+ user_name + " : " + user_birth + " : " + user_phone + " : " + postcode + " : " + roadAddr + " : "
				+ detailAddr + " : " + extraAddr + " : " + grade;
	}

}
