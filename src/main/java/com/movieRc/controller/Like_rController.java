package com.movieRc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movieRc.dao.Like_rDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.Like_rDTO;
import com.movieRc.dto.ReviewDTO;

@WebServlet("*.like")
public class Like_rController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		request.setCharacterEncoding("utf-8");

		if (uri.equals("/l_modify.like")) {
			int seq_review = Integer.parseInt(request.getParameter("seq_review"));
			System.out.println("seq_review: " + seq_review);
			int r_like_check = Integer.parseInt(request.getParameter("r_like_check"));
			System.out.println("r_like_check: " + r_like_check);

			String user_id = "asd123"; // 로그인 세션으로 대체
			String movieCd = "movieCd"; // 값 불러온다음 대체
			String user_category = "일반"; // 이것도 로그인 세션으로

			Like_rDAO ldao = new Like_rDAO();
			ReviewDAO rdao = new ReviewDAO();
			try {

				int rs = ldao.select_seq_check(user_id, seq_review);
				System.out.println(rs);
				if (rs > 0) {// 0보다 크면 seq가 존재하므로 업데이트
					int rs1 = ldao.like_update(r_like_check, user_id, seq_review);
					if (rs1 > 0) { // 댓글 수정 성공, 리스트 응답
						ArrayList<ReviewDTO> list = rdao.selectAll(movieCd);
						Gson gson = new Gson();
						String result = gson.toJson(list);
						response.getWriter().append(result);
					} else { // 댓글 수정 실패, fail 
						response.getWriter().append("fail");
					}
				} else {// 아니라면 존재하지 않으므로 insert후 업데이트
						// tbl_like_r insert
					int l_rs = ldao.like_insert(new Like_rDTO(0, 0, user_id, seq_review, user_category,2));
					if (l_rs > 0) {// 생성
						
						int rs1 = ldao.like_update(r_like_check, user_id, seq_review);
						if (rs1 > 0) { // 좋아요 수정 성공, 리스트 응답
							ArrayList<ReviewDTO> list = rdao.selectAll(movieCd);
							Gson gson = new Gson();
							String result = gson.toJson(list);
							response.getWriter().append(result);
						} else { // 댓글 수정 실패, fail
							response.getWriter().append("fail");
						}
					}
				}
				/*
				
				*/
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
}
