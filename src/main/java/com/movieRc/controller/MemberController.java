package com.movieRc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 클라이언트의 요청 url 
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		
		request.setCharacterEncoding("utf-8");
		
		if(uri.equals("/nicknameCheckPopup.mem")) { // 닉네임 중복확인 팝업 페이지 요청
			response.sendRedirect("/Mypage/mypagePopup.jsp");
			
		}else if(uri.equals("/checkNickname.mem")) { //닉네임 중복확인 요청
			String user_nickname = request.getParameter("user_nickname");
			System.out.println("user_nickname : " + user_nickname);
			
			MemberDAO dao = new MemberDAO();
			try {
				boolean rs = dao.checkNickname(user_nickname);
				System.out.println("rs : " + rs);
				
				if(rs) { // 사용할 수 있는 닉네임이라면
					request.setAttribute("rs", "ok");
				}else { // 중복된 닉네임이라면
					request.setAttribute("rs", "no");
				}
				request.setAttribute("user_nickname", user_nickname);
				request.getRequestDispatcher("Mypage/mypagePopup.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/logoutProc.mem")) { // 로그아웃 요청
			// 지금 요청을 보낸 클라이언트의 세션 얻어오기
			HttpSession session = request.getSession();
			// session.getAttribute("세션의 key");-> key에 담긴 값 가져오기
			
			// 1. session 객체를 초기화
			session.invalidate();
			response.sendRedirect("/index.jsp");
			
			// 2. session 저장소에서 loginSession 값만 삭제
			session.removeAttribute("loginSession");
			response.sendRedirect("/index.jsp");
			
		}else if(uri.equals("/deleteProc.mem")) { // 회원탈퇴 요청
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
			
			MemberDAO dao = new MemberDAO();
			try {
				int rs = dao.deleteMember(user_id);
				if(rs > 0) {
					response.sendRedirect("/myPage.mem");
				}
				
			}catch(Exception e) {
				
			}
			
		}else if(uri.equals("/myPage.mem")) { // 마이페이지 요청
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
		
			MemberDAO dao = new MemberDAO();
			try {
				MemberDTO dto = dao.selectById(user_id);				
				
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/Mypage/mypageIndex.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/modify.mem")) { // 내 정보수정 페이지 요청
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
		
			MemberDAO dao = new MemberDAO();
			try {
				MemberDTO dto = dao.selectById(user_id);			
				
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/Mypage/mypageModify.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/modifyProc.mem")) { // 내 정보수정 요청
			HttpSession session = request.getSession();
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
			String user_category = request.getParameter("user_category");
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
			String grade = request.getParameter("grade");
			
			System.out.println(user_id + ":" + user_category + ":" + user_k + ":" + user_pw + ":" + user_nickname + ":" + user_name + ":" + user_birth 
					+ ":" + user_phone + ":" + postcode + ":" + roadAddr + ":" + detailAddr + ":" + extraAddr + ":" + grade);
			
			MemberDAO dao = new MemberDAO();
			try {
				int rs = dao.modifyMember(new MemberDTO(user_id, user_category, user_k, user_pw, user_nickname, user_name, user_birth, user_phone, postcode, roadAddr, detailAddr, extraAddr, grade));
				if(rs > 0) {
					response.sendRedirect("/myPage.mem");
				}
			}catch(Exception e) {
				
			}
		}
	}
}
