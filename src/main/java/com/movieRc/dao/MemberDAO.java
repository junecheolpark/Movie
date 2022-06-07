package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.MemberDTO;
import com.movieRc.util.EncryptionUtils;

public class MemberDAO {
	private BasicDataSource bds;

	public MemberDAO() {
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
			while(rs.next()) {
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

				list.add(new MemberDTO(user_id, user_category, user_k, user_pw, user_nickname, user_name, user_birth, user_phone, postcode, roadAddr, detailAddr, extraAddr, grade));
			}
			return list;
		}
	}

	// 아이디 찾기
	public String findId(String user_name, String user_phone) throws Exception {
		String user_id = null;
		String sql = "select user_id from tbl_member where user_name= ? and user_phone = ?";

		try (Connection con = bds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_name);
			pstmt.setString(2, user_phone);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				user_id = rs.getString("user_id");
			}
		} return user_id;
	}

	// 비밀번호 찾기
	public String findPw(String user_name, String user_id) throws Exception {
		String user_pw = null;
		String sql = "select user_pw from tbl_member where user_name= ? and user_id = ?";

		try (Connection con = bds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_name);
			pstmt.setString(2, user_id);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				user_pw = rs.getString("user_pw");
			}
		} return user_pw;
	}

	// 비밀번호 수정하기
	public int pwUpdate(String user_pw, String user_id) throws Exception {
		String sql = "update tbl_member set user_pw = ? where user_id = ?";

		try (Connection con = bds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_pw);
			pstmt.setString(2, user_id);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}


	// 랜덤 비번
	public static String randomPassword(int length) {
		int index = 0;
		char[] charset = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a','b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
				'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charset.length * Math.random());
			sb.append(charset[index]);
		}
		return sb.toString();
	}

	// 회원가입
	public int insert(MemberDTO dto) throws Exception {
		String sql = "insert into tbl_member values(?, '일반 가입', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = bds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, dto.getUser_id());
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

	// 로그인 아이디, 비번 체크
	public MemberDTO checkLogin(String user_id, String user_pw) throws Exception{
		String sql = "select * from tbl_member where user_id = ? and user_pw = ?";

		try (Connection con = bds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				String user_category = rs.getString("user_category");
				String user_k = rs.getString("user_k");
				String user_nickname = rs.getString("user_nickname");
				String user_name = rs.getString("user_name");
				int user_birth = rs.getInt("user_birth");
				String user_phone = rs.getString("user_phone");
				String postcode = rs.getString("postcode");
				String roadAddr = rs.getString("roadAddr");
				String detailAddr = rs.getString("detailAddr");
				String extraAddr = rs.getString("extraAddr");
				String grade = rs.getString("grade");

				return new MemberDTO(user_id, user_category, user_k, user_pw, user_nickname, user_name, user_birth, user_phone, postcode, roadAddr, detailAddr, extraAddr, grade);
			} else {
				return null;
			}
		}
	}

	// 중복 아이디 체크
	public boolean checkID(String user_id) throws Exception{
		String sql = "select count(*) from tbl_member where user_id = ?";

		try (Connection con = bds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();

			int result = 0;
			if(rs.next()) {
				result = rs.getInt(1);
			}
			if(result == 0) {
				return true;
			} else {
				return false;
			}
		}
	}

	// 중복 닉네임 체크
	public boolean checkNickname(String user_nickname) throws Exception{
		String sql = "select count(*) from tbl_member where user_nickname = ?";

		try (Connection con = bds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_nickname);
			ResultSet rs = pstmt.executeQuery();

			int result = 0;
			if(rs.next()) {
				result = rs.getInt(1);
			}
			if(result == 0) {
				return true;
			} else {
				return false;
			}
		}
	}
}