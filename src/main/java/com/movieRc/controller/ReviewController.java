package com.movieRc.controller;

import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.MovieDTO;
import com.movieRc.dto.ReviewDTO;
import com.movieRc.util.Pagination;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.re")
public class ReviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		MovieDAO movieDAO = new MovieDAO();
		ReviewDAO reviewDAO = new ReviewDAO();
		Pagination pagination = new Pagination();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		if (uri.equals("/toReviewList.re")) {
			int curPage = Integer.parseInt(request.getParameter("curPage"));

			try{
				int totalCnt = reviewDAO.getCount();
				HashMap<String, Object> hashMap = pagination.getPageNavi(totalCnt,10,10, curPage);
				int start = (int) hashMap.get("postStart");
				int end = (int) hashMap.get("postEnd");
				ArrayList<ReviewDTO> arrayList = reviewDAO.selectAll(start,end);
				HashMap<String, HashMap> movies = new HashMap<>();
				HashMap<String, Object> hashMap1;
				String movieCd;
				MovieDTO movieDTO;
				double avg;
				int count;

				for(int i=0; i<arrayList.size(); i++){
					hashMap1 = new HashMap<>();
					movieCd = arrayList.get(i).getMovieCd();
					movieDTO = movieDAO.getMovieDTO_byMovieCd(movieCd);
					count = reviewDAO.countByMovieCd(movieCd);
					avg = reviewDAO.getAvgPoint(movieCd);
					hashMap1.put("movieDTO", movieDTO);
					hashMap1.put("count", count);
					hashMap1.put("avg", avg);
					movies.put(movieCd, hashMap1);
				}

				request.setAttribute("movies", movies);
				request.setAttribute("totalCnt", totalCnt);
				request.setAttribute("arrayList", arrayList);
				request.setAttribute("hashMap", hashMap);
				request.getRequestDispatcher("/review_d/reviewList.jsp").forward(request,response);

			} catch (Exception e){
				e.printStackTrace();
			}
		} else if (uri.equals("/show.re")){
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			String s_type = request.getParameter("s_type");
			String val = request.getParameter("val");

			ArrayList<ReviewDTO> arrayList = new ArrayList<>();
			HashMap<String, HashMap> movies = new HashMap<>();
			HashMap<String, Object> hashMap1;
			HashMap<String, Object> hashMap = new HashMap<>();
			String movieCd;
			MovieDTO movieDTO;
			double avg = 0;
			int count = 0;
			int totalCnt = 0;

			try {
				if(s_type.equals("genreAlt")){
					if(val.equals("기타")){
						totalCnt = reviewDAO.countEtcGenre();
						hashMap = pagination.getPageNavi(totalCnt,10,10, curPage);
						int start = (int) hashMap.get("postStart");
						int end = (int) hashMap.get("postEnd");
						arrayList = reviewDAO.selectAllgenreEtc(start,end);

						for(int i=0; i<arrayList.size(); i++){
							hashMap1 = new HashMap<>();
							movieCd = arrayList.get(i).getMovieCd();
							movieDTO = movieDAO.getMovieDTO_byMovieCd(movieCd);
							count = reviewDAO.countByMovieCd(movieCd);
							avg = reviewDAO.getAvgPoint(movieCd);
							hashMap1.put("movieDTO", movieDTO);
							hashMap1.put("count", count);
							hashMap1.put("avg", avg);
							movies.put(movieCd, hashMap1);
						}

					} else {
						totalCnt = reviewDAO.countByGenre(val);
						hashMap = pagination.getPageNavi(totalCnt,10,10, curPage);
						int start = (int) hashMap.get("postStart");
						int end = (int) hashMap.get("postEnd");
						arrayList = reviewDAO.selectAllByGenre(val,start,end);

						for(int i=0; i<arrayList.size(); i++){
							hashMap1 = new HashMap<>();
							movieCd = arrayList.get(i).getMovieCd();
							movieDTO = movieDAO.getMovieDTO_byMovieCd(movieCd);
							count = reviewDAO.countByMovieCd(movieCd);
							avg = reviewDAO.getAvgPoint(movieCd);
							hashMap1.put("movieDTO", movieDTO);
							hashMap1.put("count", count);
							hashMap1.put("avg", avg);
							movies.put(movieCd, hashMap1);
						}
					}
				}

				request.setAttribute("s_type", s_type);
				request.setAttribute("val", val);
				request.setAttribute("movies", movies);
				request.setAttribute("totalCnt", totalCnt);
				request.setAttribute("arrayList", arrayList);
				request.setAttribute("hashMap", hashMap);
				request.getRequestDispatcher("/review_d/reviewList.jsp").forward(request,response);

			} catch (Exception e) {

			}

		}
	}
}