package com.movieRc.controller;

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
import com.movieRc.dao.BasketDAO;
import com.movieRc.dao.Like_rDAO;
import com.movieRc.dao.MovieDAO;
import com.movieRc.dao.PostCommentDAO;
import com.movieRc.dao.ReviewDAO;
import com.movieRc.dto.Like_rDTO;
import com.movieRc.dto.Like_r_countDTO;
import com.movieRc.dto.MemberDTO;
import com.movieRc.dto.MovieDTO;
import com.movieRc.dto.ReportDTO;
import com.movieRc.dto.ReviewDTO;
import com.movieRc.util.Pagination;

@WebServlet("*.re")
public class ReviewController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        System.out.println("요청 uri : " + uri);
        MovieDAO movieDAO = new MovieDAO();
        ReviewDAO reviewDAO = new ReviewDAO();
        Pagination pagination = new Pagination();
        Like_rDAO like_rDAO = new Like_rDAO();
        BasketDAO basketDAO = new BasketDAO();
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        if (uri.equals("/write.re")) {
            HttpSession session = request.getSession();//임시
            MemberDTO dto = (MemberDTO) session.getAttribute("loginSession");

            String user_nickname = dto.getUser_nickname();
            String r_content = request.getParameter("r_content");
            System.out.println("r_content: " + r_content);
            int r_grade = Integer.parseInt(request.getParameter("r_grade"));
            System.out.println("r_grade: " + r_grade);
            String movieCd = request.getParameter("movieCd");
            System.out.println(movieCd);
            String user_id = dto.getUser_id();
            String user_category = dto.getUser_category();

            try {
                int rs = reviewDAO.write(new ReviewDTO(0, movieCd, user_id, user_category, user_nickname, r_content, null, r_grade));

                if (rs > 0) { // 댓글 등록이 제대로 이뤄졌다면
                    int seq_review = reviewDAO.writeSelect(user_id, r_content);
                    int rs1 = like_rDAO.like_insert(new Like_rDTO(0, 0, user_id, user_category, seq_review));

                    if (rs1 > 0) {
                        response.sendRedirect("/detailView.re?movieCd=" + movieCd);
                    }

                } else { // 댓글 등록에 실패했다면

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (uri.equals("/detailView.re")) { // 상세보기페이지 요청
            HttpSession session = request.getSession();//임시
            MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginSession");

            String id = null;
            String user_category = null;

            if (memberDTO != null) {
                id = memberDTO.getUser_id();
                user_category = memberDTO.getUser_category();
            }

            try {

                String movieCd = request.getParameter("movieCd");
                System.out.println(movieCd);
                String Sequence = request.getParameter("Sequence");
                System.out.println(Sequence);

                // 그영화에 좋아요 수
                int m_like_count = like_rDAO.like_allCount(movieCd);
                request.setAttribute("m_like_count", m_like_count);
                System.out.println(m_like_count);
                // 평점 몇명했는지
                int cnt = basketDAO.wishCnt(movieCd);
                request.setAttribute("cnt", cnt);
                // 평균
                Double average = reviewDAO.r_grade_average(movieCd);
                request.setAttribute("average", average);
                // 게시글에 해당하는 댓글을 가져와 담아주는 작업
                ArrayList<ReviewDTO> list = null;
                //최신,높은,낮은순
                if (Sequence == null) {
                    list = reviewDAO.selectAll(movieCd);
                } else if (Sequence.equals("low")) {
                    list = reviewDAO.lowGrade(movieCd);
                } else if (Sequence.equals("high")) {
                    list = reviewDAO.highGrade(movieCd);
                }
                System.out.println(list);


                //좋아요갯수
                ArrayList<Like_r_countDTO> like_list = like_rDAO.like_count();
                //싫어요 갯수
                ArrayList<Like_r_countDTO> hate_list = like_rDAO.hate_count();
                //like_r 전체조회
                ArrayList<Like_rDTO> all_list = like_rDAO.selectAll();
                //tbl_movie조회
                MovieDTO moviedto = movieDAO.selectBySeq(movieCd);

                request.setAttribute("reviewList", list);
                request.setAttribute("like_list", like_list);
                request.setAttribute("hate_list", hate_list);
                request.setAttribute("all_list", all_list);
                request.setAttribute("moviedto", moviedto);


            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/review_d/inquiry_d.jsp").forward(request, response);
        } else if (uri.equals("/r_delete.re")) {// 리뷰 삭제
            int seq_review = Integer.parseInt(request.getParameter("seq_review"));
            String movieCd = "movieCd";
            System.out.println("삭제 요청 seq : " + seq_review + ", movieCd : " + movieCd);


            try {
                int rs = reviewDAO.delete(seq_review);
                if (rs > 0) { // 댓글 삭제 성공, 댓글 목록 응담
                    ArrayList<ReviewDTO> list = reviewDAO.selectAll(movieCd);
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
            try {
                int rs = reviewDAO.modify(r_content, r_grade, seq_review);
                if (rs > 0) { // 댓글 수정 성공, 리스트 응답
                    ArrayList<ReviewDTO> list = reviewDAO.selectAll(movieCd);
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
            HttpSession session = request.getSession();//임시
            MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginSession");

            String id = null;
            String user_category = null;

            if (memberDTO != null) {
                id = memberDTO.getUser_id();
                user_category = memberDTO.getUser_category();
            }

            try {

                String movieCd = request.getParameter("movieCd");
                System.out.println(movieCd);
                // 평점 몇명했는지
                int cnt = reviewDAO.r_grade_count();
                request.setAttribute("cnt", cnt);
                // 평균
                Double average = reviewDAO.r_grade_average(movieCd);
                request.setAttribute("average", average);
                // 게시글에 해당하는 댓글을 가져와 담아주는 작업
                ArrayList<ReviewDTO> list = reviewDAO.selectAll(movieCd);
//  				System.out.println("list" + list);

                //좋아요갯수
                ArrayList<Like_r_countDTO> like_list = like_rDAO.like_count();
                //싫어요 갯수
                ArrayList<Like_r_countDTO> hate_list = like_rDAO.hate_count();
                //like_r 전체조회
                ArrayList<Like_rDTO> all_list = like_rDAO.selectAll();
                //tbl_movie조회
                MovieDTO moviedto = movieDAO.selectBySeq(movieCd);

                request.setAttribute("reviewList", list);
                request.setAttribute("like_list", like_list);
                request.setAttribute("hate_list", hate_list);
                request.setAttribute("all_list", all_list);
                request.setAttribute("moviedto", moviedto);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/review_d/inquiry_d.jsp").forward(request, response);
        } else if (uri.equals("/highGrade.re")) { // 높은평점순
            HttpSession session = request.getSession();//임시
            MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginSession");

            String id = null;
            String user_category = null;

            if (memberDTO != null) {
                id = memberDTO.getUser_id();
                user_category = memberDTO.getUser_category();
            }

            try {

                String movieCd = request.getParameter("movieCd");
                System.out.println(movieCd);
                // 평점 몇명했는지
                int cnt = reviewDAO.r_grade_count();
                request.setAttribute("cnt", cnt);
                // 평균
                Double average = reviewDAO.r_grade_average(movieCd);
                request.setAttribute("average", average);
                // 게시글에 해당하는 댓글을 가져와 담아주는 작업
                ArrayList<ReviewDTO> list = reviewDAO.selectAll(movieCd);
//  				System.out.println("list" + list);

                //좋아요갯수
                ArrayList<Like_r_countDTO> like_list = like_rDAO.like_count();
                //싫어요 갯수
                ArrayList<Like_r_countDTO> hate_list = like_rDAO.hate_count();
                //like_r 전체조회
                ArrayList<Like_rDTO> all_list = like_rDAO.selectAll();
                //tbl_movie조회
                MovieDTO moviedto = movieDAO.selectBySeq(movieCd);

                request.setAttribute("reviewList", list);
                request.setAttribute("like_list", like_list);
                request.setAttribute("hate_list", hate_list);
                request.setAttribute("all_list", all_list);
                request.setAttribute("moviedto", moviedto);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/review_d/inquiry_d.jsp").forward(request, response);

        } else if (uri.equals("/toReviewList.re")) {
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            HttpSession httpSession = request.getSession();
            MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("loginSession");
            String id = null;
            String user_category = null;

            if (memberDTO != null) {
                id = memberDTO.getUser_id();
                user_category = memberDTO.getUser_category();
            }

            try {
                int totalCnt = reviewDAO.getCount();
                HashMap<String, Object> hashMap = pagination.getPageNavi(totalCnt, 10, 10, curPage);
                int start = (int) hashMap.get("postStart");
                int end = (int) hashMap.get("postEnd");
                ArrayList<ReviewDTO> arrayList = reviewDAO.selectAll_ByPagination(start, end);
                HashMap<String, HashMap> movies = new HashMap<>();
                HashMap<String, Object> hashMap1;
                String movieCd;
                MovieDTO movieDTO;
                double avg;
                int count;


                //좋아요 싫어요
                int review_seq;
                HashMap<String, HashMap> likes = new HashMap<>();
                HashMap<String, Integer> likeHashMap = new HashMap<>();
                int likeCount;
                int hateCount;
                int status;

                for (int i = 0; i < arrayList.size(); i++) {
                    hashMap1 = new HashMap<>();
                    movieCd = arrayList.get(i).getMovieCd();
                    movieDTO = movieDAO.getMovieDTO_byMovieCd(movieCd);
                    count = reviewDAO.countByMovieCd(movieCd);
                    avg = reviewDAO.getAvgPoint(movieCd);
                    hashMap1.put("movieDTO", movieDTO);
                    hashMap1.put("count", count);
                    hashMap1.put("avg", avg);
                    movies.put(movieCd, hashMap1);

                    // 리뷰 좋아요 싫어요
                    likeHashMap = new HashMap<>();
                    review_seq = arrayList.get(i).getSeq_review();
                    likeCount = like_rDAO.countLike(review_seq);
                    hateCount = like_rDAO.countHate(review_seq);
                    status = like_rDAO.getStatus(id, user_category, review_seq);
                    likeHashMap.put("like", likeCount);
                    likeHashMap.put("hate", hateCount);
                    likeHashMap.put("status", status);
                    likes.put(String.valueOf(review_seq), likeHashMap);
                }


                request.setAttribute("likes", likes);
                request.setAttribute("movies", movies);
                request.setAttribute("totalCnt", totalCnt);
                request.setAttribute("arrayList", arrayList);
                request.setAttribute("hashMap", hashMap);
                System.out.println(arrayList);
                movieCd = request.getParameter("movieCd");
                MovieDTO moviedto = movieDAO.selectBySeq(movieCd);
                request.setAttribute("moviedto", moviedto);
                request.getRequestDispatcher("/review_d/reviewList.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (uri.equals("/show.re")) {
            int curPage = Integer.parseInt(request.getParameter("curPage"));
            HttpSession httpSession = request.getSession();
            MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("loginSession");
            String id = null;
            String user_category = null;

            if (memberDTO != null) {
                id = memberDTO.getUser_id();
                user_category = memberDTO.getUser_category();
            }
            String s_type = request.getParameter("s_type");
            String val = request.getParameter("val");

            ArrayList<ReviewDTO> arrayList = new ArrayList<>();
            HashMap<String, HashMap> movies = new HashMap<>();
            HashMap<String, Object> hashMap1;
            HashMap<String, Object> hashMap = new HashMap<>(); // String movieCd; MovieDTO movieDTO;
            double avg = 0;
            int count = 0;
            int totalCnt = 0;
            String movieCd;
            MovieDTO movieDTO;

            int review_seq;
            HashMap<String, HashMap> likes = new HashMap<>();
            HashMap<String, Integer> likeHashMap = new HashMap<>();
            int likeCount;
            int hateCount;
            int status;

            try {
                if (s_type.equals("genreAlt")) {
                    if (val.equals("기타")) {
                        totalCnt = reviewDAO.countEtcGenre();
                        hashMap = pagination.getPageNavi(totalCnt, 10, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = reviewDAO.selectAllgenreEtc(start, end);

                        for (int i = 0; i < arrayList.size(); i++) {

                            hashMap1 = new HashMap<>();
                            movieCd = arrayList.get(i).getMovieCd();
                            movieDTO = movieDAO.getMovieDTO_byMovieCd(movieCd);
                            count = reviewDAO.countByMovieCd(movieCd);
                            avg = reviewDAO.getAvgPoint(movieCd);
                            hashMap1.put("movieDTO", movieDTO);
                            hashMap1.put("count", count);
                            hashMap1.put("avg", avg);
                            movies.put(movieCd, hashMap1);

                            likeHashMap = new HashMap<>();
                            review_seq = arrayList.get(i).getSeq_review();
                            likeCount = like_rDAO.countLike(review_seq);
                            hateCount = like_rDAO.countHate(review_seq);
                            status = like_rDAO.getStatus(id, user_category, review_seq);
                            likeHashMap.put("like", likeCount);
                            likeHashMap.put("hate", hateCount);
                            likeHashMap.put("status", status);
                            likes.put(String.valueOf(review_seq), likeHashMap);
                        }

                    } else {
                        totalCnt = reviewDAO.countByGenre(val);
                        hashMap = pagination.getPageNavi(totalCnt, 10, 10, curPage);
                        int start = (int) hashMap.get("postStart");
                        int end = (int) hashMap.get("postEnd");
                        arrayList = reviewDAO.selectAllByGenre(val, start, end);

                        for (int i = 0; i < arrayList.size(); i++) {
                            hashMap1 = new HashMap<>();
                            movieCd = arrayList.get(i).getMovieCd();
                            movieDTO = movieDAO.getMovieDTO_byMovieCd(movieCd);
                            count = reviewDAO.countByMovieCd(movieCd);
                            avg = reviewDAO.getAvgPoint(movieCd);
                            hashMap1.put("movieDTO", movieDTO);
                            hashMap1.put("count", count);
                            hashMap1.put("avg", avg);
                            movies.put(movieCd, hashMap1);

                            likeHashMap = new HashMap<>();
                            review_seq = arrayList.get(i).getSeq_review();
                            likeCount = like_rDAO.countLike(review_seq);
                            hateCount = like_rDAO.countHate(review_seq);
                            status = like_rDAO.getStatus(id, user_category, review_seq);
                            likeHashMap.put("like", likeCount);
                            likeHashMap.put("hate", hateCount);
                            likeHashMap.put("status", status);
                            likes.put(String.valueOf(review_seq), likeHashMap);
                        }
                    }
                }

                request.setAttribute("likes", likes);
                request.setAttribute("s_type", s_type);
                request.setAttribute("val", val);
                request.setAttribute("movies", movies);
                request.setAttribute("totalCnt", totalCnt);
                request.setAttribute("arrayList", arrayList);
                request.setAttribute("hashMap", hashMap);
                request.getRequestDispatcher("/review_d/reviewList.jsp").forward(request, response);

            } catch (Exception e) {

            }


        }else if(uri.equals("/report.re")) { 
			int seq_review = Integer.parseInt(request.getParameter("seq_review"));
			String category_check = "review";
			MemberDTO dto1 =(MemberDTO)request.getSession().getAttribute("loginSession");
			String user_category = dto1.getUser_category();
			String user_id= dto1.getUser_id();
			String rp_content =request.getParameter("rp_content");
							
			System.out.println(seq_review +"seq_review :" + user_id + " U_id: "+" : rp_content"+ rp_content);
			
			PostCommentDAO dao =new PostCommentDAO();
			
			try {
			int rs =dao.reportInsert(new ReportDTO(0,category_check,rp_content,user_id,seq_review,0,0,user_category));
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		}


    }
}