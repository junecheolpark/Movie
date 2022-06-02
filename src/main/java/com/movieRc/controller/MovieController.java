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
        System.out.println("요청 uri : " + uri);

        if (uri.equals("/listLookup.movie")) {
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            try {
                int totalCount = movieDAO.CountAll();
                HashMap<String, Object> hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                int start = (int) hashMap.get("postStart");
                int end = (int) hashMap.get("postEnd");
                ArrayList<MovieDTO> arrayList = movieDAO.selectAll(start, end);
                double avg = 0;
                int count = 0;
                HashMap<String, HashMap> hashMap1 = new HashMap<>();
                HashMap<String, Object> points;

                for (int i = 0; i < arrayList.size(); i++) {
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

                double avg = 0;
                int count = 0;
                HashMap<String, HashMap> hashMap1 = new HashMap<>();
                HashMap<String, Object> points;

                for (int i = 0; i < arrayList.size(); i++) {
                    points = new HashMap<>();
                    avg = reviewDAO.getAvgPoint(arrayList.get(i).getMovieCd());
                    count = reviewDAO.countByMovieCd(arrayList.get(i).getMovieCd());
                    points.put("avg", avg);
                    points.put("count", count);
                    hashMap1.put(arrayList.get(i).getMovieCd(), points);
                }

                request.setAttribute("totalCount", totalCount);
                request.setAttribute("s_type", s_type);
                request.setAttribute("val", val);
                request.setAttribute("hashMap", hashMap);
                request.setAttribute("points", hashMap1);
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

            try {
                if (s_type.equals("")) {
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

                double avg = 0;
                int count = 0;
                HashMap<String, HashMap> hashMap1 = new HashMap<>();
                HashMap<String, Object> points;

                for (int i = 0; i < arrayList.size(); i++) {
                    points = new HashMap<>();
                    avg = reviewDAO.getAvgPoint(arrayList.get(i).getMovieCd());
                    count = reviewDAO.countByMovieCd(arrayList.get(i).getMovieCd());
                    points.put("avg", avg);
                    points.put("count", count);
                    hashMap1.put(arrayList.get(i).getMovieCd(), points);
                }

                request.setAttribute("totalCount", totalCount);
                request.setAttribute("s_type", s_type);
                request.setAttribute("val", val);
                request.setAttribute("hashMap", hashMap);
                request.setAttribute("points", hashMap1);
                request.setAttribute("arrayList", arrayList);
                request.setAttribute("orderBy", "recent");
                request.getRequestDispatcher("/movie/listLookup.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (uri.equals("/orderBy.reviewCount.movie")) {

            String s_type = request.getParameter("s_type");
            String val = request.getParameter("val");
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            HashMap<String, Object> hashMap = new HashMap<>();
            int totalCount = 0;

            try {
                if (s_type.equals("")) {
                    totalCount = movieDAO.CountAll();
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");
                    arrayList = movieDAO.selectAll_OrderByReviewCount(start, end);

                } else if (s_type.equals("genreAlt")) {
                    if (val.equals("기타")) {
                        totalCount = movieDAO.countAllEtcGenre();
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.selectEtcGenre_OrderByReviewCount(start, end);

                    } else {
                        totalCount = movieDAO.countAllByGenre(val);
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.selectByGenre_OrderByReviewCount(val, start, end);
                    }
                } else if (s_type.equals("movieNm")) {
                    totalCount = movieDAO.countAllbyMovieNm(val);
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");
                    arrayList = movieDAO.selectByMovieNm_OrderByReviewCount(val, start, end);
                }

                double avg = 0;
                int count = 0;
                HashMap<String, HashMap> hashMap1 = new HashMap<>();
                HashMap<String, Object> points;

                for (int i = 0; i < arrayList.size(); i++) {
                    points = new HashMap<>();
                    avg = reviewDAO.getAvgPoint(arrayList.get(i).getMovieCd());
                    count = reviewDAO.countByMovieCd(arrayList.get(i).getMovieCd());
                    points.put("avg", avg);
                    points.put("count", count);
                    hashMap1.put(arrayList.get(i).getMovieCd(), points);
                }

                request.setAttribute("totalCount", totalCount);
                request.setAttribute("s_type", s_type);
                request.setAttribute("val", val);
                request.setAttribute("hashMap", hashMap);
                request.setAttribute("points", hashMap1);
                request.setAttribute("arrayList", arrayList);
                request.setAttribute("orderBy", "reviewCount");
                request.getRequestDispatcher("/movie/listLookup.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (uri.equals("/orderBy.avgPoint.movie")) {

            String s_type = request.getParameter("s_type");
            String val = request.getParameter("val");
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            HashMap<String, Object> hashMap = new HashMap<>();
            int totalCount = 0;

            try {
                if (s_type.equals("")) {
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
                        arrayList = movieDAO.selectEtcGenre_OrderByAvgPoint(start, end);

                    } else {
                        totalCount = movieDAO.countAllByGenre(val);
                        hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = movieDAO.selectByGenre_OrderByAvgPoint(val, start, end);
                    }
                } else if (s_type.equals("movieNm")) {
                    totalCount = movieDAO.countAllbyMovieNm(val);
                    hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
                    int start = (int) hashMap.get("postStart");
                    int end = (int) hashMap.get("postEnd");
                    arrayList = movieDAO.selectByMovieNm_OrderByAvgPoint(val, start, end);
                }

                double avg = 0;
                int count = 0;
                HashMap<String, HashMap> hashMap1 = new HashMap<>();
                HashMap<String, Object> points;

                for (int i = 0; i < arrayList.size(); i++) {
                    points = new HashMap<>();
                    avg = reviewDAO.getAvgPoint(arrayList.get(i).getMovieCd());
                    count = reviewDAO.countByMovieCd(arrayList.get(i).getMovieCd());
                    points.put("avg", avg);
                    points.put("count", count);
                    hashMap1.put(arrayList.get(i).getMovieCd(), points);
                }

                request.setAttribute("totalCount", totalCount);
                request.setAttribute("s_type", s_type);
                request.setAttribute("val", val);
                request.setAttribute("hashMap", hashMap);
                request.setAttribute("points", hashMap1);
                request.setAttribute("arrayList", arrayList);
                request.setAttribute("orderBy", "avgPoint");
                request.getRequestDispatcher("/movie/listLookup.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
//        } else if (uri.equals("/findAvgPoint.movie")){
//            String movieCd = request.getParameter("movieCd");
//            try{
//                int avg = reviewDAO.getAvgPoint(movieCd);
//                String rs = String.valueOf(avg);
//                response.getWriter().append(rs);
//
//            } catch (Exception e){
//                e.printStackTrace();
//            }
//        } else if (uri.equals("/getCount.movie")){
//            String s_type = request.getParameter("s_type");
//            String val = request.getParameter("val");
//            Integer curPage = Integer.valueOf(request.getParameter("curPage"));
//            HashMap<String, Integer> hashMap = new HashMap<>();
//            int totalCnt = 0;
//            try{
//                if(s_type.equals("")){
//                    totalCnt = movieDAO.CountAll();
//                } else if(s_type.equals("genreAlt")){
//                    if(val.equals("기타")){
//                        totalCnt = movieDAO.countAllEtcGenre();
//                    } else {
//                        totalCnt = movieDAO.countAllByGenre(val);
//                    }
//                } else if (s_type.equals("movieNm")){
//                    totalCnt = movieDAO.countAllbyMovieNm(val);
//                }
//
//                hashMap.put("num", totalCnt);
//                hashMap.put("curPage", curPage);
//                Gson gson = new Gson();
//                String rs = gson.toJson(hashMap);
//                response.getWriter().append(rs);
//
//            } catch (Exception e){
//                e.printStackTrace();
//            }
        }
    }
}
