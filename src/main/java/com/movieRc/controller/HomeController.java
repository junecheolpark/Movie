package com.movieRc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD


import com.movieRc.dao.MemberDAO;
import com.movieRc.dto.MemberDTO;

import com.movieRc.dao.MemberDAO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.ReviewDAO;
=======
import com.movieRc.dao.*;
import com.movieRc.dto.MemberDTO;
>>>>>>> d8e44652d811e8a4cc019045155656c9bc1fc66e
import com.movieRc.dto.MovieDTO;
import com.movieRc.dto.PostDTO;
import com.movieRc.dto.ReviewDTO;
import com.movieRc.util.Pagination;


@WebServlet("*.home")


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
        PostDAO postDAO = new PostDAO();
        PostCommentDAO postCommentDAO = new PostCommentDAO();
        System.out.println("요청 uri : " + uri);
    	
        if (uri.equals("/toHome.home")) {
            try {
                int start = 1;
                int end = 10;

                ArrayList<MovieDTO> arrayList = movieDAO.selectAll(start, end);
                double avg = 0;
                int count = 0;
                HashMap<Integer, HashMap> hashMap1 = new HashMap<>();
                HashMap<String, Object> hashMap2;


                for (int i = 0; i < arrayList.size(); i++) {
                    hashMap2 = new HashMap<>();
                    avg = reviewDAO.getAvgPoint(arrayList.get(i).getMovieCd());
                    count = reviewDAO.countByMovieCd(arrayList.get(i).getMovieCd());
                    hashMap2.put("avg", avg);
                    hashMap2.put("count", count);
                    hashMap2.put("movieDTO", arrayList.get(i));

                    hashMap1.put(i, hashMap2);
                }

                request.setAttribute("hashMap1", hashMap1);

                ArrayList<ReviewDTO> arrayList2 = reviewDAO.selectAll_ByPagination(start,end);
                hashMap1 = new HashMap<>();
                MovieDTO movieDTO;

                for(int i = 0; i< arrayList2.size(); i++){
                    hashMap2 = new HashMap<>();
                    movieDTO = movieDAO.getMovieDTO_byMovieCd(arrayList2.get(i).getMovieCd());
                    avg = reviewDAO.getAvgPoint(arrayList2.get(i).getMovieCd());
                    count = reviewDAO.countByMovieCd(arrayList2.get(i).getMovieCd());
                    hashMap2.put("reviewDTO", arrayList2.get(i));
                    hashMap2.put("movieDTO", movieDTO);
                    hashMap2.put("avg", avg);
                    hashMap2.put("count", count);

                    hashMap1.put(i, hashMap2);
                }

                request.setAttribute("hashMap2", hashMap1);

                arrayList = movieDAO.selectAll_OrderByAvgPoint(start,end);
                hashMap1 = new HashMap<>();

                for(int i = 0; i< arrayList.size(); i++){
                    hashMap2 = new HashMap<>();
                    avg = reviewDAO.getAvgPoint(arrayList.get(i).getMovieCd());
                    count = reviewDAO.countByMovieCd(arrayList.get(i).getMovieCd());
                    hashMap2.put("avg", avg);
                    hashMap2.put("count", count);
                    hashMap2.put("movieDTO", arrayList.get(i));

                    hashMap1.put(i, hashMap2);
                }

                request.setAttribute("hashMap3", hashMap1);

                ArrayList<PostDTO> arrayList3 = postDAO.selectAll(start, end);
                hashMap1 = new HashMap<>();
                int like;
                int hate;
                int seq;
                int comment;

                for(int i = 0; i<arrayList3.size(); i++){
                    hashMap2 = new HashMap<>();
                    seq = arrayList3.get(i).getSeq_post();
                    like = postDAO.pLikeCount(seq, 1);
                    hate = postDAO.pLikeCount(seq, 2);
                    comment = postCommentDAO.countComment(seq);
                    System.out.println(seq);
                    System.out.println(comment);
                    hashMap2.put("like", like);
                    hashMap2.put("hate", hate);
                    hashMap2.put("comment",  comment);
                    hashMap2.put("postDTO", arrayList3.get(i));

                    hashMap1.put(i, hashMap2);
                }

                request.setAttribute("hashMap4", hashMap1);

                request.getRequestDispatcher("/redirect.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    	
    	
    }

}
