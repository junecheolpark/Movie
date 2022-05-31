package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

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

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}
	public int write(ReviewDTO dto) throws Exception{
		String sql = "insert into tbl_review values(seq_review.nextval, 'movieCd','id','category','nickname',?,sysdate)";
		
		try(Connection con =getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			
	
		
			pstmt.setString(1, dto.getR_content());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	public HashMap<String, Integer> getAvgPointHashMap (HashMap<String, Integer> hashMap, String movieCd) throws Exception {
		String sql = "select a.*, nvl(b.avg, 0)" +
				"      from tbl_movie a," +
				"           (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
				" where a.movieCd = b.movieCd(+)" +
				"   and a.movieCd = ?";
		try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			preparedStatement.setString(1, movieCd);
			ResultSet resultSet = preparedStatement.executeQuery();

			if(resultSet.next()){
				hashMap.put(movieCd, resultSet.getInt(8));
			}
			return hashMap;
		}
	}

	public int getAvgPoint(String movieCd) throws Exception {
		String sql = "select a.*, nvl(b.avg, 0)" +
				"      from tbl_movie a," +
				"           (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
				" where a.movieCd = b.movieCd(+)" +
				"   and a.movieCd = ?";
		try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			preparedStatement.setString(1, movieCd);
			ResultSet resultSet = preparedStatement.executeQuery();

			if(resultSet.next()){
				return resultSet.getInt(8);
			} return 0;
		}
	}
	
	
	
	
	
}
