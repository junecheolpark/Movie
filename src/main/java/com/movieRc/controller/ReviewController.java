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
import com.movieRc.dao.Like_rDAO;
import com.movieRc.dao.MemberDAO;
import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.Like_rDTO;
import com.movieRc.dto.Like_r_countDTO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dto.ReviewDTO;

@WebServlet("*.re")
public class ReviewController extends HttpServlet {
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
		MovieDAO movieDAO = new MovieDAO();
		ReviewDAO reviewDAO = new ReviewDAO();
//		Pagination pagination = new Pagination();
		Like_rDAO like_rDAO = new Like_rDAO();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		if (uri.equals("/write.re")) {
			HttpSession session = request.getSession();//임시
			MemberDTO dto = (MemberDTO)session.getAttribute("loginSession");
			
			String user_nickname = dto.getUser_nickname();
			String r_content = request.getParameter("r_content");
			System.out.println("r_content: " + r_content);
			int r_grade = Integer.parseInt(request.getParameter("r_grade"));
			System.out.println("r_grade: " + r_grade);
			String movieCd = "movieCd";
			String user_id = dto.getUser_id();
			String user_category = dto.getUser_category();

			ReviewDAO dao = new ReviewDAO();
			Like_rDAO ldao = new Like_rDAO();
			try {
				int rs = dao.write(
						new ReviewDTO(0, user_nickname, r_content, null, r_grade, movieCd, user_id, user_category));

				if (rs > 0) { // 댓글 등록이 제대로 이뤄졌다면
					int seq_review = dao.writeSelect(user_id, r_content);
					int rs1 = ldao.like_insert(new Like_rDTO(0, 0, user_id, seq_review, user_category));
					
					if (rs1 > 0) {
						response.sendRedirect("/detailView.re");
					}

				} else { // 댓글 등록에 실패했다면

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/detailView.re")) { // 상세보기페이지 요청
			HttpSession session = request.getSession();//임시
			MemberDTO dto = (MemberDTO)session.getAttribute("loginSession");
			if(dto==null) {
				System.out.println("아이디 값 임의로 설정");
				String user_id = "asd123";
				String user_pw = "asd123";
				System.out.println(user_id + " : "+ user_pw);
			}else {
				String user_id = dto.getUser_id();
				String user_pw = dto.getUser_pw();
				System.out.println(user_id + " : "+ user_pw);
			}
			
			
			ReviewDAO rdao = new ReviewDAO();
			Like_rDAO ldao = new Like_rDAO();
			try {

				/**/ // 임시로
				String movieCd = "movieCd";
				/**/

				// 평점 몇명했는지
				int cnt = rdao.r_grade_count();
				request.setAttribute("cnt", cnt);
				// 평균
				Double average = rdao.r_grade_average();
				request.setAttribute("average", average);
				// 게시글에 해당하는 댓글을 가져와 담아주는 작업
				ArrayList<ReviewDTO> list = rdao.selectAll(movieCd);
//				System.out.println("list" + list);
				
				//좋아요갯수
				ArrayList<Like_r_countDTO> like_list = ldao.like_count();
				//싫어요 갯수
				ArrayList<Like_r_countDTO> hate_list = ldao.hate_count();
				
				ArrayList<Like_rDTO> all_list = ldao.selectAll();
//				System.out.println("all_list" + all_list);

				request.setAttribute("reviewList", list);
				request.setAttribute("like_list", like_list);
				request.setAttribute("hate_list", hate_list);
				request.setAttribute("all_list", all_list);
				

			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/review_d/inquiry_d.jsp").forward(request, response);
		} else if (uri.equals("/r_delete.re")) {// 리뷰 삭제
			int seq_review = Integer.parseInt(request.getParameter("seq_review"));
			String movieCd = "movieCd";
			System.out.println("삭제 요청 seq : " + seq_review + ", movieCd : " + movieCd);
			ReviewDAO rdao = new ReviewDAO();

			try {
				int rs = rdao.delete(seq_review);
				if (rs > 0) { // 댓글 삭제 성공, 댓글 목록 응담
					ArrayList<ReviewDTO> list = rdao.selectAll(movieCd);
					Gson gson = new Gson();
					String result = gson.toJson(list);
					response.getWriter().append(result);
				} else { // 댓글 삭제 실패, fail
					response.getWriter().append("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/r_modify.re")) { // 리뷰수정
			int seq_review = Integer.parseInt(request.getParameter("seq_review"));
			String movieCd = "movieCd";
			String r_content = request.getParameter("r_content");
			int r_grade = Integer.parseInt(request.getParameter("r_grade"));

			System.out.println(seq_review + " : " + movieCd + " : " + r_content + " : " + r_grade);
			ReviewDAO rdao = new ReviewDAO();
			try {
				int rs = rdao.modify(r_content, r_grade, seq_review);
				if (rs > 0) { // 댓글 수정 성공, 리스트 응답
					ArrayList<ReviewDTO> list = rdao.selectAll(movieCd);
					Gson gson = new Gson();
					String result = gson.toJson(list);
					response.getWriter().append(result);
				} else { // 댓글 수정 실패, fail
					response.getWriter().append("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/lowGrade.re")) { // 낮은 평점순
			String movieCd = "movieCd";
			System.out.println("movieCd : " + movieCd);
			ReviewDAO rdao = new ReviewDAO();
			Like_rDAO ldao = new Like_rDAO();
			try {

				// 평점 몇명했는지
				int cnt = rdao.r_grade_count();
				request.setAttribute("cnt", cnt);
				// 평균
				Double average = rdao.r_grade_average();
				request.setAttribute("average", average);

				// 게시글에 해당하는 댓글을 가져와 담아주는 작업
				ArrayList<ReviewDTO> list = rdao.lowGrade(movieCd);

				ArrayList<Like_r_countDTO> like_list = ldao.like_count();
				System.out.println("like_list" + like_list);

				ArrayList<Like_r_countDTO> hate_list = ldao.hate_count();
			
				ArrayList<Like_rDTO> all_list = ldao.selectAll();
//				System.out.println("all_list" + all_list);

				request.setAttribute("reviewList", list);
				request.setAttribute("like_list", like_list);
				request.setAttribute("hate_list", hate_list);
				request.setAttribute("all_list", all_list);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/review_d/inquiry_d.jsp").forward(request, response);
		} else if (uri.equals("/highGrade.re")) { // 높은평점순
			String movieCd = "movieCd";
			System.out.println("movieCd : " + movieCd);
			ReviewDAO rdao = new ReviewDAO();
			Like_rDAO ldao = new Like_rDAO();
			try {

				// 평점 몇명했는지
				int cnt = rdao.r_grade_count();
				request.setAttribute("cnt", cnt);
				// 평균
				Double average = rdao.r_grade_average();
				request.setAttribute("average", average);

				// 게시글에 해당하는 댓글을 가져와 담아주는 작업
				ArrayList<ReviewDTO> list = rdao.highGrade(movieCd);
				
				ArrayList<Like_r_countDTO> like_list = ldao.like_count();
				System.out.println("like_list" + like_list);

				ArrayList<Like_r_countDTO> hate_list = ldao.hate_count();
				System.out.println("hate_list" + hate_list);
				
				ArrayList<Like_rDTO> all_list = ldao.selectAll();
//				System.out.println("all_list" + all_list);

				request.setAttribute("reviewList", list);
				request.setAttribute("like_list", like_list);
				request.setAttribute("hate_list", hate_list);
				request.setAttribute("all_list", all_list);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/review_d/inquiry_d.jsp").forward(request, response);
		} /*
			 * if (uri.equals("/toReviewList.re")) { int curPage =
			 * Integer.parseInt(request.getParameter("curPage")); HttpSession httpSession =
			 * request.getSession(); MemberDTO memberDTO = (MemberDTO)
			 * httpSession.getAttribute("loginSession"); String id = null; String
			 * user_category = null;
			 * 
			 * if(memberDTO!=null){ id = memberDTO.getUser_id(); user_category =
			 * memberDTO.getUser_category(); }
			 * 
			 * try{ int totalCnt = reviewDAO.getCount(); HashMap<String, Object> hashMap =
			 * pagination.getPageNavi(totalCnt,10,10, curPage); int start = (int)
			 * hashMap.get("postStart"); int end = (int) hashMap.get("postEnd");
			 * ArrayList<ReviewDTO> arrayList = reviewDAO.selectAll(start,end);
			 * HashMap<String, HashMap> movies = new HashMap<>(); HashMap<String, Object>
			 * hashMap1; // String movieCd; MovieDTO movieDTO; double avg; int count;
			 * 
			 * //좋아요 싫어요 int review_seq; HashMap<String, HashMap> likes = new HashMap<>();
			 * HashMap<String, Integer> likeHashMap = new HashMap<>(); int likeCount; int
			 * hateCount; int status;
			 * 
			 * for(int i=0; i<arrayList.size(); i++){ hashMap1 = new HashMap<>(); movieCd =
			 * arrayList.get(i).getMovieCd(); movieDTO =
			 * movieDAO.getMovieDTO_byMovieCd(movieCd); count =
			 * reviewDAO.countByMovieCd(movieCd); avg = reviewDAO.getAvgPoint(movieCd);
			 * hashMap1.put("movieDTO", movieDTO); hashMap1.put("count", count);
			 * hashMap1.put("avg", avg); movies.put(movieCd, hashMap1);
			 * 
			 * // 리뷰 좋아요 싫어요 likeHashMap = new HashMap<>(); review_seq =
			 * arrayList.get(i).getSeq_review(); likeCount =
			 * like_rDAO.countLike(review_seq); hateCount = like_rDAO.countHate(review_seq);
			 * status = like_rDAO.getStatus(id,user_category,review_seq);
			 * likeHashMap.put("like", likeCount); likeHashMap.put("hate", hateCount);
			 * likeHashMap.put("status", status);
			 * likes.put(String.valueOf(review_seq),likeHashMap); }
			 * 
			 * request.setAttribute("likes", likes); request.setAttribute("movies", movies);
			 * request.setAttribute("totalCnt", totalCnt); request.setAttribute("arrayList",
			 * arrayList); request.setAttribute("hashMap", hashMap);
			 * request.getRequestDispatcher("/review_d/reviewList.jsp").forward(request,
			 * response);
			 * 
			 * } catch (Exception e){ e.printStackTrace(); } } else if
			 * (uri.equals("/show.re")){ int curPage =
			 * Integer.parseInt(request.getParameter("curPage")); HttpSession httpSession =
			 * request.getSession(); MemberDTO memberDTO = (MemberDTO)
			 * httpSession.getAttribute("loginSession"); String id = memberDTO.getUser_id();
			 * String user_category = memberDTO.getUser_category(); String s_type =
			 * request.getParameter("s_type"); String val = request.getParameter("val");
			 * 
			 * ArrayList<ReviewDTO> arrayList = new ArrayList<>(); HashMap<String, HashMap>
			 * movies = new HashMap<>(); HashMap<String, Object> hashMap1; HashMap<String,
			 * Object> hashMap = new HashMap<>(); // String movieCd; MovieDTO movieDTO;
			 * double avg = 0; int count = 0; int totalCnt = 0;
			 * 
			 * int review_seq; HashMap<String, HashMap> likes = new HashMap<>();
			 * HashMap<String, Integer> likeHashMap = new HashMap<>(); int likeCount; int
			 * hateCount; int status;
			 * 
			 * try { if(s_type.equals("genreAlt")){ if(val.equals("기타")){ totalCnt =
			 * reviewDAO.countEtcGenre(); hashMap = pagination.getPageNavi(totalCnt,10,10,
			 * curPage); int start = (int) hashMap.get("postStart"); int end = (int)
			 * hashMap.get("postEnd"); arrayList = reviewDAO.selectAllgenreEtc(start,end);
			 * 
			 * for(int i=0; i<arrayList.size(); i++){ hashMap1 = new HashMap<>(); movieCd =
			 * arrayList.get(i).getMovieCd(); movieDTO =
			 * movieDAO.getMovieDTO_byMovieCd(movieCd); count =
			 * reviewDAO.countByMovieCd(movieCd); avg = reviewDAO.getAvgPoint(movieCd);
			 * hashMap1.put("movieDTO", movieDTO); hashMap1.put("count", count);
			 * hashMap1.put("avg", avg); movies.put(movieCd, hashMap1);
			 * 
			 * likeHashMap = new HashMap<>(); review_seq = arrayList.get(i).getSeq_review();
			 * likeCount = like_rDAO.countLike(review_seq); hateCount =
			 * like_rDAO.countHate(review_seq); status =
			 * like_rDAO.getStatus(id,user_category,review_seq); likeHashMap.put("like",
			 * likeCount); likeHashMap.put("hate", hateCount); likeHashMap.put("status",
			 * status); likes.put(String.valueOf(review_seq),likeHashMap); }
			 * 
			 * } else { totalCnt = reviewDAO.countByGenre(val); hashMap =
			 * pagination.getPageNavi(totalCnt,10,10, curPage); int start = (int)
			 * hashMap.get("postStart"); int end = (int) hashMap.get("postEnd"); arrayList =
			 * reviewDAO.selectAllByGenre(val,start,end);
			 * 
			 * for(int i=0; i<arrayList.size(); i++){ hashMap1 = new HashMap<>(); movieCd =
			 * arrayList.get(i).getMovieCd(); movieDTO =
			 * movieDAO.getMovieDTO_byMovieCd(movieCd); count =
			 * reviewDAO.countByMovieCd(movieCd); avg = reviewDAO.getAvgPoint(movieCd);
			 * hashMap1.put("movieDTO", movieDTO); hashMap1.put("count", count);
			 * hashMap1.put("avg", avg); movies.put(movieCd, hashMap1);
			 * 
			 * likeHashMap = new HashMap<>(); review_seq = arrayList.get(i).getSeq_review();
			 * likeCount = like_rDAO.countLike(review_seq); hateCount =
			 * like_rDAO.countHate(review_seq); status =
			 * like_rDAO.getStatus(id,user_category,review_seq); likeHashMap.put("like",
			 * likeCount); likeHashMap.put("hate", hateCount); likeHashMap.put("status",
			 * status); likes.put(String.valueOf(review_seq),likeHashMap); } } }
			 * 
			 * request.setAttribute("likes", likes); request.setAttribute("s_type", s_type);
			 * request.setAttribute("val", val); request.setAttribute("movies", movies);
			 * request.setAttribute("totalCnt", totalCnt); request.setAttribute("arrayList",
			 * arrayList); request.setAttribute("hashMap", hashMap);
			 * request.getRequestDispatcher("/review_d/reviewList.jsp").forward(request,
			 * response);
			 * 
			 * } catch (Exception e) {
			 * 
			 * }
			 * 
			 * 
			 * }
			 */

	}
}