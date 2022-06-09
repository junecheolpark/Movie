package com.movieRc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movieRc.dao.BlacklistDAO;
import com.movieRc.dao.MemberDAO;
import com.movieRc.dao.ReportDAO;
import com.movieRc.dto.BlacklistDTO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dto.ReportDTO;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {
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
		response.setCharacterEncoding("utf-8");

		if (uri.equals("/report.admin")) { // 신고 내역 조회
			int curPage = Integer.parseInt(request.getParameter("curPage"));

			ReportDAO dao = new ReportDAO();
			try {
				HashMap map = dao.getPageNavi(curPage);
				ArrayList<ReportDTO> list = dao.selectAll(curPage * 10 - 9, curPage * 10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				request.getRequestDispatcher("/Admin/report.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/lookupMem.admin")) { // 전체 회원 조회
			int curPage = Integer.parseInt(request.getParameter("curPage"));

			MemberDAO dao = new MemberDAO();
			
			try {
				HashMap map = dao.getPageNavi(curPage);
				ArrayList<MemberDTO> list = dao.selectAll_Admin(curPage * 10 - 9, curPage * 10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				request.getRequestDispatcher("/Admin/lookupMem.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(uri.equals("/black.admin")) { // 블랙리스트 페이지 요청
			
			BlacklistDAO dao = new BlacklistDAO();
			try {
				ArrayList<BlacklistDTO> list = dao.selectAll();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/Admin/blacklist.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		} else if(uri.equals("/addBlack.admin")) { // 블랙리스트 추가
			String user_id = request.getParameter("user_id");
			String reason = request.getParameter("reason");
			
			BlacklistDAO dao = new BlacklistDAO();
			try {
				int rs = dao.insertBlack(new BlacklistDTO(user_id, null, null, reason));
				ArrayList<BlacklistDTO> list = dao.selectAll();
				
				if(rs > 0) {
					System.out.println("블랙리스트 추가 성공");
					request.setAttribute("list", list);
					Gson gson = new Gson();
					String gsonrs = gson.toJson(list);
					System.out.println(gsonrs);
					response.setCharacterEncoding("utf-8");
					response.getWriter().append(gsonrs);
				}else {
					System.out.println("블랙리스트 추가 실패");
					response.getWriter().append("fail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		} else if(uri.equals("/delBlack.admin")) { // 블랙리스트 삭제
			String user_id = request.getParameter("user_id");
			
			BlacklistDAO dao = new BlacklistDAO();
			try {
				int rs = dao.deleteBlack(user_id);
				if(rs > 0) {
					ArrayList<BlacklistDTO> list = dao.selectAll();
					Gson gson = new Gson();
					String gsonrs = gson.toJson(list);
					response.setCharacterEncoding("utf-8");
					response.getWriter().append(gsonrs);
				}else {
					response.getWriter().append("fail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
