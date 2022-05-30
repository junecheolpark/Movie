package com.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.review.dto.MovieDTO;



public class MovieDAO {
	private BasicDataSource bds;

	public MovieDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int write(MovieDTO dto) throws Exception{
		String sql = "insert into tbl_bovie values(?,?,?,?,?,?)";

		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			
			pstmt.setString(1, dto.getMovieCd());
			pstmt.setString(2, dto.getMovieNm());
			pstmt.setString(3, dto.getMovieNmEn());
			pstmt.setString(4, dto.getPrdtYear());
			pstmt.setString(5, dto.getNationAlt());
			pstmt.setString(6, dto.getGenreAlt());
			pstmt.setString(7, dto.getDirectors());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	
	
	
	
}
