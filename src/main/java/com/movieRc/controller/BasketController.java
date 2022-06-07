package com.movieRc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.movieRc.dao.BasketDAO;
import com.movieRc.dto.BasketDTO;
import com.movieRc.dto.MemberDTO;

@WebServlet("*.wish")
public class BasketController extends HttpServlet {
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
		
		if(uri.equals("/wishlist.wish")) { // 찜 목록 페이지 요청
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
			//String user_id = dto.getUser_id();
			String user_id = "abc123";
			
			BasketDAO dao = new BasketDAO();
			try {
				ArrayList<BasketDTO> list = dao.selectAll(user_id);
				request.setAttribute("wishList", list);
				System.out.println(list.toString());
				
				// 게시글 수 카운팅
				int totalCnt = dao.getListCnt();
				request.setAttribute("totalCnt", totalCnt);
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/Basket/wishlist.jsp").forward(request, response);
		}else if(uri.equals("/delete.wish")) { // 찜 목록 삭제
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
//			String user_id = dto.getUser_id();
			String user_id = "abc123";
			int seq_basket = Integer.parseInt(request.getParameter("seq_basket"));
			BasketDAO dao = new BasketDAO();
			try {
				int rs = dao.delete(seq_basket);
				if(rs > 0) {
					ArrayList<BasketDTO> list = dao.selectAll(user_id);
					Gson gson = new Gson();
					String wishList = gson.toJson(list);
					response.getWriter().append(wishList);
				}else {
					response.getWriter().append("fail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/sortbyAdd.wish")) {
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
			//String user_id = dto.getUser_id();
			String user_id = "abc123";
			
			BasketDAO dao = new BasketDAO();
			try {
				ArrayList<BasketDTO> list = dao.selectByAdd(user_id);
				System.out.println(list.toString());
				Gson gson = new Gson();
				String wishList = gson.toJson(list);
				System.out.println(wishList);
				response.getWriter().append(wishList);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/sortbyName.wish")) {
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
			//String user_id = dto.getUser_id();
			String user_id = "abc123";
			
			BasketDAO dao = new BasketDAO();
			try {
				ArrayList<BasketDTO> list = dao.selectByName(user_id);
				System.out.println(list.toString());
				Gson gson = new Gson();
				String wishList = gson.toJson(list);
				System.out.println(wishList);
				response.getWriter().append(wishList);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/sortbyNameEn.wish")) {
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
			//String user_id = dto.getUser_id();
			String user_id = "abc123";
			
			BasketDAO dao = new BasketDAO();
			try {
				ArrayList<BasketDTO> list = dao.selectByNameEn(user_id);
				System.out.println(list.toString());
				Gson gson = new Gson();
				String wishList = gson.toJson(list);
				System.out.println(wishList);
				response.getWriter().append(wishList);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
