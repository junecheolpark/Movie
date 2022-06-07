package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.ReportDTO;

public class ReportDAO {
private BasicDataSource bds;
	
	public ReportDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	
	// 신고 기록 조회
	public ArrayList<ReportDTO> selectAll(int start, int end) throws Exception{
		String sql = "select * from (select tbl_report.*, row_number() over(order by seq_report desc)"
				+ " as num from tbl_report)"
				+ " where num between ? and ?";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ReportDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq_report = rs.getInt("seq_report");
				String category_check = rs.getString("category_check");
				String rp_content = rs.getString("rp_content");
				String user_id = rs.getString("user_id");
				int seq_review = rs.getInt("seq_review");
				int seq_comment = rs.getInt("seq_comment");
				int seq_post = rs.getInt("seq_post");
				String user_category = rs.getString("user_category");
				
				list.add(new ReportDTO(seq_report, category_check, rp_content, user_id, seq_review, seq_comment, seq_post, user_category));
			}
			return list;
		}
	}
	
	// 페이징
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception{
		String sql = "select count(*) as totalCnt from tbl_report";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			int totalCnt = rs.getInt("totalCnt"); // 전체 개수
			int recordCntPerPage = 10; // 한 페이지 글 몇 개
			int naviCntPerPage = 5; // navi 몇 개
			
			int pageTotalCnt = 0; // 페이지 몇 개
			if(totalCnt % recordCntPerPage > 0) { // 나머지가 생김(10의 배수가 아님x)
				pageTotalCnt = totalCnt / recordCntPerPage + 1;				
			}else {
				pageTotalCnt = totalCnt / recordCntPerPage;
			}
			
			if(curPage < 1) {
				curPage = 1;
			}else if(curPage > pageTotalCnt) {
				curPage = pageTotalCnt;
			}
			
			int startNavi = ((curPage-1) / naviCntPerPage) * naviCntPerPage + 1;
			int endNavi = startNavi + naviCntPerPage - 1;
			if(pageTotalCnt < endNavi) {
				endNavi = pageTotalCnt;
			}
			
			boolean needPrev = true;
			boolean needNext = true;
			if(startNavi == 1) {
				needPrev = false;
			}
			if(endNavi == pageTotalCnt) {
				needNext = false;
			}
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("curPage", curPage);
			map.put("startNavi", startNavi);
			map.put("endNavi", endNavi);
			map.put("needPrev", needPrev);
			map.put("needNext", needNext);
			
			return map;
		}
	}
}
