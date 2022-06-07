package com.movieRc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movieRc.dao.ReportDAO;
import com.movieRc.dto.ReportDTO;

@WebServlet("*.report")
public class ReportController extends HttpServlet {
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
		response.setCharacterEncoding("utf-8");
		//HttpSession session = request.getSession();
		
		if(uri.equals("/report.report")) {
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			
			ReportDAO dao = new ReportDAO();
			try {
				
				HashMap map = dao.getPageNavi(curPage);
				ArrayList<ReportDTO> list = dao.selectAll(curPage*10-9, curPage*10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/Report/report.jsp").forward(request, response);
		}
	}
}
