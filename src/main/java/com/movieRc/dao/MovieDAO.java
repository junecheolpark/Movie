package com.movieRc.dao;

import com.movieRc.dto.MovieDTO;
import oracle.jdbc.proxy.annotation.Pre;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.swing.*;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


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
                "                                            (select * from tbl_movie order by 1 desc) a where rownum <= ?)" +
                "where rownum >= ?;";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){

            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()){
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                String genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd,movieNm,movieNmen,prdtYear,nationAlt,genreAlt,directors));
            } return arrayList;
        }
    }


}
