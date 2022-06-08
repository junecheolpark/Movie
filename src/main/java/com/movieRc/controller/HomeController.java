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
=======
import com.movieRc.dao.MemberDAO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.MovieDTO;
import com.movieRc.util.Pagination;


@WebServlet("*.home")
>>>>>>> 07237bd64e5d1463cee66794cf335283732f045c


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
    	
        if (uri.equals("/toHome.home")) {

            try {
                int start = 1;
                int end = 10;
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

                request.setAttribute("arrayList", arrayList);
                request.setAttribute("points", hashMap1);
                request.getRequestDispatcher("/redirect.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    	
    	
    }

}
