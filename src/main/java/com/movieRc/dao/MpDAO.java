package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;

import oracle.jdbc.proxy.annotation.Pre;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.MpDTO;

public class MpDAO {
	private BasicDataSource bds;

	public MpDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}

	public String select(String user_id) throws Exception{
		String sql = "select * from tbl_mp where user_id = ?";

		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				String sys_name = rs.getString("sys_name");
				return sys_name;
			}
			return null;
		}
	}

	public int insertMp(MpDTO dto) throws Exception{
		String sql = "insert into tbl_mp values(?, ?)";

		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getSys_name());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	public int updateMp(String user_id, String sys_name) throws Exception {
		String sql = "update tbl_mp set sys_name = ? where user_id = ?";

		try (Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, sys_name);
			pstmt.setString(2, user_id);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	// 프로필 관련 삭제
	public int deleteMp(String user_id) throws Exception{
		String sql = "delete from tbl_mp where user_id=?";

		try (Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id);
			int rs = pstmt.executeUpdate();
			return rs;
		}

	}

	public int exist(String id) throws Exception {
		String sql = "select count(*) from tbl_mp where user_id = ?";
		try (Connection connection = bds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){

			preparedStatement.setString(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			resultSet.next();

			return resultSet.getInt(1);
		}
	}
}
