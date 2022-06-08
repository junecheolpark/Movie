package com.movieRc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.MovieDTO;
import com.movieRc.util.Pagination;


@WebServlet("/home")


public class HomeController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);

    }

    protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String uri = request.getRequestURI();
        MovieDAO movieDAO = new MovieDAO();
        ReviewDAO reviewDAO = new ReviewDAO();
        Pagination pagination = new Pagination();
        System.out.println("요청 uri : " + uri);
    	
        if (uri.equals("/lookMovie.home")) {// 평점 높은순으로 10개 뽑기
            int curPage = 1;
            try {
                int totalCount = movieDAO.CountAll();
                HashMap<String, Object> hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                int start = 1;
                int end = 10;
                ArrayList<MovieDTO> arrayList = movieDAO.selectAll_OrderByAvgPoint(start, end);
                double avg = 0;
                int count = 0;
                HashMap<String, HashMap> hashMap1 = new HashMap<>();
                HashMap<String, Object> points;

                for (int i = 0; i < 10; i++) {
                    points = new HashMap<>();
                    avg = reviewDAO.getAvgPoint(arrayList.get(i).getMovieCd());
                    count = reviewDAO.countByMovieCd(arrayList.get(i).getMovieCd());
                    points.put("avg", avg);
                    points.put("count", count);
                    hashMap1.put(arrayList.get(i).getMovieCd(), points);
                }
                request.setAttribute("totalCount", totalCount);
                request.setAttribute("hashMap", hashMap);
                request.setAttribute("arrayList", arrayList);
                request.setAttribute("points", hashMap1);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    	
    	
    }

}
