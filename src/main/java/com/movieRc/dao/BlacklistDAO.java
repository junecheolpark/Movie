package com.movieRc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.BlacklistDTO;
import com.movieRc.dto.ReportDTO;

public class BlacklistDAO {
	private BasicDataSource bds;

	public BlacklistDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}
	
	// 블랙리스트 등록
	public int insertBlack(BlacklistDTO dto) throws Exception{
		String sql = "insert into tbl_blacklist values(?, ?, sysdate, ?)";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			String user_category = getU_ctg(dto.getUser_id());
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, user_category);
			pstmt.setString(3, dto.getBlack_reason());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public String getU_ctg(String user_id) throws Exception{
		String sql = "select user_category from tbl_member where user_id = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String user_category = rs.getString("user_category");
				return user_category;
			}else {
				return null;
			}
		}
	}
	
	// 블랙리스트 삭제
	public int deleteBlack(String user_id) throws Exception{
		String sql = "delete from tbl_blacklist where user_id = ?";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, user_id);
			int rs = pstmt.executeUpdate();
			return rs;
		}
		
	}
	
	// Date -> String
	public String getStringDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return sdf.format(date);
	}

	// 블랙리스트 목록 조회
	public ArrayList<BlacklistDTO> selectAll() throws Exception {
		/*
		 * String sql =
		 * "select * from (select tbl_blacklist.*, row_number() over(order by black_date desc)"
		 * + " as num from tbl_blacklist)" + " where num between ? and ?";
		 */
		String sql = "select * from tbl_blacklist";
		try (Connection con = bds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql);) {

			ResultSet rs = pstmt.executeQuery();
			ArrayList<BlacklistDTO> list = new ArrayList<>();
			while (rs.next()) {
				
				String user_id = rs.getString("user_id");
				String user_category = rs.getString("user_category");
				String black_date = getStringDate(rs.getDate("black_date"));
				String black_reason = rs.getString("black_reason");
				
				list.add(new BlacklistDTO(user_id, user_category, black_date, black_reason));
				 
			}
			return list;
		}
	}

	// 블랙리스트인지 조회
	public boolean selectById(String user_id) throws Exception{
		String sql = "select * from tbl_blacklist where user_id = ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
		}
	}
	

}
