package com.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.review.dto.ReviewDTO;



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
	
	public int write(String r_content) throws Exception{
		String sql = "insert into tbl_review values(seq_review.nextval, 'movieCd','id','category','nickname',?,sysdate)";
		
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
		
			pstmt.setString(1, r_content);

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	
	
	
	
}
