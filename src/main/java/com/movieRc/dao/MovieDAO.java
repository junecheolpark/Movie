package com.movieRc.dao;

import com.movieRc.dto.MovieDTO;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


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

   
//    public int selectCount() throws Exception{
//    	String sql = "select count(*) from tbl_movie";
//    	try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.preparedStatement(sql)){
//    		ResultSet resultset = preparedStatement.getResultSet();
//    		if(resultset.next()) {
//    			return resultset.getInt(1);
//    		}
//    	}
//    }
    
    

}
