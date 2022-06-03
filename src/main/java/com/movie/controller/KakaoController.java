package com.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.movie.dao.KakaoDAO;
import com.movie.dao.MemberDAO;
import com.movie.dto.MemberDTO;
import com.movie.utils.EncryptionUtils;

@WebServlet("*.ka")
public class KakaoController extends HttpServlet {
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

		if (uri.equals("/kakaoTokenCheck.ka")) { // 토큰 체크
			String user_k = request.getParameter("user_k");
			System.out.println("token : " + user_k);

			KakaoDAO dao = new KakaoDAO();
			try {
				ArrayList<MemberDTO> list = dao.selectAll();

				Gson gson = new Gson();
				String gsonRs = gson.toJson(list);

				response.setCharacterEncoding("utf-8");
				response.getWriter().append(gsonRs);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/kakaoSignup.ka")) { // 회원가입 페이지 요청
			String user_k = request.getParameter("user_k");
			String user_name = request.getParameter("user_name");
			String user_id = request.getParameter("user_id");
			System.out.println(user_name + " : " + user_k + " : " + user_id);		
			
			MemberDAO dao = new MemberDAO();			
			try {
				String randomPassword = dao.randomPassword(7);
				System.out.println("임시 비밀번호 : " + randomPassword);
				request.setAttribute("ranPw", randomPassword);	
				randomPassword = EncryptionUtils.getSHA512(randomPassword);
				System.out.println("암호화된 pw : " + randomPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}						
			request.getRequestDispatcher("/Member/kakaoSignup.jsp").forward(request, response);
		} else if (uri.equals("/kakaoSignupProc.ka")) { // 회원가입 요청
			String user_id = request.getParameter("user_id");
			String user_k = request.getParameter("user_k");
			String user_pw = request.getParameter("user_pw");
			String user_nickname = request.getParameter("user_nickname");
			String user_name = request.getParameter("user_name");
			int user_birth = Integer.parseInt(request.getParameter("user_birth"));
			String user_phone = request.getParameter("user_phone");
			String postcode = request.getParameter("postcode");
			String roadAddr = request.getParameter("roadAddr");
			String detailAddr = request.getParameter("detailAddr");
			String extraAddr = request.getParameter("extraAddr");

			System.out.println(user_id + " : " + user_k + " : " + user_nickname + " : " + user_name + " : " + user_birth
					+ " : " + user_phone + " : " + postcode + " : " + roadAddr + " : " + detailAddr + " : "
					+ extraAddr);

			KakaoDAO dao = new KakaoDAO();
			try {				
				user_pw = EncryptionUtils.getSHA512(user_pw);
				System.out.println("암호화된 pw : " + user_pw);
				
				int rs = dao.insert(new MemberDTO(user_id, null, user_k, user_pw, user_nickname, user_name, user_birth,
						user_phone, postcode, roadAddr, detailAddr, extraAddr, null));
				if (rs > 0) {
					response.sendRedirect("/Member/login.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/kakaoLogin.ka")) { // 로그인
			String user_k = request.getParameter("user_k");
			String user_name = request.getParameter("user_name");
			System.out.println(user_k + " : " + user_name);

			KakaoDAO dao = new KakaoDAO();

			try {
				MemberDTO dto = dao.checkLogin(user_name, user_k);
				if (dto != null) {
					System.out.println("로그인 성공");
					request.setAttribute("rs", true);
					HttpSession session = request.getSession();
					session.setAttribute("loginSession", dto);
				} else {
					System.out.println("로그인 실패");
					request.setAttribute("rs", false);
				}
				request.getRequestDispatcher("/loginHome.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (uri.equals("/kakaoLogout.ka")) { // 로그아웃
			HttpSession session = request.getSession();
			System.out.println(session.getAttribute("loginSession"));

			session.invalidate();
			response.sendRedirect("/Member/login.jsp");
			
			System.out.println("로그아웃 성공");
		}
	}
}
