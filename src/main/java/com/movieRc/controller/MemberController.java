package com.movieRc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movieRc.dao.MemberDAO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.util.EncryptionUtils;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
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

		if (uri.equals("/signup.mem")) { // 회원가입 페이지 요청
			response.sendRedirect("/Member/signup.jsp");
		} else if (uri.equals("/checkId.mem")) { // 아이디 중복확인 페이지 요청
			response.sendRedirect("/Member/checkId.jsp");
		} else if (uri.equals("/checkIdProc.mem")) { // 아이디 중복확인
			String user_id = request.getParameter("user_id");
			System.out.println("id: " + user_id);

			MemberDAO dao = new MemberDAO();
			try {
				boolean rs = dao.checkID(user_id);
				System.out.println("rs : " + rs);

				if (rs) {
					request.setAttribute("rs", "available");
				} else {
					request.setAttribute("rs", "unavailable");
				}
				request.setAttribute("user_id", user_id);
				request.getRequestDispatcher("/Member/checkId.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/checkNickname.mem")) { // 닉네임 중복확인 페이지 요청
			response.sendRedirect("/Member/checkNickname.jsp");
		} else if (uri.equals("/checkNicknameProc.mem")) { // 닉네임 중복확인
			String user_nickname = request.getParameter("user_nickname");
			System.out.println("nickname: " + user_nickname);

			MemberDAO dao = new MemberDAO();
			try {
				boolean rs = dao.checkNickname(user_nickname);
				System.out.println("rs : " + rs);

				if (rs) {
					request.setAttribute("rs", "available");
				} else {
					request.setAttribute("rs", "unavailable");
				}
				request.setAttribute("user_nickname", user_nickname);
				request.getRequestDispatcher("/Member/checkNickname.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/signupProc.mem")) { // 회원가입 요청
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String user_nickname = request.getParameter("user_nickname");
			String user_name = request.getParameter("user_name");
			int user_birth = Integer.parseInt(request.getParameter("user_birth"));
			String user_phone = request.getParameter("user_phone");
			String postcode = request.getParameter("postcode");
			String roadAddr = request.getParameter("roadAddr");
			String detailAddr = request.getParameter("detailAddr");
			String extraAddr = request.getParameter("extraAddr");

			System.out.println(user_id + " : " + user_pw + " : " + user_nickname + " : " + user_name + " : "
					+ user_birth + " : " + user_phone + " : " + postcode + " : " + roadAddr + " : " + detailAddr + " : "
					+ extraAddr);

			MemberDAO dao = new MemberDAO();
			try {
				user_pw = EncryptionUtils.getSHA512(user_pw);
				System.out.println("암호화된 pw : " + user_pw);

				int rs = dao.insert(new MemberDTO(user_id, null, null, user_pw, user_nickname, user_name, user_birth,
						user_phone, postcode, roadAddr, detailAddr, extraAddr, null));
				if (rs > 0) {
					response.sendRedirect("/Member/login.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/loginProc.mem")) { // 로그인 요청
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");

			System.out.println(user_id + " : " + user_pw);

			MemberDAO dao = new MemberDAO();

			try {
				user_pw = EncryptionUtils.getSHA512(user_pw);
				System.out.println("암호화된 pw : " + user_pw);

				MemberDTO dto = dao.checkLogin(user_id, user_pw);
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
		} else if (uri.equals("/findId.mem")) { // 아이디 찾기
			String user_k = request.getParameter("user_k");
			String user_name = request.getParameter("user_name");
			String user_phone = request.getParameter("user_phone");
			System.out.println(user_name + " : " + user_phone);

			MemberDAO dao = new MemberDAO();
			try {
				String user_id = dao.findId(user_name, user_phone);
				if (user_id != null) {
					System.out.println("아이디 찾기 성공");
					request.setAttribute("rs", true);
					request.setAttribute("user_id", user_id);

					ArrayList<MemberDTO> list = dao.selectAll();
					request.setAttribute("list", list);

				} else {
					System.out.println("아이디 찾기 실패");
					request.setAttribute("rs", false);
				}
				request.getRequestDispatcher("/Member/findIdResult.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/findPw.mem")) { // 비번 찾기
			String user_k = request.getParameter("user_k");
			String user_name = request.getParameter("user_name");
			String user_id = request.getParameter("user_id");
			System.out.println(user_name + " : " + user_id);

			MemberDAO dao = new MemberDAO();
			try {
				String user_pw = dao.findPw(user_name, user_id);
				if (user_pw != null) {
					System.out.println("비밀번호 찾기 성공");
					request.setAttribute("rs", true);

					ArrayList<MemberDTO> list = dao.selectAll();
					request.setAttribute("list", list);

					String randomPassword = dao.randomPassword(7);
					System.out.println("임시 비밀번호 : " + randomPassword);
					request.setAttribute("ranPw", randomPassword);

					randomPassword = EncryptionUtils.getSHA512(randomPassword);
					System.out.println("암호화된 pw : " + randomPassword);

					int rs = dao.pwUpdate(randomPassword, user_id);
				} else {
					System.out.println("비밀번호 찾기 실패");
					request.setAttribute("rs", false);
				}
				request.getRequestDispatcher("/Member/findPwResult.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/logout.mem")) { // 로그아웃
			HttpSession session = request.getSession();
			System.out.println(session.getAttribute("loginSession"));

			session.invalidate();
			response.sendRedirect("/Member/login.jsp");

			System.out.println("로그아웃 성공");
		}
	}

}
