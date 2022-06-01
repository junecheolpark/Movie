package com.movieRc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.ReviewDTO;

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
		request.setCharacterEncoding("utf-8");
		
		if (uri.equals("/write.re")) {
			String user_nickname= "nickname";
			String r_content = request.getParameter("r_content");
			System.out.println("r_content: " + r_content);
			int r_grade = Integer.parseInt(request.getParameter("r_grade"));
			System.out.println("r_grade: " + r_grade);
			String movieCd = "movieCd";
			String user_id= "id";
			String user_category= "category";
			
			
			ReviewDAO dao = new ReviewDAO();
			try {
				int rs = dao.write(new ReviewDTO(0, user_nickname, r_content, null, r_grade, movieCd, user_id, user_category));

				if(rs > 0) { // 댓글 등록이 제대로 이뤄졌다면
					response.sendRedirect("/detailView.re");				
				}else { // 댓글 등록에 실패했다면
				
				}
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}else if(uri.equals("/detailView.re")) { //상세보기페이지 요청
			String movieCd = "movieCd";
//			String movieCd = request.getParameter("movieCd");
			System.out.println("movieCd : " + movieCd);
//			MovieDAO mdao = new MovieDAO();
			ReviewDAO rdao = new ReviewDAO();
			
			try {
				// 조회수를 +1 
//				MovieDAO.updateView_count(seq_movie);
				// 상세보기 페이지를 뿌려주기 위한 작업
//				MovieDTO rdto = ReviewDAO.selectByCd(movieCd);
//				request.setAttribute("dto", dto);
				
				//평점 몇명했는지
				int cnt = rdao.r_grade_count();
				request.setAttribute("cnt", cnt);
				//평균
				Double  average = rdao.r_grade_average();
				request.setAttribute("average", average);
				
				// 게시글에 해당하는 댓글을 가져와 담아주는 작업
				
				ArrayList<ReviewDTO> list = rdao.selectAll(movieCd);
				System.out.println("list" + list);
				request.setAttribute("reviewList", list);
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/review_d/inquiry_d.jsp").forward(request, response);
		}else if(uri.equals("/r_delete.re")) {//리뷰 삭제
			int seq_review = Integer.parseInt(request.getParameter("seq_review"));
			String movieCd = "movieCd";
			System.out.println("삭제 요청 seq : "+ seq_review +", movieCd : " + movieCd);
			ReviewDAO rdao = new ReviewDAO();
			
			try {
				int rs = rdao.delete(seq_review);
				if(rs > 0) { //댓글 삭제 성공, 댓글 목록 응담
					ArrayList<ReviewDTO> list = rdao.selectAll(movieCd);
					Gson gson = new Gson();
					String result = gson.toJson(list);
					response.getWriter().append(result);					
				}else { // 댓글 삭제 실패, fail 
					response.getWriter().append("fail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/r_modify.re")) { //리뷰수정
			int seq_review = Integer.parseInt(request.getParameter("seq_review"));
			String movieCd = "movieCd";
			String r_content = request.getParameter("r_content");
			int r_grade = Integer.parseInt(request.getParameter("r_grade"));
			
			System.out.println(seq_review + " : " + movieCd + " : " + r_content+ " : " + r_grade);
			ReviewDAO rdao = new ReviewDAO();
			try {
				int rs = rdao.modify(r_content, r_grade, seq_review);
//				int rs = rdao.modify(new ReviewDTO(0, null, r_content, null, r_grade, movieCd, null, null));
				if(rs > 0) { //댓글 수정 성공, 리스트 응답
					ArrayList<ReviewDTO> list = rdao.selectAll(movieCd);
					Gson gson = new Gson();
					String result = gson.toJson(list);
					response.getWriter().append(result);					
				}else { // 댓글 수정 실패, fail 
					response.getWriter().append("fail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
	}
}