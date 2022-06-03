package com.movieRc.controller;

import com.movieRc.dao.Like_rDAO;
import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.MemberDTO;
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
import javax.servlet.http.HttpSession;

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
		Like_rDAO like_rDAO = new Like_rDAO();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		if (uri.equals("/toReviewList.re")) {
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			HttpSession httpSession = request.getSession();
			MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("loginSession");
			String id = null;
			String user_category = null;

			if(memberDTO!=null){
				id = memberDTO.getUser_id();
				user_category = memberDTO.getUser_category();
			}

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

				//좋아요 싫어요
				int review_seq;
				HashMap<String, HashMap> likes = new HashMap<>();
				HashMap<String, Integer> likeHashMap = new HashMap<>();
				int likeCount;
				int hateCount;
				int status;

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

					// 리뷰 좋아요 싫어요
					likeHashMap = new HashMap<>();
					review_seq = arrayList.get(i).getSeq_review();
					likeCount = like_rDAO.countLike(review_seq);
					hateCount = like_rDAO.countHate(review_seq);
					status = like_rDAO.getStatus(id,user_category,review_seq);
					likeHashMap.put("like", likeCount);
					likeHashMap.put("hate", hateCount);
					likeHashMap.put("status", status);
					likes.put(String.valueOf(review_seq),likeHashMap);
				}

				request.setAttribute("likes", likes);
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
			HttpSession httpSession = request.getSession();
			MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("loginSession");
			String id = memberDTO.getUser_id();
			String user_category = memberDTO.getUser_category();
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

			int review_seq;
			HashMap<String, HashMap> likes = new HashMap<>();
			HashMap<String, Integer> likeHashMap = new HashMap<>();
			int likeCount;
			int hateCount;
			int status;

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

							likeHashMap = new HashMap<>();
							review_seq = arrayList.get(i).getSeq_review();
							likeCount = like_rDAO.countLike(review_seq);
							hateCount = like_rDAO.countHate(review_seq);
							status = like_rDAO.getStatus(id,user_category,review_seq);
							likeHashMap.put("like", likeCount);
							likeHashMap.put("hate", hateCount);
							likeHashMap.put("status", status);
							likes.put(String.valueOf(review_seq),likeHashMap);
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

							likeHashMap = new HashMap<>();
							review_seq = arrayList.get(i).getSeq_review();
							likeCount = like_rDAO.countLike(review_seq);
							hateCount = like_rDAO.countHate(review_seq);
							status = like_rDAO.getStatus(id,user_category,review_seq);
							likeHashMap.put("like", likeCount);
							likeHashMap.put("hate", hateCount);
							likeHashMap.put("status", status);
							likes.put(String.valueOf(review_seq),likeHashMap);
						}
					}
				}

				request.setAttribute("likes", likes);
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