package com.movieRc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.PostDTO;

public class PostDAO {
	private BasicDataSource bds;

	public PostDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}

	// 제목별 검색 함수
	public ArrayList<PostDTO> titleSearch(String title) throws Exception {
		String sql = "select * from tbl_post where p_title like '%' || ? || '%'";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, title);
			pstmt.executeUpdate();

			ResultSet rs = pstmt.executeQuery();
			ArrayList<PostDTO> list = new ArrayList<PostDTO>();
			while (rs.next()) {
				int seq_Post = rs.getInt("seq_Post");
				String user_nickname = rs.getString("user_nickname");
				String p_title = rs.getString("p_title");
				String p_content = rs.getString("p_content");
				String p_date = getStringDate(rs.getDate("p_date"));
				int p_view_count = rs.getInt("p_view_count");
				String user_id = rs.getString("user_id");
				String user_category = rs.getString("user_category");
				list.add(new PostDTO(seq_Post, user_nickname, p_title, p_content, p_date, p_view_count, user_id,
						user_category));
			}
			return list;
		}

	}
	public int delete(int seq_post) throws Exception{
		String sql = "delete from tbl_post where seq_post = ?";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setInt(1, seq_post);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	
	public PostDTO selectBySeq(int seq_post) throws Exception{
		String sql = "SELECT * FROM TBL_POST WHERE seq_post = ?";

		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setInt(1, seq_post);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
					int seq_Post = rs.getInt("seq_Post");
					String user_nickname = rs.getString("user_nickname");
					String p_title = rs.getString("p_title");
					String p_content = rs.getString("p_content");
					String p_date = getStringDate(rs.getDate("p_date"));
					int p_view_count = rs.getInt("p_view_count");
					String user_id = rs.getString("user_id");
					String user_category = rs.getString("user_category");
					PostDTO dto =new PostDTO(seq_Post, user_nickname, p_title, p_content, p_date, p_view_count, user_id,
							user_category);
							return dto;
				}
				return null;
		}
	}
	
	// 내용별 검색 함수
	public ArrayList<PostDTO> contentSearch(String content) throws Exception {
		String sql = "select * from tbl_post where p_content like '%' || ? || '%'";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, content);
			pstmt.executeUpdate();

			ResultSet rs = pstmt.executeQuery();
			ArrayList<PostDTO> list = new ArrayList<PostDTO>();
			while (rs.next()) {
				int seq_Post = rs.getInt("seq_Post");
				String user_nickname = rs.getString("user_nickname");
				String p_title = rs.getString("p_title");
				String p_content = rs.getString("p_content");
				String p_date = getStringDate(rs.getDate("p_date"));
				int p_view_count = rs.getInt("p_view_count");
				String user_id = rs.getString("user_id");
				String user_category = rs.getString("user_category");
				list.add(new PostDTO(seq_Post, user_nickname, p_title, p_content, p_date, p_view_count, user_id,
						user_category));
			}
			return list;
		}

	}

	// 글쓴이별 검색 함수
	public ArrayList<PostDTO> writerSearch(String user_id1) throws Exception {
		String sql = "select * from tbl_post where user_id like  '%' || ? || '%'";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id1);
			pstmt.executeUpdate();

			ResultSet rs = pstmt.executeQuery();
			ArrayList<PostDTO> list = new ArrayList<PostDTO>();
			while (rs.next()) {
				int seq_Post = rs.getInt("seq_Post");
				String user_nickname = rs.getString("user_nickname");
				String p_title = rs.getString("p_title");
				String p_content = rs.getString("p_content");
				String p_date = getStringDate(rs.getDate("p_date"));
				int p_view_count = rs.getInt("p_view_count");
				String user_id = rs.getString("user_id");
				String user_category = rs.getString("user_category");
				list.add(new PostDTO(seq_Post, user_nickname, p_title, p_content, p_date, p_view_count, user_id,
						user_category));
			}
			return list;
		}

	}

	// 포스트 수정함수
	public int postModify(int seq_post,String p_title, String p_content) throws Exception {
		String sql = "update tbl_post set p_title=?,p_content=? where seq_post = ?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, p_title);
			pstmt.setString(2, p_content);
			pstmt.setInt(3, seq_post);

			int rs = pstmt.executeUpdate();
			return rs;
		}

	}

	// view_count함수
	public void updateView_count(int seq_board) throws Exception {
		String sql = "update tbl_post set p_view_count = p_view_count+1 where seq_post = ?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, seq_board);
			pstmt.executeUpdate();
		}
	}

	// 해당 글 번호 함수
	public PostDTO getPost(int seq_board) throws Exception {
		String sql = "select * from tbl_post where seq_post =? ";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, seq_board);
			pstmt.executeUpdate();

			ResultSet rs = pstmt.executeQuery();

			rs.next();
			int seq_Post = rs.getInt("seq_Post");
			String user_nickname = rs.getString("user_nickname");
			String p_title = rs.getString("p_title");
			String p_content = rs.getString("p_content");
			String p_date = getStringDate(rs.getDate("p_date"));
			int p_view_count = rs.getInt("p_view_count");
			String user_id = rs.getString("user_id");
			String user_category = rs.getString("user_category");
			return new PostDTO(seq_Post, user_nickname, p_title, p_content, p_date, p_view_count, user_id,
					user_category);
		}
	}

	// 내 글 보기 함수
	public ArrayList<PostDTO> myPost(String user_id1) throws Exception {
		String sql = "select * from tbl_post where user_id =? ";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id1);
			pstmt.executeUpdate();

			ResultSet rs = pstmt.executeQuery();
			ArrayList<PostDTO> list = new ArrayList<PostDTO>();
			while (rs.next()) {
				int seq_Post = rs.getInt("seq_Post");
				String user_nickname = rs.getString("user_nickname");
				String p_title = rs.getString("p_title");
				String p_content = rs.getString("p_content");
				String p_date = getStringDate(rs.getDate("p_date"));
				int p_view_count = rs.getInt("p_view_count");
				String user_id = rs.getString("user_id");
				String user_category = rs.getString("user_category");
				list.add(new PostDTO(seq_Post, user_nickname, p_title, p_content, p_date, p_view_count, user_id,
						user_category));
			}
			return list;
		}

	}

	// 현재가지고있는 시퀀스의 다음순서
	public int getNewSeq() throws Exception {
		String sql = "select SEQ_POST.nextval from dual";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int seq_post = rs.getInt(1);
			return seq_post;
		}
	}


	// 선택안함 =0,좋아요=1,싫어요=2
	//좋아요 싫어요 구간

	public int curPLikeValue(String user_id, int seq_post) throws Exception{
		String sql = "select p_like_check from tbl_like_p where user_id=? AND seq_post=? ";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_post);
			ResultSet rs = pstmt.executeQuery();

			int rsValue=-1;
			if(rs.next()) {
				rsValue=rs.getInt("p_like_check");
			}


			return rsValue;
		}
	}
	//좋아요 삽입
	public int insertPostLike (String user_id, int seq_post, String user_category) throws Exception {
		String sql = "insert into tbl_like_p values(seq_like.nextval,1,?,?,?)";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_post);
			pstmt.setString(3, user_category);
			int rs = pstmt.executeUpdate();


			return rs;

		}
	}

	
	// 선택안함 =0,좋아요=1,싫어요=2
	//좋아요 업데이트
	public int updatePostLike(String user_id, int seq_post, String user_category) throws Exception {
		String sql = "update tbl_like_p set p_like_check=1 where user_id=? AND seq_post=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_post);
			
				pstmt.setString(1, user_id);
				pstmt.setInt(2, seq_post);
				int rs = pstmt.executeUpdate();
				return rs;
			
		}
	}
