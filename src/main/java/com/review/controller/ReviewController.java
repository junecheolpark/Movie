package com.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.review.dao.ReviewDAO;

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
			String r_content = request.getParameter("r_content");
			System.out.println("r_content: " + r_content);
			
			ReviewDAO rdao = new ReviewDAO();
			try {
				int rs = rdao.write(r_content);
//				if(rs >0) {
//					System.out.println("성공!");
//					response.sendRedirect("/review_d/inquiry_d.jsp");
//				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			
		}
		
		
		
		
	}
}