package com.movieRc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.ReviewDTO;



public class ReviewDAO {
	private BasicDataSource bds;

	public ReviewDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//영화번호를 통한 tbl_review 조회
	public ArrayList<ReviewDTO> selectAll(String movieCd) throws Exception{
		String sql = "select * from tbl_review where movieCd = ? order by 1 desc";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, movieCd);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<ReviewDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_review = rs.getInt("seq_review");
				String user_nickname = rs.getString("user_nickname");
				String r_content = rs.getString("r_content");
				String r_date= getStringDate(rs.getDate("r_date"));
				int r_grade= rs.getInt("r_grade");
				String user_id = rs.getString("user_id");
				String user_category = rs.getString("user_category");
				list.add(new ReviewDTO(seq_review, user_nickname, r_content, r_date,  r_grade, movieCd, user_id, user_category));
			}
			return list;			
		}
	}
	
	
	//리뷰작성
	public int write(ReviewDTO dto) throws Exception{
		String sql = "insert into tbl_review values(seq_review.nextval, ?,?,sysdate,?,?,?,?)";
		
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1, dto.getUser_nickname());
			pstmt.setString(2, dto.getR_content());
			pstmt.setInt(3, dto.getR_grade());
			pstmt.setString(4, dto.getMovieCd());
			pstmt.setString(5, dto.getUser_id());
			pstmt.setString(6, dto.getUser_category());
			

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	//수정
	public int modify(String r_content, int r_grade, int seq_review) throws Exception {
		String sql = "update tbl_review set r_content=?, r_grade=? where seq_review = ?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, r_content);
			pstmt.setInt(2, r_grade);
			pstmt.setInt(3, seq_review);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	//삭제
	public int delete(int seq_review) throws Exception {
		String sql = "delete from tbl_review where seq_review = ?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, seq_review);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	// r_grade 합/ 평점 준사람
	public Double r_grade_average() throws Exception{
		String sql = "select TRUNC((sum(r_grade)/count(*)),2) from tbl_review";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				Double  Average = rs.getDouble(1);
				return Average;
			}
			return 0.0;
		}
	}
	
	// r_grade카운트
	public int r_grade_count() throws Exception{
		String sql = "select count(*) from tbl_review";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
			return 0;
		}
	}
	
	//date 형변환
	public String getStringDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return sdf.format(date);
	}
	
	
	
	
	
}
