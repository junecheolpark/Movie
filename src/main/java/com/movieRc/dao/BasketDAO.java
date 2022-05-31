package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.BasketDTO;

public class BasketDAO {
	private BasicDataSource bds;
	
	public BasketDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	
	// 찜 목록 모두 조회
	public ArrayList<BasketDTO> selectAll(String user_id) throws Exception{
		String sql = "select * from tbl_basket where user_id = ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<BasketDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_basket = rs.getInt("seq_basket");
				String movieCd = rs.getString("movieCd");
				String user_category = rs.getString("user_category");
				
				list.add(new BasketDTO(seq_basket, user_id, movieCd, user_category));
			}
			return list;
		}
	}
	
	// 찜 목록에서 삭제
	public int delete(int seq_basket) throws Exception{
		String sql="";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, seq_basket);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	// 찜 목록 정렬(등록순)
	// order by ? 로 해서 정렬방식도 서버에서 넘겨받게 할지... 고민해보기
	public ArrayList<BasketDTO> selectByAdd(String user_id) throws Exception{
		String sql = "select * from tbl_basket where user_id = ? order by seq_basket";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<BasketDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_basket = rs.getInt("seq_basket");
				String movieCd = rs.getString("movieCd");
				String user_category = rs.getString("user_category");
				
				list.add(new BasketDTO(seq_basket, user_id, movieCd, user_category));
			}
			return list;
		}
	}
	
	// 찜 목록 정렬(이름순)
	// 이것도 테이블에서 영화명 받아와야...하니까 나중에 말하기 ㅠ
	public ArrayList<BasketDTO> selectByName(String user_id) throws Exception{
		String sql = "select * from tbl_basket where user_id = ? order by movieNm";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<BasketDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_basket = rs.getInt("seq_basket");
				String movieCd = rs.getString("movieCd");
				String user_category = rs.getString("user_category");
				
				list.add(new BasketDTO(seq_basket, user_id, movieCd, user_category));
			}
			return list;
		}
	}
	
	// 찜 목록 정렬(최신순)
	public ArrayList<BasketDTO> selectByLatest(String user_id) throws Exception{
		String sql = "select * from tbl_basket where user_id = ? order by prdtYear";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<BasketDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_basket = rs.getInt("seq_basket");
				String movieCd = rs.getString("movieCd");
				String user_category = rs.getString("user_category");
				
				list.add(new BasketDTO(seq_basket, user_id, movieCd, user_category));
			}
			return list;
		}
	}
}
