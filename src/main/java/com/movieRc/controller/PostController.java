package com.movieRc.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
			MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
			String user_nickname=dto1.getUser_nickname();
			String user_id= dto1.getUser_id();
			
			String p_title= request.getParameter("title");
			String p_content =request.getParameter("content");
			
			
			PostDAO dao =new PostDAO();
			try {
				int seq_post = dao.getNewSeq();
				int rs=dao.write(new PostDTO(seq_post,user_nickname,p_title,p_content,null,0,user_id,"kakao"));
				
				if(rs>0) {
					response.sendRedirect("/post.po?curPage=1");
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
				System.out.println(seq_post);
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
			}else if(uri.equals("/modify.po")) {
				int seq_post= Integer.parseInt(request.getParameter("seq_post"));
				System.out.println(seq_post);
				PostDAO dao= new PostDAO();
				
				try {
				PostDTO dto1 =dao.getPost(seq_post);
				request.setAttribute("dto", dto1);			
				request.getRequestDispatcher("/post/post_modify.jsp").forward(request, response);
				
				}catch(Exception e) {
					
				}
			}else if(uri.equals("/modifyProc.po")) {
				int seq_post= Integer.parseInt(request.getParameter("seq_post"));
				System.out.println(seq_post);
				PostDAO dao =new PostDAO();
				try {
					int rs =dao.postModify(seq_post,"content");
				}catch(Exception e){
					
				}
				
				
			}else if(uri.equals("/SummerNoteImageFile.po")) {
				
				
				
				String filePath = request.getServletContext().getRealPath("files");//지정될 파일 경로
				System.out.println("filePath : " + filePath);
				
				File dir = new File(filePath);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				String fileName="";
				
				int maxSize = 1024*1024*10;
				
				try {
					// 서버의 경로에 파일 저장하기 
					MultipartRequest multi = new MultipartRequest(request,filePath,maxSize,"utf-8",new DefaultFileRenamePolicy());
					String ori_name = multi.getOriginalFileName("file1");
			
					Enumeration files = multi.getFileNames();
					String file = (String)files.nextElement(); 
					fileName = multi.getFilesystemName(file); 
					
					Gson gson =new Gson();
					
					String rs = "/Movie/files/"+ fileName;
					response.setCharacterEncoding("utf-8");
					/* String rs = gson.toJson(); */
					System.out.println(rs);
					/*
					 
					 * 
					 * InputStream fileStream = multipartFile.getInputStream();
					 * FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
					 * jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
					 * jsonObject.addProperty("responseCode", "success");
					 */
					response.getWriter().append(rs);
				}catch(Exception e){
					e.printStackTrace();
				}
				
				
			 
			}else if(uri.equals("/search.po")) {
				int searchValue=Integer.parseInt(request.getParameter("searchValue")) ;
				String searchInput = request.getParameter("inputSearch");
				System.out.println(searchValue + " : " + searchInput);//1 == 제목, 2 ==내용 ,3 ==글쓴이
				
				PostDAO dao= new PostDAO();
				ArrayList<PostDTO> list =new ArrayList<>();
				try {
					if(searchValue==1 ) {
						list =dao.titleSearch(searchInput);
					}else if(searchValue==2) {
						list =dao.contentSearch(searchInput);
					}else if(searchValue==3) {
						list =dao.writerSearch(searchInput);
					}
					
					
					Gson gson =new Gson();
					String rs = gson.toJson(list);
					System.out.println(rs);
					response.setCharacterEncoding("utf-8");
					response.getWriter().append(rs);
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(uri.equals("/listItem.po")) {
				int listItem=Integer.parseInt(request.getParameter("listItem"));
				int curPage = Integer.parseInt(request.getParameter("curPage"));
				if(listItem==1) {
					listItem=10;
				}else if(listItem==2) {
					listItem=20;
				}else if(listItem==3) {
					listItem=30;
				}
				
				PostDAO dao = new PostDAO();
				try {
					HashMap map = dao.getPageNavi(curPage);
					
					System.out.println("현재 페이지 : " + curPage);
					System.out.println("startNavi : " + map.get("startNavi"));
					System.out.println("endNavi : " + map.get("endNavi"));
					System.out.println("needPrev 필요? " + map.get("needPrev"));
					System.out.println("needNext 필요? " + map.get("needNext"));
					
					ArrayList<PostDTO> list = dao.selectAll(curPage*10-9,curPage*10);
					
					
					Gson gson =new Gson();
					String rs = gson.toJson(list);
					String rs2 = gson.toJson(map);
					System.out.println(rs);
					System.out.println(rs2);
					response.setCharacterEncoding("utf-8");
					response.getWriter().append(rs);
					
					
					
				
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				
			}else if(uri.equals("/pLike.po")) {
				MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
				int seq_post= Integer.parseInt(request.getParameter("seq_post"));
				String user_id=dto1.getUser_id();
				String user_category=dto1.getUser_category();
				
				
				
				PostDAO dao =new PostDAO();
				
				try {
					int rs =dao.postLike(user_id, seq_post, user_category);
					if(rs>0) {
						response.getWriter().append("true");
					}else {
						response.getWriter().append("false");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}else if(uri.equals("/deleteProc.po")) {
				int seq_post = Integer.parseInt(request.getParameter("seq_post"));
				System.out.println("seq_post :" + seq_post);

				PostDAO dao = new PostDAO();
				// 시퀀스번호 이용해 tbl_board에서 게시글 삭제
				try {
					int rs = dao.delete(seq_post);
					if(rs > 0) {
						// 삭제완료 후에는 게시글 목록을 요청하도록.
						response.sendRedirect("/post.po?curPage=1");
					}
				}catch(Exception e) {	
					e.printStackTrace();
				}
			}
			
		}
	}


	

