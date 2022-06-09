package com.movieRc.dto;

public class MpDTO {
	private String user_id;
	private String sys_name;
	
    public MpDTO() {}

	public MpDTO(String user_id, String sys_name) {
		super();
		this.sys_name = sys_name;
		this.user_id = user_id;
	}

	public String getSys_name() {
		return sys_name;
	}

	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
