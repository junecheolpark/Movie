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

import com.google.gson.Gson;
import com.movieRc.dao.MpDAO;
import com.movieRc.dao.PostCommentDAO;
import com.movieRc.dao.PostDAO;
import com.movieRc.dto.LikePostDTO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dto.PostCommentDTO;
import com.movieRc.dto.PostDTO;
import com.movieRc.dto.ReportDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.po")

public class PostController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String uri =request.getRequestURI();
		System.out.println("요청 uri : " +uri);
		request.setCharacterEncoding("utf-8");
		if(uri.equals("/post.po")) {
			
			int listItem=(request.getParameter("listItem")==null)?1:Integer.parseInt(request.getParameter("listItem"));
			int curPage = Integer.parseInt(request.getParameter("curPage"));
			int listItem2=10;
			if(listItem==1) {
				listItem2=10;
			}else if(listItem==2) {
				listItem2=20;
			}else if(listItem==3) {
				listItem2=30;
			}
			System.out.println("listItem : "+listItem);
			int seq_post=0;
			String likeCountStr="";
			int likeCount=0;
			PostDAO dao = new PostDAO();
			try {
				HashMap map = dao.getPageNavi(curPage,listItem2);
				
				System.out.println("현재 페이지 : " + curPage);
				System.out.println("startNavi : " + map.get("startNavi"));
				System.out.println("endNavi : " + map.get("endNavi"));
				System.out.println("needPrev 필요? " + map.get("needPrev"));
				System.out.println("needNext 필요? " + map.get("needNext"));
				
				ArrayList<PostDTO> list = dao.selectAll(curPage*listItem2-(listItem2-1),curPage*listItem2);
				ArrayList<String> likeCountList=new ArrayList<>();
				for(PostDTO a:list) {
				  
					seq_post=a.getSeq_post();			
					likeCount =dao.pLikeCount(seq_post, 1);
					likeCountStr =Integer.toString(likeCount); 
					likeCountList.add(likeCountStr);
				}
				request.setAttribute("list", list);
				request.setAttribute("naviMap", map);
				request.setAttribute("likeCountList",likeCountList);
				request.setAttribute("listItem", listItem);
				request.getRequestDispatcher("post/post.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(uri.equals("/write.po")) {
			response.sendRedirect("post/post_write.jsp");
		}else if(uri.equals("/writeProc.po")) {
			MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
			String user_nickname=dto1.getUser_nickname();
			String user_id= dto1.getUser_id();
			String user_category = dto1.getUser_category();
			
			String p_title= request.getParameter("title");
			String p_content =request.getParameter("content");
			
			
			PostDAO dao =new PostDAO();
			try {
				int seq_post = dao.getNewSeq();
				int rs=dao.write(new PostDTO(seq_post,user_nickname,p_title,p_content,null,0,user_id,user_category));
				
				if(rs>0) {
					response.sendRedirect("/post.po?curPage=1");
				}
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
				
				request.setAttribute("dto",dto1);
				PostCommentDAO PostCommentDAO = new PostCommentDAO();
				ArrayList<PostCommentDTO> list = PostCommentDAO.selectAll(seq_post);
				//Check완료
				
				//현재 로그인한 아이디의 좋아요 싫어요 표시
				int likeValue=0;
				if(((MemberDTO)request.getSession().getAttribute("loginSession")!=null)) {
					MemberDTO logindto =(MemberDTO)request.getSession().getAttribute("loginSession");
					String user_id=logindto.getUser_id();
					System.out.println("user_id:" + user_id);
					likeValue =dao.curPLikeValue(user_id, seq_post);
				}else {
					likeValue=0;
				}
				
				
				System.out.println("likeValue : "+ likeValue);
				request.setAttribute("likeValue", likeValue);//1이면 좋아요상태,0이면표시안한상태,-1이면표시안한상태,2이면싫어요상태
				
				System.out.println("좋아요한상태? : "+likeValue);
				//dao쪽
				MpDAO mpDAO = new MpDAO();
				 
                HashMap<Integer, String> hashMap = new HashMap<>();

                String reviewer;
               
                for(int i =0; i<list.size(); i++){
                    reviewer = list.get(i).getUser_id();
                    System.out.println(reviewer);
                    if(mpDAO.exist(list.get(i).getUser_id())!=0) {
                        String profile = mpDAO.select(list.get(i).getUser_id());
                        hashMap.put(list.get(i).getseq_comment(), "/files/"+profile);
                    } else hashMap.put(list.get(i).getseq_comment(), "/images/기본프로필.jpg");
                    System.out.println(hashMap.get(list.get(i).getSeq_post()));
                }

                request.setAttribute("hashMap", hashMap);
				//좋아요 싫어요개수 얻기

				int countLike =dao.pLikeCount(seq_post, 1);
				int countHate =dao.pLikeCount(seq_post, 2);
				request.setAttribute("countLike", countLike);
				request.setAttribute("countHate", countHate);


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
				String p_title=request.getParameter("p_title");
				String p_content=request.getParameter("p_content");
				
				
				PostDAO dao =new PostDAO();
				try {
					int rs =dao.postModify(seq_post,p_title,p_content);
					response.sendRedirect("detailPost.po?seq_post="+seq_post);
				}catch(Exception e){
					e.printStackTrace();
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
					
					System.out.println(rs);
					
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
			} else if(uri.equals("/pLike.po")) {
				
				MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
				int seq_post= Integer.parseInt(request.getParameter("seq_post"));
				String user_id=dto1.getUser_id();
				String user_category=dto1.getUser_category();
				System.out.println("plike.po");
				PostDAO dao =new PostDAO();
				int rs =10;
				
				try {
					int curPLikeValue =dao.curPLikeValue(user_id, seq_post);//좋아요1,싫어요2,선택안됨0
					System.out.println("curPLikeValue의 값은: "+curPLikeValue);
					if(curPLikeValue == -1) {//값 없음
						dao.insertPostLike(user_id, seq_post, user_category);
						rs=-1;
						System.out.println("좋아요");
					}else if(curPLikeValue == 0) {//0상태
						rs =dao.updatePostLike(user_id, seq_post, user_category);
						rs=0;
						System.out.println("좋아요");
					}else if(curPLikeValue == 1) {//좋아요 한 상태
						rs =dao.updatePostCancleLike(user_id, seq_post, user_category);
						rs=1;
						System.out.println("좋아요 취소");

					}else if(curPLikeValue == 2) {//싫어요 한 상태
						
						rs =dao.updatePostLike(user_id, seq_post, user_category);
						rs=2;
						System.out.println("싫어요 취소");

					}else {
						System.out.println("잘못실행됨");
					}
					String a= Integer.toString(rs);;
					System.out.println("rs :" +a);
					int likeCount=dao.pLikeCount(seq_post, 1);
					int hateCount=dao.pLikeCount(seq_post, 2);
					String lCountStr= Integer.toString(likeCount);
					String hCountStr=Integer.toString(hateCount);
					String arr=a+"|"+lCountStr+"|"+hCountStr;
					System.out.println(arr);
					// var arr = result.split('|'); 해서 arr[0], arr[1], arr[2] 에 접근하시면 각각 a,b,c가 들어 있습니다.
					//arr[0] == data, arr[1] ==hCountStr arr[2] ==lCountStr입니다.
					response.getWriter().append(arr);
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}else if(uri.equals("/phate.po")) {
				MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
				int seq_post= Integer.parseInt(request.getParameter("seq_post"));
				String user_id=dto1.getUser_id();
				String user_category=dto1.getUser_category();
				System.out.println("hate.po");
				PostDAO dao =new PostDAO();
				int rs =10;
				try {//좋아요1,싫어요2,선택안됨0
					int curPLikeValue =dao.curPLikeValue(user_id, seq_post);//좋아요1,싫어요2,선택안됨0
					System.out.println("curPLikeValue의 값은: "+curPLikeValue);
					if(curPLikeValue == -1) {//값 없음
						dao.insertPostNotLike(user_id, seq_post, user_category);
						rs=-1;
						System.out.println("싫어요 삽입");
					}else if(curPLikeValue == 0) {//0상태
						rs =dao.updatePostNotLike(user_id, seq_post, user_category);
						rs=0;
						System.out.println("싫어요");

					}else if(curPLikeValue == 1) {//좋아요 한 상태
						rs =dao.updatePostNotLike(user_id, seq_post, user_category);
						rs=1;
						System.out.println("좋아요 취소, 싫어요");
					}else if(curPLikeValue == 2) {//좋아요 한 상태
						
						rs =dao.updatePostCancleLike(user_id, seq_post, user_category);
						rs=2;
						System.out.println("싫어요 취소 :"+rs );

					}

					String a= Integer.toString(rs);
					
					System.out.println("a :" +a);
					
					int likeCount=dao.pLikeCount(seq_post, 1);
					int hateCount=dao.pLikeCount(seq_post, 2);
					String lCountStr= Integer.toString(likeCount);
					String hCountStr=Integer.toString(hateCount);
					String arr=a+"|"+lCountStr+"|"+hCountStr;
					System.out.println(arr);
					// var arr = result.split('|'); 해서 arr[0], arr[1], arr[2] 에 접근하시면 각각 a,b,c가 들어 있습니다.
					//arr[0] == data, arr[1] ==hCountStr arr[2] ==lCountStr입니다.
					response.getWriter().append(arr);
				
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}
			else if(uri.equals("/deleteProc.po")) {
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
//			else if(uri.equals("/myPostPage.po")) {
//		         MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");//로그인섹션
//		         String user_id = dto1.getUser_id();
//
//
//		         PostDAO dao= new PostDAO();
//		         ArrayList<PostDTO> list =new ArrayList<>();
//		         try {
//
//		            list =dao.myPost(user_id);
//		            request.setAttribute("list", list);
//		            request.getRequestDispatcher("post/myPost.jsp").forward(request, response);
//		         }catch(Exception e) {
//		            e.printStackTrace();
//		         }
//		      }
			else if(uri.equals("/report.po")) {
					int seq_post = Integer.parseInt(request.getParameter("seq_post"));
					String category_check = "post";
					MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");
					String user_category = dto1.getUser_category();
					String user_id= dto1.getUser_id();
					String rp_content =request.getParameter("rp_content");
									
					System.out.println(seq_post +"seq_P : seq_C " + " : " + user_id + " U_id: "+" : rp_content"+ rp_content);
					
					PostCommentDAO dao =new PostCommentDAO();
					
					try {
					dao.reportInsert(new ReportDTO(0,category_check,rp_content,user_id,0,0,seq_post,user_category));
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
			
		}
}