package com.movieRc.controller;

import com.google.gson.Gson;
import com.movieRc.dao.Like_rDAO;
import com.movieRc.dto.MemberDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "Like_rController", value = "*.likeR")
public class Like_rController2 extends HttpServlet {
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
        }
    }

}
