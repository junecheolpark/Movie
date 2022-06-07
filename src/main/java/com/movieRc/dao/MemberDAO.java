package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.MemberDTO;

public class MemberDAO {
	private BasicDataSource bds;
	
	public MemberDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
	
	private void close(Connection con, PreparedStatement pstmt) {
		// TODO Auto-generated method stub
		
	}
	
	// 수정
	public int modifyMember(MemberDTO dto) throws Exception{
		String sql = "update tbl_member set user_nickname=?, user_pw=?, user_phone=?, postcode=?,"
				+ "roadAddr=?, detailAddr=?, extraAddr=? where user_id=?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getUser_nickname());
			pstmt.setString(2, dto.getUser_pw());
			pstmt.setString(3, dto.getUser_phone());
			pstmt.setString(4, dto.getPostcode());
			pstmt.setString(5, dto.getRoadAddr());
			pstmt.setString(6, dto.getDetailAddr());
			pstmt.setString(7, dto.getExtraAddr());
			pstmt.setString(8, dto.getUser_id());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	// 아이디 선택
	public MemberDTO selectById(String user_id) {
		String sql = "SELECT * FROM TBL_MEMBER where user_id=?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_phone(rs.getString("phone"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setRoadAddr(rs.getString("roadAddr"));
				dto.setDetailAddr(rs.getString("detailAddr"));
				dto.setExtraAddr(rs.getString("extraAddr"));
				return dto;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 회원탈퇴
	public int deleteMember(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		
		try {
			con = getConnection();
			
			String sql = "delete from tbl_member where user_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
		return rs;
	}

	// nickname 중복체크
	public boolean checkNickname(String user_nickname) throws Exception{
		String sql = "select count(*) from tbl_member where user_nickname = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, user_nickname);
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
}
