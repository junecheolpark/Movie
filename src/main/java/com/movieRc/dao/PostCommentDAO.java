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
//좋아요싫어요 DAO
	public int curPLikeValue(String user_id, int seq_comment) throws Exception{
		String sql = "select c_like_check from tbl_like_c where user_id=? AND seq_comment=? ";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_comment);
			ResultSet rs = pstmt.executeQuery();

			int rsValue=-1;
			if(rs.next()) {
				rsValue=rs.getInt("c_like_check");
			}


			return rsValue;
		}
	}
	//좋아요 삽입
	public int insertPostLike (String user_id, int seq_comment, String user_category) throws Exception {
		String sql = "insert into tbl_like_c values(seq_like_c.nextval,1,?,?,?)";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_comment);
			pstmt.setString(3, user_category);
			int rs = pstmt.executeUpdate();

			return rs;


		}
	}

	
	// 선택안함 =0,좋아요=1,싫어요=2
	//좋아요 업데이트
	public int updatePostLike(String user_id, int seq_comment, String user_category) throws Exception {
		String sql = "update tbl_like_c set c_like_check=1 where user_id=? AND seq_comment=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_comment);
			
				pstmt.setString(1, user_id);
				pstmt.setInt(2, seq_comment);
				int rs = pstmt.executeUpdate();
				return rs;
			
		}
	}
//싫어요 삽입
	public int insertPostNotLike(String user_id, int seq_comment, String user_category) throws Exception {
		String sql = "insert into tbl_like_c values(seq_like_c.nextval,2,?,?,?)";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			
				pstmt.setString(1, user_id);
				pstmt.setInt(2, seq_comment);
				pstmt.setString(3, user_category);
				int rs = pstmt.executeUpdate();

				return rs;

			}
		}
	//p_like_check =1좋아요,2싫어요 개수
	public int pLikeCount(int seq_comment,int p_like_check) throws Exception { 
		String sql = "select count(*) from tbl_like_c where seq_comment=? and c_like_check=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			
				pstmt.setInt(1, seq_comment);
				pstmt.setInt(2, p_like_check);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int result =rs.getInt(1);
				return result;
			
		}
	}
	
	// 선택안함 =0,좋아요=1,싫어요=2
	////싫어요 업데이트
	public int updatePostNotLike(String user_id, int seq_comment, String user_category) throws Exception {
		String sql = "update tbl_like_c set c_like_check=2 where user_id=? AND seq_comment=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_comment);
			
				pstmt.setString(1, user_id);
				pstmt.setInt(2, seq_comment);
				int rs = pstmt.executeUpdate();
				return rs;
			
		}
	}
	//취소 업데이트
	public int updatePostCancleLike(String user_id, int seq_comment, String user_category) throws Exception {
		String sql = "update tbl_like_c set c_like_check=0 where user_id=? AND seq_comment=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_comment);
			
				pstmt.setString(1, user_id);
				pstmt.setInt(2, seq_comment);
				int rs = pstmt.executeUpdate();
				int c_like_check=0;
				return c_like_check;
			
		}
	}
	
//좋아요싫어요 끝
	
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
		String sql = "update tbl_post_comment set comment_content=? where seq_comment = ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getComment_content());
			pstmt.setInt(2, dto.getseq_comment());
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int delete(int seq_comment) throws Exception{
		String sql = "delete from tbl_post_comment where seq_comment = ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, seq_comment);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	public int insert(PostCommentDTO dto) throws Exception{
		String sql = "insert into tbl_post_comment values(seq_comment.nextval,?,sysdate,?,?,?,?)";
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

	public int countComment (int seq_post) throws Exception{
		String sql = "select count(*) from tbl_post_comment where seq_post = ?";
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setInt(1, seq_post);
			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				return resultset.getInt(1);
			} else return 0;
		}
	}
	
	public ArrayList<PostCommentDTO> selectAll(int seq_post1) throws Exception{
		String sql = "select * from tbl_post_comment where seq_post = ? order by seq_comment DESC";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, seq_post1);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<PostCommentDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_comment = rs.getInt("seq_comment");
				String user_nickname = rs.getString("user_nickname");
				String comment_date = getStringDate(rs.getDate("comment_date"));
				String comment_content = rs.getString("comment_content");
				String user_id = rs.getString("user_id");
				int seq_post = rs.getInt("seq_post");
				String user_category= rs.getString("user_category");
				list.add(new PostCommentDTO(seq_comment,user_nickname, comment_date,  comment_content, user_id,seq_post,user_category));
			}
			return list;			
		}
	}
	
	public String getStringDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return sdf.format(date);
	}
}