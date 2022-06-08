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

import com.movieRc.dto.PostCommentDTO;
import com.movieRc.dto.ReportDTO;

public class PostCommentDAO {
	private BasicDataSource bds;

	public PostCommentDAO() {
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

	
	public int reportInsert(ReportDTO dto) throws Exception{//신고제목넣어야함
		String sql = "insert into tbl_report values(seq_report.nextval,?,?,?,?,?,?,?)";
		
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				
				pstmt.setString(1, dto.getCategory_check());
				pstmt.setString(2, dto.getRp_content());
				pstmt.setString(3, dto.getUser_id());
				pstmt.setInt(4, dto.getSeq_review());
				pstmt.setInt(5, dto.getSeq_comment());
				pstmt.setInt(6,dto.getSeq_post());
				pstmt.setString(7, dto.getUser_category());
				
				int rs = pstmt.executeUpdate();
				return rs;
			}
		}
		
	public int modify(PostCommentDTO dto) throws Exception{
		String sql = "update tbl_post_comment set comment_content=? where seq_post_comment = ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getComment_content());
			pstmt.setInt(2, dto.getSeq_post_comment());
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int delete(int seq_comment) throws Exception{
		String sql = "delete from tbl_post_comment where seq_post_comment = ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, seq_comment);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int insert(PostCommentDTO dto) throws Exception{
		String sql = "insert into tbl_post_comment values(seq_post_comment.nextval,?,sysdate,?,?,?,?)";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getUser_nickname());
			pstmt.setString(2, dto.getComment_content());
			pstmt.setString(3,dto.getUser_id() );
			pstmt.setInt(4,dto.getSeq_post() );
			pstmt.setString(5,dto.getUser_category());
			
			int rs = pstmt.executeUpdate();
			return rs;			
		}
	}
	
	public ArrayList<PostCommentDTO> selectAll(int seq_post1) throws Exception{
		String sql = "select * from tbl_post_comment where seq_post = ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, seq_post1);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<PostCommentDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_post_comment = rs.getInt("seq_post_comment");
				String user_nickname = rs.getString("user_nickname");
				String comment_date = getStringDate(rs.getDate("comment_date"));
				String comment_content = rs.getString("comment_content");
				String user_id = rs.getString("user_id");
				int seq_post = rs.getInt("seq_post");
				String user_category= rs.getString("user_category");
				list.add(new PostCommentDTO(seq_post_comment,user_nickname, comment_date,  comment_content, user_id,seq_post,user_category));
			}
			return list;			
		}
	}
	
	public String getStringDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return sdf.format(date);
	}
}
