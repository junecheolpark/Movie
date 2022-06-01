package com.movieRc.util;

import java.sql.Connection;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.commons.dbcp2.BasicDataSource;

public class Pagination {
    private int totalCnt;
    private int totalPage;
    private int curPage;
    private int recordPerPage;
    private int naviCntPerPage;
    private int naviStart;
    private int naviEnd;
    private int postStart;
    private int postEnd;
    private boolean prevBtn;
    private boolean nextBtn;


    private BasicDataSource basicDataSource;

    public Pagination() {
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

    // 게시판쪽애서도 활용할 수 있을 거 같아서 별도의 클래스로 만들었어요
    public HashMap<String, Object> getPageNavi(int totalCnt,  int recordPerPage, int naviCntPerPage, int curPage) throws Exception {
        // 총 페이지 수
        totalPage = totalCnt / recordPerPage + (totalPage % recordPerPage == 0 ? 0 : 1);
        // 페이징 처리
        if (curPage < 1) curPage = 1;
        else if (curPage > totalPage) curPage = totalPage;

        // 네비 시작점, 끝점
        naviStart = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
        naviEnd = naviStart + naviCntPerPage - 1;

        // prev, next 버튼
        prevBtn = (naviStart != 1);
        nextBtn = (naviEnd != totalPage);

        // 게시글 시작점, 끝점
        postStart = (curPage - 1) * recordPerPage + 1;
        postEnd = recordPerPage * curPage;

        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("totalCnt", totalCnt);
        hashMap.put("naviStart", naviStart);
        hashMap.put("naviEnd", naviEnd);
        hashMap.put("prevBtn", prevBtn);
        hashMap.put("nextBtn", nextBtn);
        hashMap.put("postStart", postStart);
        hashMap.put("postEnd", postEnd);

        return hashMap;

    }
}
