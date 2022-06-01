package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.MovieDTO;


public class MovieDAO {
    private BasicDataSource basicDataSource;

    public MovieDAO() {
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

   
    public int CountAll() throws Exception{
    	String sql = "select count(*) from tbl_movie";
    	try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){
    		ResultSet resultset = preparedStatement.executeQuery();
    		if(resultset.next()) {
    			return resultset.getInt(1);
    		} else return 0;
    	}
    }

    public ArrayList<MovieDTO> selectAll (int start, int end) throws Exception {
        String sql = "select * from" +
                "             (select rownum as num, a.* from" +
                "                                            (select * from tbl_movie order by 1 desc) a)" +
                "where num between ? and ?";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){

            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()){
                String movieCd = resultSet.getString(2);
                String movieNm = resultSet.getString(3);
                String movieNmen = resultSet.getString(4);
                String prdtYear = resultSet.getString(5);
                String nationAlt = resultSet.getString(6);
                String genreAlt = resultSet.getString(7);
                String directors = resultSet.getString(8);

                arrayList.add(new MovieDTO(movieCd,movieNm,movieNmen,prdtYear,nationAlt,genreAlt,directors));
            } return arrayList;
        }
    }

    public ArrayList<MovieDTO> searchByGenre(String genreAlt, int start, int end) throws Exception{
        String sql = "select*" +
                "from (select a.*, rownum as num" +
                "      from (select * from tbl_movie where genreAlt like ? order by 1 desc) a)" +
                "where num between ? and ?;";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, "%"+genreAlt+"%");
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, start);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()){
                String movieCd = resultSet.getString(2);
                String movieNm = resultSet.getString(3);
                String movieNmen = resultSet.getString(4);
                String prdtYear = resultSet.getString(5);
                String nationAlt = resultSet.getString(6);
                String genreAlt1 = resultSet.getString(7);
                String directors = resultSet.getString(8);

                arrayList.add(new MovieDTO(movieCd,movieNm,movieNmen,prdtYear,nationAlt,genreAlt1,directors));
            } return arrayList;
        }
    }
    public ArrayList<MovieDTO> searchByGenreEtc(String genreAlt, int start, int end) throws Exception{
        String sql = "select*" +
                "from (select a.*, rownum as num" +
                "      from (select * from tbl_movie where genreAlt like ? order by 1 desc) a)" +
                "where num between ? and ?;";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, "%"+genreAlt+"%");
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, start);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()){
                String movieCd = resultSet.getString(2);
                String movieNm = resultSet.getString(3);
                String movieNmen = resultSet.getString(4);
                String prdtYear = resultSet.getString(5);
                String nationAlt = resultSet.getString(6);
                String genreAlt1 = resultSet.getString(7);
                String directors = resultSet.getString(8);

                arrayList.add(new MovieDTO(movieCd,movieNm,movieNmen,prdtYear,nationAlt,genreAlt1,directors));
            } return arrayList;
        }
    }

}
