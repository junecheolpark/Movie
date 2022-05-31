package com.movieRc.controller;

import com.google.gson.Gson;
import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.MovieDTO;
import com.movieRc.util.Pagination;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.movie")
public class MovieController extends HttpServlet {

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
        System.out.println("요청 uri : " +uri);

        if (uri.equals("/listLookup.movie")) {
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            try {
                int totalCount = movieDAO.CountAll();
                HashMap<String, Object> hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                int start = (int) hashMap.get("postStart");
                int end = (int) hashMap.get("postEnd");
                ArrayList<MovieDTO> arrayList = movieDAO.selectAll(start, end);
                HashMap<String, Integer> avgPoints = new HashMap<>();

                for(int i = 0; i <arrayList.size(); i++){
                     avgPoints = reviewDAO.getAvgPointHashMap(avgPoints, arrayList.get(i).getMovieCd());
                }
                request.setAttribute("totalCount", totalCount);
                request.setAttribute("hashMap", hashMap);
                request.setAttribute("arrayList", arrayList);
                request.setAttribute("avgPoints", avgPoints);
                request.getRequestDispatcher("/movie/listLookup.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (uri.equals("/search.movie")) {
            String s_type = request.getParameter("s_type");
            String val = request.getParameter("val");
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            HashMap<String, Object> hashMap = new HashMap<>();
            int totalCount = 0;

            try {
                if (s_type.equals("genreAlt")) {
                    if (val.equals("기타")) {
                        totalCount = movieDAO.countAllEtcGenre();
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.searchByGenreEtc(start, end);
                    } else {
                        totalCount = movieDAO.countAllByGenre(val);
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.searchByGenre(val, start, end);
                    }
                } else if (s_type.equals("movieNm")) {
                    totalCount = movieDAO.countAllbyMovieNm(val);
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");

                    arrayList = movieDAO.selectByMovieNm(val, start, end);
                }

                HashMap<String, Integer> avgPoints = new HashMap<>();

                for(int i = 0; i <arrayList.size(); i++){
                    avgPoints = reviewDAO.getAvgPointHashMap(avgPoints, arrayList.get(i).getMovieCd());
                }

                request.setAttribute("totalCount", totalCount);
                request.setAttribute("s_type", s_type);
                request.setAttribute("val", val);
                request.setAttribute("hashMap", hashMap);
                request.setAttribute("avgPoints", avgPoints);
                request.setAttribute("arrayList", arrayList);
                request.getRequestDispatcher("/movie/listLookup.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (uri.equals("/orderBy.recent.movie")) {

            String s_type = request.getParameter("s_type");
            String val = request.getParameter("val");
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            HashMap<String, Object> hashMap = new HashMap<>();
            int totalCount = 0;

            try{
                if(s_type.equals("")){
                    totalCount = movieDAO.CountAll();
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");
                    arrayList = movieDAO.selectAll(start, end);

                } else if (s_type.equals("genreAlt")) {
                    if (val.equals("기타")) {
                        totalCount = movieDAO.countAllEtcGenre();
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.searchByGenreEtc(start, end);
                    } else {
                        totalCount = movieDAO.countAllByGenre(val);
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.searchByGenre(val, start, end);
                    }
                } else if (s_type.equals("movieNm")) {
                    totalCount = movieDAO.countAllbyMovieNm(val);
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");

                    arrayList = movieDAO.selectByMovieNm(val, start, end);
                }

                Gson gson = new Gson();
                String rs = gson.toJson(arrayList);
                response.getWriter().append(rs);

            } catch (Exception e){
                e.printStackTrace();
            }
        } else if (uri.equals("/orderBy.reviewCount.movie")){

            String s_type = request.getParameter("s_type");
            String val = request.getParameter("val");
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            HashMap<String, Object> hashMap = new HashMap<>();
            int totalCount = 0;

            try{
                if(s_type.equals("")){
                    totalCount = movieDAO.CountAll();
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");
                    arrayList = movieDAO.selectAll_OrderByReviewCount(start,end);

                } else if (s_type.equals("genreAlt")) {
                    if (val.equals("기타")) {
                        totalCount = movieDAO.countAllEtcGenre();
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.selectEtcGenre_OrderByReviewCount(start,end);

                    } else {
                        totalCount = movieDAO.countAllByGenre(val);
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.selectByGenre_OrderByReviewCount(val,start,end);
                    }
                } else if (s_type.equals("movieNm")) {
                    totalCount = movieDAO.countAllbyMovieNm(val);
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");
                    arrayList = movieDAO.selectByMovieNm_OrderByReviewCount(val,start,end);
                }

                Gson gson = new Gson();
                String rs = gson.toJson(arrayList);
                response.getWriter().append(rs);

            } catch (Exception e){
                e.printStackTrace();
            }

        } else if (uri.equals("/orderBy.avgPoint.movie")){

            String s_type = request.getParameter("s_type");
            String val = request.getParameter("val");
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            HashMap<String, Object> hashMap = new HashMap<>();
            int totalCount = 0;

            try{
                if(s_type.equals("")){
                    totalCount = movieDAO.CountAll();
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");
                    arrayList = movieDAO.selectAll_OrderByAvgPoint(start, end);

                } else if (s_type.equals("genreAlt")) {
                    if (val.equals("기타")) {
                        totalCount = movieDAO.countAllEtcGenre();
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.selectEtcGenre_OrderByAvgPoint(start,end);

                    } else {
                        totalCount = movieDAO.countAllByGenre(val);
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.selectByGenre_OrderByAvgPoint(val,start,end);
                    }
                } else if (s_type.equals("movieNm")) {
                    totalCount = movieDAO.countAllbyMovieNm(val);
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");
                    arrayList = movieDAO.selectByMovieNm_OrderByAvgPoint(val,start,end);
                }

                Gson gson = new Gson();
                String rs = gson.toJson(arrayList);
                response.getWriter().append(rs);

            } catch (Exception e){
                e.printStackTrace();
            }
        } else if (uri.equals("/findAvgPoint.movie")){
            String movieCd = request.getParameter("movieCd");
            try{
                int avg = reviewDAO.getAvgPoint(movieCd);
                String rs = String.valueOf(avg);
                response.getWriter().append(rs);

            } catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}