//싫어요 삽입
	public int insertPostNotLike(String user_id, int seq_post, String user_category) throws Exception {
		String sql = "insert into tbl_like_p values(seq_like.nextval,2,?,?,?)";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			
				pstmt.setString(1, user_id);
				pstmt.setInt(2, seq_post);
				pstmt.setString(3, user_category);
				int rs = pstmt.executeUpdate();

				return rs;

			}
		}
	//p_like_check =1좋아요,2싫어요 개수
	public int pLikeCount(int seq_post,int p_like_check) throws Exception { 
		String sql = "select count(*) from tbl_like_p where seq_post=? and p_like_check=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			
				pstmt.setInt(1, seq_post);
				pstmt.setInt(2, p_like_check);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int result =rs.getInt(1);
				return result;
			
		}
	}
	
	// 선택안함 =0,좋아요=1,싫어요=2
	////싫어요 업데이트
	public int updatePostNotLike(String user_id, int seq_post, String user_category) throws Exception {
		String sql = "update tbl_like_p set p_like_check=2 where user_id=? AND seq_post=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_post);
			
				pstmt.setString(1, user_id);
				pstmt.setInt(2, seq_post);
				int rs = pstmt.executeUpdate();
				return rs;
			
		}
	}
	//취소 업데이트
	public int updatePostCancleLike(String user_id, int seq_post, String user_category) throws Exception {
		String sql = "update tbl_like_p set p_like_check=0 where user_id=? AND seq_post=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, user_id);
			pstmt.setInt(2, seq_post);
			
				pstmt.setString(1, user_id);
				pstmt.setInt(2, seq_post);
				int rs = pstmt.executeUpdate();
				int p_like_check=0;
				return p_like_check;
			
		}
	}
	
	// 시퀀스번호,유저닉네임,제목,내용,뷰카운트,유저아이디,유저카테고리
	public int write(PostDTO dto) throws Exception {
		String sql = "insert into tbl_post values(?,?,?,?,sysdate,?,?,?)";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, dto.getSeq_post());
			pstmt.setString(2, dto.getUser_nickname());
			pstmt.setString(3, dto.getP_title());
			pstmt.setString(4, dto.getP_content());
			pstmt.setInt(5, dto.getP_view_count());
			pstmt.setString(6, dto.getUser_id());
			pstmt.setString(7, dto.getUser_category());

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	public String getStringDate(Date date) {
		// 1900년 02월 02일 00시 00분 00초
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sdf.format(date);
	}

	// 모든 글 보기 함수
	public ArrayList<PostDTO> selectAll(int start, int end) throws Exception {

		String sql = "select * from (select tbl_Post.*, row_number() over(order by seq_post desc) as num from tbl_post)"
				+ " where num between ? and ?";

		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<PostDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq_Post = rs.getInt("seq_Post");
				String user_nickname = rs.getString("user_nickname");
				String p_title = rs.getString("p_title");
				String p_content = rs.getString("p_content");
				String p_date = getStringDate(rs.getDate("p_date"));
				int p_view_count = rs.getInt("p_view_count");
				String user_id = rs.getString("user_id");
				String user_category = rs.getString("user_category");
				list.add(new PostDTO(seq_Post, user_nickname, p_title, p_content, p_date, p_view_count, user_id,
						user_category));
			}
			return list;
		}
	}

	// 글 목록 정리 함수
	public HashMap<String, Object> getPageNavi(int curPage,int perPage) throws Exception {
		String sql = "select count(*) as totalCnt from tbl_post";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();
			rs.next();

			int totalCnt = rs.getInt("totalCnt"); // 전체 게시글의 개수
			int recordCntPerPage = perPage; // 한 페이지에 몇개의 데이터(게시글)을 띄워줄지
			int naviCntPerPage = 5; // 네비바에 몇개 단위로 페이징을 구성할지
			int pageTotalCnt = 0; // 총 몇 페이지가 나올지

			/*
			 * 현재 DB에 148개의 게시글 148개의 게시글 기준으로 10개씩 페이징을 해준다면 총 15개의 페이지가 나와야함. *
			 * pageTotalCtn = 15;
			 * 
			 * 148 / 10 = 14페이지 + 1 = 15페이지 140 / 10 = 14 + 1 = 15... -> 올바르지 않은 값이 됨
			 * 
			 * 총 페이지의 개수를 구하는 것.
			 */
			if (totalCnt % recordCntPerPage > 0) { // 나머지가 생김(10의 배수가 아님x)
				pageTotalCnt = totalCnt / recordCntPerPage + 1;
			} else {
				pageTotalCnt = totalCnt / recordCntPerPage;
			}

			/*
			 * 현재 페이지는 반드시 1 이상 현재 페이지는 총 페이지의 개수를 넘어갈 수 없음
			 */
			if (curPage < 1) { // 현재 페이지가 0이거나 혹은 음수일때
				curPage = 1; // 무조건 첫페이지로 맞춰주기
			} else if (curPage > pageTotalCnt) { // 현재 페이지가 총 페이지 수보다 크다면
				curPage = pageTotalCnt; // 무조건 마지막 페이지로 맞춰주기
			}

			int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
			int endNavi = startNavi + naviCntPerPage - 1;

			// endNavi가 전체페이지를 넘어갈 수 없음
			if (pageTotalCnt < endNavi) { // endNavi가 전체 페이지수보다 크다면
				endNavi = pageTotalCnt; // endNavi를 마지막 페이지로 수정해주겠다.
			}

			// < > 모양을 넣어줄지 여부에 대한 검사
			boolean needPrev = true; // startNavi가 1일때 needPrev가 false
			boolean needNext = true; // endNavi가 마지막 페이지(전체 페이지)와 같을때 needNext가 false

			if (startNavi == 1) {
				needPrev = false;
			}
			if (endNavi == pageTotalCnt) {
				needNext = false;
			}

			// map -> key, value
			// 제네릭 <키에 대한 자료형, 값에 대한 자료형>
			HashMap<String, Object> map = new HashMap<>();
			map.put("startNavi", startNavi);
			map.put("endNavi", endNavi);
			map.put("needPrev", needPrev);
			map.put("needNext", needNext);

			return map;
		}

	}
}