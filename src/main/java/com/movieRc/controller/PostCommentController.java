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
import com.movieRc.dao.PostCommentDAO;
import com.movieRc.dao.PostDAO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dto.PostCommentDTO;
import com.movieRc.dto.ReportDTO;


@WebServlet("*.co")
public class PostCommentController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doAction(request,response);
		}
		protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
			HttpSession session=request.getSession();

			
			String uri =request.getRequestURI();
			System.out.println("요청 uri : " +uri);
			request.setCharacterEncoding("utf-8");
			if(uri.equals("/insert.co")) {//post_comment 삽입 
				int seq_post=Integer.parseInt(request.getParameter("seq_post"));
				String user_nickname = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname();
				System.out.println("test1");
				String comment_content =request.getParameter("comment_content");
				System.out.println("test2");
				String user_id=((MemberDTO)session.getAttribute("loginSession")).getUser_id();
				System.out.println("test3");
				String user_category = ((MemberDTO)session.getAttribute("loginSession")).getUser_category();
				System.out.println("test4");
				System.out.println(user_id+user_nickname+comment_content+": " + seq_post);
				
				PostCommentDAO dao =new PostCommentDAO();
				try {
					int rs =dao.insert(new PostCommentDTO(0,user_nickname,null,comment_content,user_id,seq_post,user_category));
					if(rs>0) {
						ArrayList<PostCommentDTO> list= dao.selectAll(seq_post);
						Gson gson =new Gson();
						String result =gson.toJson(list);
						response.getWriter().append(result);
					}else {
						System.out.println("fail");
						response.getWriter().append("fail");
					}
					System.out.println("rs");
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}else if(uri.equals("/deleteProc.co")) { //댓글 삭제 요청
				int seq_comment = Integer.parseInt(request.getParameter("seq_comment"));
				int seq_post = Integer.parseInt(request.getParameter("seq_post"));
				
				System.out.println("삭제 요청 seq : "+ seq_comment +", seq_board : " + seq_post);
				PostCommentDAO dao = new PostCommentDAO();
				
				try {
					int rs = dao.delete(seq_comment);
					if(rs > 0) { //댓글 삭제 성공, 댓글 목록 응담
						ArrayList<PostCommentDTO> list = dao.selectAll(seq_post);
						Gson gson = new Gson();
						String result = gson.toJson(list);
						response.getWriter().append(result);					
					}else { // 댓글 삭제 실패, fail 
						response.getWriter().append("fail");
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(uri.equals("/modifyProc.co")) { //댓글수정요청
				int seq_comment = Integer.parseInt(request.getParameter("seq_comment"));
				int seq_post = Integer.parseInt(request.getParameter("seq_post"));
				String comment_content = request.getParameter("comment_content");
				
				System.out.println(seq_comment + " : " + seq_post + " : " + comment_content);
				PostCommentDAO dao = new PostCommentDAO();
				try {
					int rs = dao.modify(new PostCommentDTO(seq_comment,null,null , comment_content, null,seq_post,null));
					if(rs > 0) { //댓글 수정 성공, 리스트 응답
						ArrayList<PostCommentDTO> list = dao.selectAll(seq_post);
						Gson gson = new Gson();
						String result = gson.toJson(list);
						response.getWriter().append(result);					
					}else { // 댓글 수정 실패, fail 
						response.getWriter().append("fail");
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(uri.equals("/getPostComment.co")) { // 댓글 목록 가져오기
				int seq_post = Integer.parseInt(request.getParameter("seq_post"));
				System.out.println("seq_post : " + seq_post);
				PostCommentDAO dao = new PostCommentDAO();
				try {
					ArrayList<PostCommentDTO> list = dao.selectAll(seq_post);
					Gson gson = new Gson();
					String result = gson.toJson(list);
					response.getWriter().append(result);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(uri.equals("/report.co")) { 
				int seq_post = Integer.parseInt(request.getParameter("seq_post"));
				int seq_comment=Integer.parseInt(request.getParameter("seq_comment")); 
				MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");
				String user_category = ((MemberDTO)session.getAttribute("loginSession")).getUser_category();
				String rp_content =request.getParameter("rp_content");
				String rp_title= request.getParameter("rp_title");
				String user_id= dto1.getUser_id();
				System.out.println(seq_post +"seq_P : seq_C " + seq_comment+ " : " + user_id + " U_id:  rp_title" +rp_title+ " : rp_content"+ rp_content);
				
				PostCommentDAO dao =new PostCommentDAO();
				
				try {
				dao.reportInsert(new ReportDTO(0,"k",rp_content,user_id,0,seq_comment,seq_post,user_category));
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
				
			
			
		}
}