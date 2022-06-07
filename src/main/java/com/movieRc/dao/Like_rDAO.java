package com.movieRc.dao;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
