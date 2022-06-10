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
			//로그인세션 (참고용)
			/*
			HttpSession session=request.getSession();
			MemberDTO dto = new MemberDTO("abc123", "kakao", "k","abc123","뚱이",
					"김뚱이", 198084, "010-151","서울시우체국","국도123","우리집앞",
					"내친구집","3학년");
			session.setAttribute("loginSession", dto);
			*/
			HttpSession session = request.getSession();//임시
			 MemberDTO dto = (MemberDTO) session.getAttribute("loginSession");
		       
		        if (dto == null) {
					response.sendRedirect("/Member/login.jsp");
				} else {
					
				}
			
			String uri =request.getRequestURI();
			System.out.println("요청 uri : " +uri);
			request.setCharacterEncoding("utf-8");
			if(uri.equals("/insert.co")) {//post_comment 삽입 
				int seq_post=Integer.parseInt(request.getParameter("seq_post"));
				String user_nickname = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname();
				String comment_content =request.getParameter("comment_content");
				String user_id=((MemberDTO)session.getAttribute("loginSession")).getUser_id();
				
				PostCommentDAO dao =new PostCommentDAO();
				try {
					
					int rs =dao.insert(new PostCommentDTO(0,user_nickname,null,comment_content,user_id,seq_post,"kakao"));
					if(rs>0) {
						ArrayList<PostCommentDTO> list= dao.selectAll(seq_post);
						Gson gson =new Gson();
						String result =gson.toJson(list);
						response.getWriter().append(result);
						
					}else {
						response.getWriter().append("fail");
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}else if(uri.equals("/deleteProc.co")) { //댓글 삭제 요청
				int seq_post_comment = Integer.parseInt(request.getParameter("seq_post_comment"));
				int seq_post = Integer.parseInt(request.getParameter("seq_post"));
				
				System.out.println("삭제 요청 seq : "+ seq_post_comment +", seq_board : " + seq_post);
				PostCommentDAO dao = new PostCommentDAO();
				
				try {
					int rs = dao.delete(seq_post_comment);
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
				int seq_post_comment = Integer.parseInt(request.getParameter("seq_post_comment"));
				int seq_post = Integer.parseInt(request.getParameter("seq_post"));
				String comment_content = request.getParameter("comment_content");
				
				System.out.println(seq_post_comment + " : " + seq_post + " : " + comment_content);
				PostCommentDAO dao = new PostCommentDAO();
				try {
					int rs = dao.modify(new PostCommentDTO(seq_post_comment,null,null , comment_content, null,seq_post,null));
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
				int seq_post_comment=Integer.parseInt(request.getParameter("seq_post_comment")); 
				MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");
				String rp_content =request.getParameter("rp_content");
				String rp_title= request.getParameter("rp_title");
				String user_id= dto1.getUser_id();
				System.out.println(seq_post +"seq_P : seq_C " + seq_post_comment+ " : " + user_id + " U_id:  rp_title" +rp_title+ " : rp_content"+ rp_content);
				
				PostCommentDAO dao =new PostCommentDAO();
				
				try {
				dao.reportInsert(new ReportDTO(0,"k",rp_content,user_id,0,seq_post_comment,seq_post,"kakao"));	
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(uri.equals("/p_c_Like.co")) {
				
				MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
				int seq_post_comment= Integer.parseInt(request.getParameter("seq_post_comment"));
				System.out.println(seq_post_comment);
				String user_id=dto1.getUser_id();
				String user_category=dto1.getUser_category();
				System.out.println("p_c_like.co");
				PostCommentDAO dao =new PostCommentDAO();
				int rs =10;
				
				try {
					int curPLikeValue =dao.curPLikeValue(user_id, seq_post_comment);//좋아요1,싫어요2,선택안됨0
					System.out.println("curPLikeValue의 값은: "+curPLikeValue);
					if(curPLikeValue == -1) {//값 없음
						dao.insertPostLike(user_id, seq_post_comment, user_category);
						rs=-1;
						System.out.println("좋아요");
					}else if(curPLikeValue == 0) {//0상태
						rs =dao.updatePostLike(user_id, seq_post_comment, user_category);
						rs=0;
						System.out.println("좋아요");
					}else if(curPLikeValue == 1) {//좋아요 한 상태
						rs =dao.updatePostCancleLike(user_id, seq_post_comment, user_category);
						rs=1;
						System.out.println("좋아요 취소");
					}else if(curPLikeValue == 2) {//싫어요 한 상태
						rs=2;
						rs =dao.updatePostLike(user_id, seq_post_comment, user_category);
						System.out.println("싫어요 취소");
						System.out.println("좋아요");
					}else {
						System.out.println("잘못실행됨");
					}
					String a= Integer.toString(rs);;
					System.out.println("rs :" +a);
					int c_likeCount=dao.pLikeCount(seq_post_comment, 1);
					int c_hateCount=dao.pLikeCount(seq_post_comment, 2);
					String c_lCountStr= Integer.toString(c_likeCount);
					String c_hCountStr=Integer.toString(c_hateCount);
					String arr=a+"|"+c_lCountStr+"|"+c_hCountStr;
					System.out.println(arr);
					// var arr = result.split('|'); 해서 arr[0], arr[1], arr[2] 에 접근하시면 각각 a,b,c가 들어 있습니다.
					//arr[0] == data, arr[1] ==hCountStr arr[2] ==lCountStr입니다.
					response.getWriter().append(arr);
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}else if(uri.equals("/p_c_hate.co")) {
				MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
				int seq_post_comment= Integer.parseInt(request.getParameter("seq_post_comment"));
				String user_id=dto1.getUser_id();
				String user_category=dto1.getUser_category();
				System.out.println("p_c_hate.co");
				PostCommentDAO dao =new PostCommentDAO();
				int rs =10;
				try {//좋아요1,싫어요2,선택안됨0
					int curPLikeValue =dao.curPLikeValue(user_id, seq_post_comment);//좋아요1,싫어요2,선택안됨0
					System.out.println("curPLikeValue의 값은: "+curPLikeValue);
					if(curPLikeValue == -1) {//값 없음
						dao.insertPostNotLike(user_id, seq_post_comment, user_category);
						rs=-1;
						System.out.println("싫어요 삽입");
					}else if(curPLikeValue == 0) {//0상태
						rs =dao.updatePostNotLike(user_id, seq_post_comment, user_category);
						rs=0;
						System.out.println("싫어요");

					}else if(curPLikeValue == 1) {//좋아요 한 상태
						rs =dao.updatePostNotLike(user_id,seq_post_comment, user_category);
						rs=1;
						System.out.println("좋아요 취소, 싫어요");
					}else if(curPLikeValue == 2) {//좋아요 한 상태
						
						rs =dao.updatePostCancleLike(user_id, seq_post_comment, user_category);
						rs=2;
						System.out.println("싫어요 취소 :"+rs );

					}else if(curPLikeValue == 1) {//싫어요 한 상태
						rs =dao.updatePostCancleLike(user_id, seq_post_comment, user_category);
						rs=1;
						System.out.println("싫어요 취소");
					}else if(curPLikeValue == 2) {//좋아요 한 상태
						rs=2;
						rs =dao.updatePostCancleLike(user_id, seq_post_comment, user_category);
						System.out.println("좋아요 취소");
						System.out.println("싫어요");

					}
				
					String a= Integer.toString(rs);
					
					System.out.println("a :" +a);
					
					int c_likeCount=dao.pLikeCount(seq_post_comment, 1);
					int c_hateCount=dao.pLikeCount(seq_post_comment, 2);
					String c_lCountStr= Integer.toString(c_likeCount);
					String c_hCountStr=Integer.toString(c_hateCount);
					String arr=a+"|"+c_lCountStr+"|"+c_hCountStr;
					System.out.println(arr);
					// var arr = result.split('|'); 해서 arr[0], arr[1], arr[2] 에 접근하시면 각각 a,b,c가 들어 있습니다.
					//arr[0] == data, arr[1] ==hCountStr arr[2] ==lCountStr입니다.
					response.getWriter().append(arr);
				
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}
			
		}
}