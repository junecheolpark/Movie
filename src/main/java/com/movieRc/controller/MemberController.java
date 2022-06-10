package com.movieRc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movieRc.dao.MemberDAO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dao.MpDAO;
import com.movieRc.dto.MpDTO;
import com.movieRc.util.EncryptionUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

        } else if (uri.equals("/deleteProc.mem")) { // 회원탈퇴 요청
            HttpSession session = request.getSession();
            String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();

            MemberDAO dao = new MemberDAO();
            try {
                int rs = dao.deleteMember(user_id);
                if (rs > 0) {
                    session.removeAttribute("loginSession");
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
                /**/
                user_pw = EncryptionUtils.getSHA512(user_pw);
                System.out.println("암호화된 pw : " + user_pw);
                /**/
                MemberDTO dto = dao.checkLogin(user_id, user_pw);
                if (dto != null) {
                    System.out.println("로그인 성공");
                    request.setAttribute("rs", true);
                    HttpSession session = request.getSession();
                    session.setAttribute("loginSession", dto);
                    request.getRequestDispatcher("/toHome.home").forward(request, response);
                } else {
                    System.out.println("로그인 실패");
                    request.setAttribute("rs", false);
                    request.getRequestDispatcher("/Member/login.jsp").forward(request,response);
                }
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
            response.sendRedirect("/toHome.home");

        } else if (uri.equals("/myPage.mem")) { // 마이페이지 요청
            HttpSession session = request.getSession();
            String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();
            System.out.println("user_id : " + user_id);

            MemberDAO dao = new MemberDAO();
            MpDAO daoMp = new MpDAO();

            try {
                MemberDTO dto = dao.selectById(user_id);
                // 로그인한 사용자의 아디이에 해당하는 프로필이 있는지 tb_mp에서 조회 -> 파일경로값 가져옴
                // 프로필이 있으면 profile 에 파일 경로값을 셋팅
                // 프로필이 없으면 profile 에 null
                String profile = daoMp.select(user_id);

                System.out.println("profile : " + profile);

                request.setAttribute("profile", profile);

                request.setAttribute("dto", dto);
                request.getRequestDispatcher("/Mypage/mypageIndex.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (uri.equals("/modify.mem")) { // 내 정보수정 페이지 요청
            HttpSession session = request.getSession();
            String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();

            MemberDAO dao = new MemberDAO();
            MpDAO daoMp = new MpDAO();

            try {
                MemberDTO dto = dao.selectById(user_id);

                String profile = daoMp.select(user_id);

                System.out.println("profile : " + profile);

                request.setAttribute("profile", profile);

                request.setAttribute("dto", dto);
                request.getRequestDispatcher("/Mypage/mypageModify.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (uri.equals("/modifyProc.mem")) { // 내 정보수정 요청
            HttpSession session = request.getSession();
            String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();

            // 1. 서버의 루트에 실제 파일이 저장될 경로값 만들어주기
            String filePath = request.getServletContext().getRealPath("files");
            System.out.println("filePath : " + filePath);

            // 2. File을 이용해 실제 위의 경로값이 존재하는지 체크 -> 없다면 폴더 생성
            File dir = new File(filePath);
            if (!dir.exists()) {
                System.out.println("폴더 생성!");
                dir.mkdirs();
            }

            // 3. 업로드할 파일의 최대크기를 얼마로 지정해줄지
            int maxSize = 1024 * 1024 * 100;

            MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());

            String user_pw = multi.getParameter("user_pw");
            String user_nickname = multi.getParameter("user_nickname");
            String user_phone = multi.getParameter("user_phone");
            String postcode = multi.getParameter("postcode");
            String roadAddr = multi.getParameter("roadAddr");
            String detailAddr = multi.getParameter("detailAddr");
            String extraAddr = multi.getParameter("extraAddr");

            // 실제 서버 경로에 업로드된 파일명
            String sys_name = multi.getFilesystemName("photo");

            MemberDAO dao = new MemberDAO();
            MpDAO dao2 = new MpDAO();

            try {
                user_pw = EncryptionUtils.getSHA512(user_pw);
                System.out.println("암호화된 pw : " + user_pw);

                MemberDTO dto = new MemberDTO(user_id, null, null, user_pw, user_nickname, null, 0, user_phone, postcode, roadAddr, detailAddr, extraAddr, null);

                int rs1 = dao.modifyMember(dto);
                int rs2 = dao2.updateMp(user_id, sys_name);
                if (rs1 > 0 && rs2 > 0) {
                    // loginsession 에 들어있는 수정 전 dto를 새롭게
                    session.setAttribute("loginSession", dto);
                    response.sendRedirect("/myPage.mem");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

//		}else if(uri.equals("/")) { // 전체 조회
//			HttpSession session = request.getSession();
//			String user_id = request.getParameter("user_id");
//			String user_nickname = request.getParameter("user_nickname");
//			String user_name = request.getParameter("user_name");
//			int user_birth = Integer.parseInt(request.getParameter("user_birth"));
//			String user_phone = request.getParameter("user_phone");
//			
//			System.out.println(user_id + ":" + user_nickname + ":" + user_name + ":" + user_birth + ":" + user_phone);
//			
//			MemberDAO dao = new MemberDAO();
//			ArrayList<MemberDTO> list = new ArrayList<>();
//			try {
//				list = dao.selectAll();
//				request.setAttribute("list", list);
//				request.getRequestDispatcher("/").forward(request, response);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//		}else if(uri.equals("/")) { // 전체 조회
//			HttpSession session = request.getSession();
//			String user_id = request.getParameter("user_id");
//			String user_nickname = request.getParameter("user_nickname");
//			String user_name = request.getParameter("user_name");
//			int user_birth = Integer.parseInt(request.getParameter("user_birth"));
//			String user_phone = request.getParameter("user_phone");
//
//			System.out.println(user_id + ":" + user_nickname + ":" + user_name + ":" + user_birth + ":" + user_phone);
//
//			MemberDAO dao = new MemberDAO();
//			ArrayList<MemberDTO> list = new ArrayList<>();
//			try {
//				list = dao.selectAll();
//				request.setAttribute("list", list);
//				request.getRequestDispatcher("/").forward(request, response);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
        } else if (uri.equals("/toLogin.mem")) {
            response.sendRedirect("/Member/login.jsp");
        } else if (uri.equals("/toSignUp.mem")) {
            response.sendRedirect("/Member/signup.jsp");
        } else if (uri.equals("/toFindId.mem")) {
            response.sendRedirect("/Member/findId.jsp");
        } else if (uri.equals("/toFindPw.mem")) {
            response.sendRedirect("/Member/findPw.jsp");
        } else if (uri.equals("/myPage.mem ")) {
            response.sendRedirect("/myPage.mem");
        }
    }
}