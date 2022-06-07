package com.movieRc.controller;

import com.google.gson.Gson;
import com.movieRc.dao.Like_rDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.Like_rDTO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dto.ReviewDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "Like_rController", value = "*.likeR")
public class Like_rController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);

    }

    protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String uri = request.getRequestURI();
        Like_rDAO like_rDAO = new Like_rDAO();
        System.out.println("요청 uri : " + uri);

        if (uri.equals("/like.reviewList.likeR")) {
            HttpSession httpSession = request.getSession();
            MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("loginSession");
            String user_id = memberDTO.getUser_id();
            String user_category = memberDTO.getUser_category();

            int seq_review = Integer.parseInt(request.getParameter("seq_review"));
            try {
                int check = like_rDAO.check(user_id, user_category, seq_review);
                if (check == 0) like_rDAO.insertLike(user_id, user_category, seq_review);
                else like_rDAO.changeToLike(user_id, user_category, seq_review);

                int likeCount = like_rDAO.countLike(seq_review);
                int hateCount = like_rDAO.countHate(seq_review);
                HashMap<String, Integer> likeHashMap = new HashMap<>();
                likeHashMap.put("like", likeCount);
                likeHashMap.put("hate", hateCount);

                Gson gson = new Gson();
                String data = gson.toJson(likeHashMap);
                System.out.println(data);
                response.getWriter().append(data);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (uri.equals("/likeCancle.reviewList.likeR")) {
            HttpSession httpSession = request.getSession();
            MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("loginSession");
            String user_id = memberDTO.getUser_id();
            String user_category = memberDTO.getUser_category();

            int seq_review = Integer.parseInt(request.getParameter("seq_review"));
            try {
                int status = like_rDAO.getStatus(user_id, user_category, seq_review);
                int rs = 0;
                if (status == 1) {
                    like_rDAO.delete(user_id, user_category, seq_review);
                }

                int likeCount = like_rDAO.countLike(seq_review);
                int hateCount = like_rDAO.countHate(seq_review);
                HashMap<String, Integer> likeHashMap = new HashMap<>();
                likeHashMap.put("like", likeCount);
                likeHashMap.put("hate", hateCount);

                Gson gson = new Gson();
                String data = gson.toJson(likeHashMap);
                System.out.println(data);
                response.getWriter().append(data);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (uri.equals("/hate.reviewList.likeR")) {
            HttpSession httpSession = request.getSession();
            MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("loginSession");
            String user_id = memberDTO.getUser_id();
            String user_category = memberDTO.getUser_category();

            int seq_review = Integer.parseInt(request.getParameter("seq_review"));
            try {
                int check = like_rDAO.check(user_id, user_category, seq_review);
                if (check == 0) like_rDAO.insertHate(user_id, user_category, seq_review);
                else like_rDAO.changeToHate(user_id, user_category, seq_review);

                int likeCount = like_rDAO.countLike(seq_review);
                int hateCount = like_rDAO.countHate(seq_review);
                HashMap<String, Integer> likeHashMap = new HashMap<>();
                likeHashMap.put("like", likeCount);
                likeHashMap.put("hate", hateCount);

                Gson gson = new Gson();
                String data = gson.toJson(likeHashMap);
                System.out.println(data);
                response.getWriter().append(data);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (uri.equals("/hateCancle.reviewList.likeR")) {

            HttpSession httpSession = request.getSession();

            MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("loginSession");
            String user_id = memberDTO.getUser_id();
            String user_category = memberDTO.getUser_category();

            int seq_review = Integer.parseInt(request.getParameter("seq_review"));
            try {
                int status = like_rDAO.getStatus(user_id, user_category, seq_review);
                int rs = 0;
                if (status == 2) {
                    like_rDAO.delete(user_id, user_category, seq_review);
                }

                int likeCount = like_rDAO.countLike(seq_review);
                int hateCount = like_rDAO.countHate(seq_review);
                HashMap<String, Integer> likeHashMap = new HashMap<>();
                likeHashMap.put("like", likeCount);
                likeHashMap.put("hate", hateCount);

                Gson gson = new Gson();
                String data = gson.toJson(likeHashMap);
                System.out.println(data);
                response.getWriter().append(data);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if (uri.equals("/l_modify.likeR")) {
			HttpSession session = request.getSession();//임시
			MemberDTO dto = (MemberDTO)session.getAttribute("loginSession");
			
			int seq_review = Integer.parseInt(request.getParameter("seq_review"));
			System.out.println("seq_review: " + seq_review);
			int r_like_check = Integer.parseInt(request.getParameter("r_like_check"));
			System.out.println("r_like_check: " + r_like_check);
			String user_category = dto.getUser_category(); // 이것도 로그인 세션으로
			String user_id = dto.getUser_id(); // 로그인 세션으로 대체
			
			String movieCd = "movieCd"; // 값 불러온다음 대체
			

			Like_rDAO ldao = new Like_rDAO();
			ReviewDAO rdao = new ReviewDAO();
			try {
				//같은 seq_review에 같은 아이디값이 있다면
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
					int l_rs = ldao.like_insert(new Like_rDTO(0, 0, user_id, seq_review, user_category));
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
				response.sendRedirect("/detailView.re");
				*/
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
    }

}
