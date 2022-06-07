package com.movieRc.controller;

import com.movieRc.dao.MemberDAO;
import com.movieRc.dto.MemberDTO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home")
public class HomeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/index.jsp");
//

//		테스트용
		String id = "abc123";
		String pw = "abc123";

		MemberDAO memberDAO = new MemberDAO();
		try{
			MemberDTO memberDTO = memberDAO.checkLogin(id,pw);
			System.out.println(memberDTO);
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("loginSession", memberDTO);
			request.getRequestDispatcher("/listLookup.movie").forward(request,response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
