package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import javax.naming.Context;
import javax.naming.InitialContext;

import com.movieRc.dto.MemberDTO;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class KakaoDAO {
	private BasicDataSource bds;

	public KakaoDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 전체 조회
	public ArrayList<MemberDTO> selectAll() throws Exception {
		String sql = "select * from tbl_member";

		try (Connection con = bds.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();

			ArrayList<MemberDTO> list = new ArrayList<>();
			while (rs.next()) {
				String user_id = rs.getString("user_id");
				String user_category = rs.getString("user_category");
				String user_k = rs.getString("user_k");
				String user_pw = rs.getString("user_pw");
				String user_nickname = rs.getString("user_nickname");
				String user_name = rs.getString("user_name");
				int user_birth = rs.getInt("user_birth");
				String user_phone = rs.getString("user_phone");
				String postcode = rs.getString("postcode");
				String roadAddr = rs.getString("roadAddr");
				String detailAddr = rs.getString("detailAddr");
				String extraAddr = rs.getString("extraAddr");
				String grade = rs.getString("grade");

				list.add(new MemberDTO(user_id, user_category, user_k, user_pw, user_nickname, user_name, user_birth,
						user_phone, postcode, roadAddr, detailAddr, extraAddr, grade));
			}
			return list;
		}
	}

	// 로그인 토큰 체크
	public boolean checkToken(String user_k) throws Exception{
		String sql = "select count(*) from tbl_member where user_k = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, user_k);
			ResultSet rs = pstmt.executeQuery();
			
			int result = 0;
			if(rs.next()) {
				result = rs.getInt(1);
			}
			if(result == 0) {
				return true;
			}else {
				return false;
			}
		}
	}
	
	public MemberDTO checkLogin(String user_name, String user_k) throws Exception {
		String sql = "select * from tbl_member where user_name = ? and user_k = ?";

		try (Connection con = bds.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_name);
			pstmt.setString(2, user_k);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String user_category = rs.getString("user_category");
				String user_pw = rs.getString("user_pw");
				String user_nickname = rs.getString("user_nickname");
				String user_id = rs.getString("user_id");
				int user_birth = rs.getInt("user_birth");
				String user_phone = rs.getString("user_phone");
				String postcode = rs.getString("postcode");
				String roadAddr = rs.getString("roadAddr");
				String detailAddr = rs.getString("detailAddr");
				String extraAddr = rs.getString("extraAddr");
				String grade = rs.getString("grade");

				return new MemberDTO(user_id, user_category, user_k, user_pw, user_nickname, user_name, user_birth,
						user_phone, postcode, roadAddr, detailAddr, extraAddr, grade);
			} else {
				return null;
			}
		}
	}

	// 카카오 회원가입
	public int insert(MemberDTO dto) throws Exception {
		String sql = "insert into tbl_member values(?, '카카오 가입', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = bds.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, dto.getUser_id());
//			pstmt.setString(2, dto.getUser_category());
			pstmt.setString(2, dto.getUser_k());
			pstmt.setString(3, dto.getUser_pw());
			pstmt.setString(4, dto.getUser_nickname());
			pstmt.setString(5, dto.getUser_name());
			pstmt.setInt(6, dto.getUser_birth());
			pstmt.setString(7, dto.getUser_phone());
			pstmt.setString(8, dto.getPostcode());
			pstmt.setString(9, dto.getRoadAddr());
			pstmt.setString(10, dto.getDetailAddr());
			pstmt.setString(11, dto.getExtraAddr());
			pstmt.setString(12, dto.getGrade());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

}
