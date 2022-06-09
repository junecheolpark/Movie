package com.movieRc.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.Like_rDTO;
import com.movieRc.dto.Like_r_countDTO;

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
	
	//그 영화의 좋아요 누른 수
	public int like_allCount(String movieCd) throws Exception{
		String sql = "select sum(r_like_check) from tbl_like_r join tbl_review using(seq_review) where movieCd=? and r_like_check = 1";
		try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1, movieCd);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int m_like_count = rs.getInt(1);
				return m_like_count;
			}
			return 0;
		}
	}
	
	//전체조회
	public ArrayList<Like_rDTO> selectAll() throws Exception {
		String sql = "select*from tbl_like_r order by 4";
		try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();
			ArrayList<Like_rDTO> all_list = new ArrayList<>();
			while (rs.next()) {
				int seq_like = rs.getInt("seq_like");
				int r_like_check= rs.getInt("r_like_check");
				String user_id = rs.getString("user_id");
				int seq_review = rs.getInt("seq_review");
				String user_category = rs.getString("user_category");
				all_list.add(new Like_rDTO(seq_like, r_like_check, user_id, user_category,seq_review));
			}
			return all_list;
		}
	}
	
	
	//좋아요 갯수
	public ArrayList<Like_r_countDTO> like_count() throws Exception{
		String sql = "select count(CASE WHEN r_like_check=1 THEN 0 END)as l_count ,seq_review from tbl_like_r group by seq_review order by 2";
		try(Connection con =getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			ResultSet rs = pstmt.executeQuery(sql);
			ArrayList<Like_r_countDTO> like_list = new ArrayList<>(); 
			
			while(rs.next()) {
				int l_count = rs.getInt(1);
				int seq_review = rs.getInt(2);
				like_list.add(new Like_r_countDTO(l_count, seq_review));
			} 
			return like_list;
		}
	
	}

	//싫어요 갯수
			public ArrayList<Like_r_countDTO> hate_count() throws Exception{
				String sql = "select count(CASE WHEN r_like_check=2 THEN 0 END)as l_count ,seq_review from tbl_like_r group by seq_review order by 2";
				try(Connection con =getConnection();
						PreparedStatement pstmt = con.prepareStatement(sql)){
					
					ResultSet rs = pstmt.executeQuery();
					
					ArrayList<Like_r_countDTO> hate_list = new ArrayList<>(); 
					while(rs.next()) {
						int l_count = rs.getInt("l_count");
						int seq_review = rs.getInt("seq_review");
						hate_list.add(new Like_r_countDTO(l_count, seq_review));
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
		String sql = "insert into tbl_like_r values(seq_like.nextval, ?, ?, ?,?)";
		
		try(Connection con =getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setInt(1, dto.getR_like_check());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getUser_category());
			pstmt.setInt(4, dto.getSeq_review());

			int rs = pstmt.executeUpdate();

			return rs;
		}
	}
    // ----------------------------------------여기까지 준철dao----------------------------------------
	
	
    public int check(String id, String user_category, int seq_review) throws Exception{
        String sql = "select count(*) from tbl_like_r where user_id = ? and user_category = ? and seq_review = ?";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, user_category);
            preparedStatement.setInt(3, seq_review);

            ResultSet resultSet = preparedStatement.executeQuery();

            resultSet.next();

            return resultSet.getInt(1);
        }
    }

    public int insertLike(String id, String user_category, int seq_review) throws Exception{
        String sql = "insert into tbl_like_r values(seq_like.nextval, 1, ?, ?, ?)";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){

            preparedStatement.setString(1,id);
            preparedStatement.setString(2,user_category);
            preparedStatement.setInt(3,seq_review);

            return preparedStatement.executeUpdate();
        }
    }
    public int insertHate(String id, String user_category, int seq_review) throws Exception{
        String sql = "insert into tbl_like_r values(seq_like.nextval, 2, ?, ?, ?)";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){

            preparedStatement.setString(1,id);
            preparedStatement.setString(2,user_category);
            preparedStatement.setInt(3,seq_review);

            return preparedStatement.executeUpdate();
        }
    }

    public int changeToLike(String id, String user_category, int seq_review) throws Exception {
        String sql = "update tbl_like_r set r_like_check = 1 where user_id = ? and user_category = ? and seq_review = ?";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, id);
            preparedStatement.setString(2, user_category);
            preparedStatement.setInt(3, seq_review);

            return preparedStatement.executeUpdate();
        }
    }

    public int changeToHate(String id, String user_category, int seq_review) throws Exception {
        String sql = "update tbl_like_r set r_like_check = 2 where user_id = ? and user_category = ? and seq_review = ?";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, id);
            preparedStatement.setString(2, user_category);
            preparedStatement.setInt(3, seq_review);

            return preparedStatement.executeUpdate();
        }
    }


    
    
    public int getStatus(String id, String user_category, int seq_review) throws Exception {
        String sql = "select r_like_check from tbl_like_r where user_id = ? and user_category = ? and seq_review = ?";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, id);
            preparedStatement.setString(2, user_category);
            preparedStatement.setInt(3, seq_review);

            ResultSet resultSet = preparedStatement.executeQuery();


            if(resultSet.next()){
                return resultSet.getInt(1);
            } else return 0;
        }
    }
    public int countLike(int seq_review) throws Exception {
        String sql = "select count(*) from tbl_like_r where seq_review = ? and r_like_check = 1";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, seq_review);
            ResultSet resultSet = preparedStatement.executeQuery();

            resultSet.next();
            return resultSet.getInt(1);

        }
    }
    public int countHate(int seq_review) throws Exception {
        String sql = "select count(*) from tbl_like_r where seq_review = ? and r_like_check = 2";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, seq_review);
            ResultSet resultSet = preparedStatement.executeQuery();

            resultSet.next();
            return resultSet.getInt(1);

        }
    }

    public int delete(String user_id, String user_category, int seq_review) throws Exception {
        String sql = "delete from tbl_like_r where seq_review =? and user_id =? and user_category=?";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setInt(1, seq_review);
            preparedStatement.setString(2, user_id);
            preparedStatement.setString(3, user_category);

            return preparedStatement.executeUpdate();
        }
    }
}