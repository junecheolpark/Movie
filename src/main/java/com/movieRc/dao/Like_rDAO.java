package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.Like_rDTO;

public class Like_rDAO {

	private BasicDataSource basicDataSource;

	public Like_rDAO() {
		try {
			Context context = new InitialContext();
			Context envContext = (Context) context.lookup("java:comp/env");
			basicDataSource = (BasicDataSource) envContext.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return basicDataSource.getConnection();
	}
	//좋아요 갯수
	public ArrayList<Integer> like_count() throws Exception{
		String sql = "select count(*) as ,seq_review from tbl_like_r where r_like_check = 1 group by seq_review";
		try(Connection con =getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
	

			ResultSet rs = pstmt.executeQuery(sql);
			ArrayList<Integer> like_list = new ArrayList<>(); 
			
			while(rs.next()) {
				int l_count = rs.getInt(1);
				int seq_review = rs.getInt(2);
				like_list.add(seq_review);
			} 
			return like_list;
		}
	
	}

	//싫어요 갯수
			public ArrayList<Like_rDTO> hate_count() throws Exception{
				String sql = "select count(*)as l_count ,seq_review from tbl_like_r where r_like_check = 2 group by seq_review";
				List<HashMap<String, String>> l_hate = new ArrayList<HashMap<String, String>>();
				try(Connection con =getConnection();
						PreparedStatement pstmt = con.prepareStatement(sql)){
					
					ResultSet rs = pstmt.executeQuery();
					
					ArrayList<Like_rDTO> hate_list = new ArrayList<>(); 
					while(rs.next()) {
						int l_count = rs.getInt("l_count");
						int seq_review = rs.getInt("seq_review");
						hate_list.add(new Like_rDTO(0,0,null,seq_review, null, l_count));
					} 
					return hate_list;
				}
				
			}
	
	
	//중복방지를 위한 시퀀스 번호와 아이디 체크, r_like_check 조회
	public int select_seq_check (String user_id, int seq_review) throws Exception{
		String sql = "select seq_like from tbl_like_r where user_id = ? and seq_review = ?";
		
		try(Connection con =getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_review);

			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int seq_like = rs.getInt("seq_like");
				return seq_like;
			}
			return 0;
		}
	}
	// 버튼 클릭시 업데이트
	public int like_update (int r_like_check, String user_id, int seq_review) throws Exception{
		String sql = "update tbl_like_r set r_like_check = ? where user_id = ? and seq_review = ?";
		
		try(Connection con =getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, r_like_check);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, seq_review);

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
//	라이크 테이블에 insert
	public int like_insert (Like_rDTO dto) throws Exception{
		String sql = "insert into tbl_like_r values(seq_like.nextval, ?, ?, ?,?,?)";
		
		try(Connection con =getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, dto.getR_like_check());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setInt(3, dto.getSeq_review());
			pstmt.setString(4, dto.getUser_category());
			pstmt.setInt(5, dto.getL_count());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	
	
	
	
	
}
