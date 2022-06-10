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

import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dto.MyReviewDTO;
import com.movieRc.util.Pagination;


@WebServlet("*.mypage")
public class MypageController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Pagination pagination = new Pagination();
		
		if(uri.equals("/myReview.mypage")){
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			MemberDTO dto = (MemberDTO) request.getSession().getAttribute("loginSession");
			ReviewDAO dao = new ReviewDAO();
			String user_id = dto.getUser_id();
			MovieDAO movieDAO = new MovieDAO();
			
			try {
				int totalCnt = dao.getCount();
				HashMap<String, Object> pageMap = pagination.getPageNavi(totalCnt, 10, 10, curPage);
				int start = (int) pageMap.get("postStart");
                int end = (int) pageMap.get("postEnd");
                
				ArrayList<MyReviewDTO> list = dao.selectAll_ByUser(user_id, start, end);
				request.setAttribute("myReview", list);
				request.setAttribute("pageMap", pageMap);
				request.getRequestDispatcher("/Mypage/mypage_myReview.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
