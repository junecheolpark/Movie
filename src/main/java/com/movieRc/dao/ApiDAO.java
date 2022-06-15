package com.movieRc.dao;

import com.movieRc.dto.MovieDTO;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ApiDAO {
    private BasicDataSource basicDataSource;

    public ApiDAO() {
        try{
            Context context = new InitialContext();
            Context envContext = (Context) context.lookup("java:comp/env");
            basicDataSource = (BasicDataSource) envContext.lookup("jdbc/bds");
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public Connection getConnection() throws Exception {
        return basicDataSource.getConnection();
    }

    public int insert(MovieDTO movieDTO) throws Exception {
        String sql = "insert into tbl_movie values(?,?,?,?,?,?,?)";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, movieDTO.getMovieCd());
            preparedStatement.setString(2, movieDTO.getMovieNm());
            preparedStatement.setString(3, movieDTO.getMovieNmEn());
            preparedStatement.setString(4, movieDTO.getPrdtYear());
            preparedStatement.setString(5, movieDTO.getNationAlt());
            preparedStatement.setString(6, movieDTO.getGenreAlt());
            preparedStatement.setString(7, movieDTO.getDirectors());

            return preparedStatement.executeUpdate();
        }
    }

    public int update (String MovieCd, String MovieNm) throws Exception{
		String sql = "update tbl_movie set movieNm = ? where MovieCd = ?";
		
		try(Connection con =getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(2, MovieCd);
			pstmt.setString(1, MovieNm);

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
    
    public int deleteAll() throws Exception {
        String sql = "delete from tbl_movie";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            return preparedStatement.executeUpdate();
        }
    }

}
