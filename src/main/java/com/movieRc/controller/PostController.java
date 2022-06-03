package com.movieRc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.movieRc.dao.PostCommentDAO;
import com.movieRc.dao.PostDAO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dto.PostCommentDTO;
import com.movieRc.dto.PostDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("*.po")
public class PostController extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doAction(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인세션 (참고용)
		HttpSession session=request.getSession();
		MemberDTO dto = new MemberDTO("abc123", "kakao", "k","abc123","뚱이",
				"김뚱이", 198084, "010-151","서울시우체국","국도123","우리집앞",
				"내친구집","3학년");
		session.setAttribute("loginSession", dto);
		
		
		String uri =request.getRequestURI();
		System.out.println("요청 uri : " +uri);
		request.setCharacterEncoding("utf-8");
		if(uri.equals("/post.po")) {
			int curPage = Integer.parseInt(request.getParameter("curPage"));
		
			
			PostDAO dao = new PostDAO();
			try {
				HashMap map = dao.getPageNavi(curPage);
				
				System.out.println("현재 페이지 : " + curPage);
				System.out.println("startNavi : " + map.get("startNavi"));
				System.out.println("endNavi : " + map.get("endNavi"));
				System.out.println("needPrev 필요? " + map.get("needPrev"));
				System.out.println("needNext 필요? " + map.get("needNext"));
				
				ArrayList<PostDTO> list = dao.selectAll(curPage*10-9,curPage*10);
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
			
				request.getRequestDispatcher("post/post.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/write.po")) {
			response.sendRedirect("post/post_write.jsp");
		}else if(uri.equals("/writeProc.po")) {
		
			String filePath=request.getServletContext().getRealPath("files");
			System.out.println("filePath : " + filePath);
			File dir =new File(filePath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			int maxSize= 1024*1024*10;
			try {
				MultipartRequest multi = new MultipartRequest(request,filePath,maxSize,"utf-8",new DefaultFileRenamePolicy());
				
				//닉네임 아이디 프로필? 등 회원정보가져오기(섹션으로)
				//
				//
				//
				String title =multi.getParameter("title");
				String content =multi.getParameter("content");
				
				String ori_name= multi.getOriginalFileName("file");
				String sys_name =multi.getFilesystemName("file");
				
				System.out.println(//writer_nickname + " : " + writer_id + " : " +
						title+ " : " + content+ " : " + ori_name+ " : " + sys_name
						+" : ");
				
				PostDAO dao =new PostDAO();
				//PostFileDAO daoFile =new PostFileDAO();
				
				try {
					int seq_board =dao.getNewSeq();
					System.out.println("seq_board : " + seq_board);
				
					//int rs = dao.write(new PostDTO(seq_board,title,content,writer_nickname,writer_id,0,null));
					//시퀀스번호,유저닉네임,제목,내용,날짜,뷰카운트,유저아이디,유저카테고리
					MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");
					
					//로그인 섹션 완료되면 수정필요!	
					int rs = dao.write(new PostDTO(seq_board,dto1.getUser_nickname(),title,content,"1998/04/12",0,dto1.getUser_id(),dto1.getUser_category()));
					if(rs>0) {
						response.sendRedirect("/post.po?curPage=1");
					}
				//	int rsFile = daoFile.insert(new PostFileDTO(0, seq_board, ori_name, sys_name));
					
					/*if(rs > 0 && rsFile > 0) {
						response.sendRedirect("/board.bo?curPage=1");
					}*/
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}		
				
				
			}else if(uri.equals("/myPostProc.po")) {
				MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
				String user_nickname=dto1.getUser_nickname();
				
				
				PostDAO dao= new PostDAO();
				ArrayList<PostDTO> list =new ArrayList<>();
				try {
					list =dao.myPost(user_nickname);
					Gson gson =new Gson();
					String rs = gson.toJson(list);
					System.out.println(rs);
					response.setCharacterEncoding("utf-8");
					response.getWriter().append(rs);
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(uri.equals("/detailPost.po")) {
				int seq_post= Integer.parseInt(request.getParameter("seq_post"));
				PostDAO dao= new PostDAO();
				
				try {
				dao.updateView_count(seq_post);
				PostDTO dto1 =dao.getPost(seq_post);
				request.setAttribute("dto", dto1);
				PostCommentDAO PostCommentDAO = new PostCommentDAO();
				ArrayList<PostCommentDTO> list = PostCommentDAO.selectAll(seq_post);
				request.setAttribute("post_commentList", list);
				
				request.getRequestDispatcher("/post/post_detailview.jsp").forward(request, response);
				
				}catch(Exception e) {
					
				}
			}else if(uri.equals("/uploadSummernoteImageFile.po")) {
				String realPath = request.getServletContext().getRealPath("");
				System.out.println("realPath : " + realPath);
				
				// 2. 서버의 루트에 실제 파일이 저장될 경로값 만들어주기
				String filePath = request.getServletContext().getRealPath("files");
				System.out.println("filePath : " + filePath);
				
				// 3. File을 이용해 실제 위의 경로값이 존재하는지 체크 -> 없다면 폴더 생성 
				File dir = new File(filePath);
				if(!dir.exists()) {
					System.out.println("폴더 생성!");
					dir.mkdirs();
				}
				
				// 4. 업로드할 파일의 최대크기를 얼마로 지정해줄지 
				// 1MB = 1024 * 1024 * 1
				// 10MB = 1024 * 1024 * 10
				int maxSize = 1024 * 1024 * 10;
				
				// MultipartRequest 객체 생성하는 작업 -> 바로 파일의 업로드가 이뤄짐. 
				// MultipartRequest(request, 파일 저장경로, 파일 최대 크기, 인코딩, 파일 이름 중복 처리 방지)
				MultipartRequest multi = new MultipartRequest(request,filePath,maxSize,"utf-8", new DefaultFileRenamePolicy());
				
				// 업로드된 파일의 원본파일명 
				// 파일 다운로드 기능을 구현할때 만약 첨부파일의 목록을 띄워준다면
				// 처음 업로드됐던 파일의 원본명을 띄워주기 위한 용도로 originalfilename이 필요 
				String ori_name = multi.getOriginalFileName("file");	
				
				// 실제 서버 경로에 업로드된 파일명
				// 만약 파일을 다시 다운로드하는 작업을 할때 
				// 요청된 파일을 실제 서버 경로에서 가져오려면 파일의 경로값의 역할을 해주는 filesystemname이 필요
				String sys_name = multi.getFilesystemName("file");
				
				System.out.println("ori_name : " + ori_name);
				System.out.println("sys_name : " + sys_name);
				
				
				
				
				
				
			}
			
		}
	}


