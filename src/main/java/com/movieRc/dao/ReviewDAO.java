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

import com.movieRc.dto.ReviewDTO;
import com.movieRc.util.DateParse;


public class ReviewDAO {
    private BasicDataSource bds;

    public ReviewDAO() {
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

    //영화번호를 통한 tbl_review 조회
    public ArrayList<ReviewDTO> selectAll(String movieCd) throws Exception {
        String sql = "select * from tbl_review where movieCd = ? order by 1 desc";
        try (Connection con = bds.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, movieCd);
            ResultSet rs = pstmt.executeQuery();

            ArrayList<ReviewDTO> list = new ArrayList<>();
            while (rs.next()) {
                int seq_review = rs.getInt("seq_review");
                String user_nickname = rs.getString("user_nickname");
                String r_content = rs.getString("r_content");
                String r_date = getStringDate(rs.getDate("r_date"));
                int r_grade = rs.getInt("r_grade");
                String user_id = rs.getString("user_id");
                String user_category = rs.getString("user_category");
                list.add(new ReviewDTO(seq_review,movieCd,user_id,user_category,user_nickname,r_content,r_date,r_grade));
            }
            return list;
        }
    }

    //높은 평점순
    public ArrayList<ReviewDTO> highGrade(String movieCd) throws Exception {
        String sql = "select * from tbl_review where movieCd = ? order by r_grade desc";
        try (Connection con = bds.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, movieCd);
            ResultSet rs = pstmt.executeQuery();

            ArrayList<ReviewDTO> list = new ArrayList<>();
            while (rs.next()) {
                int seq_review = rs.getInt("seq_review");
                String user_nickname = rs.getString("user_nickname");
                String r_content = rs.getString("r_content");
                String r_date = getStringDate(rs.getDate("r_date"));
                int r_grade = rs.getInt("r_grade");
                String user_id = rs.getString("user_id");
                String user_category = rs.getString("user_category");
                list.add(new ReviewDTO(seq_review,movieCd,user_id,user_category,user_nickname,r_content,r_date,r_grade));
            }
            return list;
        }
    }

    //낮은 평점순
    public ArrayList<ReviewDTO> lowGrade(String movieCd) throws Exception {
        String sql = "select * from tbl_review where movieCd = ? order by r_grade";
        try (Connection con = bds.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, movieCd);
            ResultSet rs = pstmt.executeQuery();

            ArrayList<ReviewDTO> list = new ArrayList<>();
            while (rs.next()) {
                int seq_review = rs.getInt("seq_review");
                String user_nickname = rs.getString("user_nickname");
                String r_content = rs.getString("r_content");
                String r_date = getStringDate(rs.getDate("r_date"));
                int r_grade = rs.getInt("r_grade");
                String user_id = rs.getString("user_id");
                String user_category = rs.getString("user_category");
                list.add(new ReviewDTO(seq_review,movieCd,user_id,user_category,user_nickname,r_content,r_date,r_grade));
            }
            return list;
        }
    }

    //리뷰작성
    public int write(ReviewDTO dto) throws Exception {
        String sql = "insert into tbl_review values(seq_review.nextval, ?,?,?,?,?,sysdate,?)";


        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, dto.getMovieCd());
            pstmt.setString(2, dto.getUser_id());
            pstmt.setString(3, dto.getUser_category());
            pstmt.setString(4, dto.getUser_nickname());
            pstmt.setString(5, dto.getR_content());
            pstmt.setInt(6,dto.getR_grade());


            int rs = pstmt.executeUpdate();

            return rs;
        }
    }

    public int writeSelect(String user_id, String r_content) throws Exception {
        String sql = "select seq_review from tbl_review where user_id = ? and r_content=? order by 1 desc";


        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, user_id);
            pstmt.setString(2, r_content);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int seq_review = rs.getInt(1);
                return seq_review;
            }
            return 0;
        }
    }

    //수정
    public int modify(String r_content, int r_grade, int seq_review) throws Exception {
        String sql = "update tbl_review set r_content=?, r_grade=? where seq_review = ?";
        try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, r_content);
            pstmt.setInt(2, r_grade);
            pstmt.setInt(3, seq_review);

            int rs = pstmt.executeUpdate();
            return rs;
        }
    }

    //삭제
    public int delete(int seq_review) throws Exception {
        String sql = "delete from tbl_review where seq_review = ?";
        try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, seq_review);
            int rs = pstmt.executeUpdate();
            return rs;
        }
    }

    // r_grade 합/ 평점 준사람
    public Double r_grade_average(String movieCd) throws Exception {
        String sql = "select TRUNC((sum(r_grade)/count(*)),2) from tbl_review where movieCd=?";
        try (Connection con = bds.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

        	pstmt.setString(1, movieCd);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Double Average = rs.getDouble(1);
                return Average;
            }
            return 0.0;
        }
    }

    // r_grade카운트
    public int r_grade_count() throws Exception {
        String sql = "select count(*) from tbl_review";
        try (Connection con = bds.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
            return 0;
        }
    }

    //date 형변환
    public String getStringDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        return sdf.format(date);
    }


    public int getCount() throws Exception {
        String sql = "select count(*) from tbl_review";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            return resultSet.getInt(1);
        }
    }

//    public HashMap<String, Integer> getAvgPointHashMap(HashMap<String, Integer> hashMap, String movieCd) throws Exception {
//
//        String sql = "select a.*, nvl(b.avg, 0)" +
//                "      from tbl_movie a," +
//                "           (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
//                " where a.movieCd = b.movieCd(+)" + "   and a.movieCd = ?";
//
//        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
//            preparedStatement.setString(1, movieCd);
//            ResultSet resultSet = preparedStatement.executeQuery();
//
//            if (resultSet.next()) {
//                hashMap.put(movieCd, resultSet.getInt(8));
//            }
//            return hashMap;
//        }
//    }

    public double getAvgPoint(String movieCd) throws Exception {

        String sql = "select a.*, nvl(b.avg, 0)" +
                "      from tbl_movie a," +
                "           (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
                " where a.movieCd = b.movieCd(+)" +
                "   and a.movieCd = ?";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, movieCd);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getDouble(8);
            }
            return 0;
        }
    }

    public ArrayList<ReviewDTO> selectAll_ByPagination(int start, int end) throws Exception {

        String sql = "select *" +
                "from (select a.*, rownum as num" +
                "      from (select * from tbl_review order by 1 desc) a" +
                "      where rownum <= ?)" +
                "where num >= ?";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, end);
            preparedStatement.setInt(2, start);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<ReviewDTO> arrayList = new ArrayList<>();

            while (resultSet.next()) {
                int seq_review = resultSet.getInt(1);
                String movieCd = resultSet.getString(2);
                String user_id = resultSet.getString(3);
                String user_category = resultSet.getString(4);
                String user_nickname = resultSet.getString(5);
                String r_content = resultSet.getString(6);
                String r_date = DateParse.dataParse(resultSet.getDate(7));
                int r_grade = resultSet.getInt(8);

                arrayList.add(new ReviewDTO(seq_review, movieCd, user_id, user_category, user_nickname, r_content, r_date, r_grade));
            }
            return arrayList;

        }
    }

    public int countByGenre(String genreAlt) throws Exception {
        String sql = "select count(*)" +
                "from (select a.*, b.*" +
                "      from tbl_review a," +
                "           (select * from tbl_movie) b" +
                "      where a.movieCd = b.movieCd(+)" +
                "      and genreAlt like ?" +
                "      order by 1 desc)";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + genreAlt + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            return resultSet.getInt(1);
        }
    }

    public int countEtcGenre() throws Exception {
        String sql = "select count(*)" +
                "from (select a.*, b.*" +
                "      from tbl_review a," +
                "           (select * from tbl_movie) b" +
                "      where a.movieCd = b.movieCd(+)" +
                "      and not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러')" +
                "      order by 1 desc)";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            return resultSet.getInt(1);
        }
    }

    public ArrayList<ReviewDTO> selectAllByGenre(String genreAlt, int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select a.*, b.genreAlt" +
                "            from tbl_review a,\n" +
                "                 (select * from tbl_movie) b" +
                "            where a.movieCd = b.movieCd(+)" +
                "            and genreAlt like ?" +
                "            order by 1 desc) c" +
                "            where rownum <= ?)" +
                "where num >=?";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + genreAlt + "%");
            preparedStatement.setInt(2, end);
            preparedStatement.setInt(3, start);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<ReviewDTO> arrayList = new ArrayList<>();

            while (resultSet.next()) {
                int seq_review = resultSet.getInt(1);
                String movieCd = resultSet.getString(2);
                String user_id = resultSet.getString(3);
                String user_category = resultSet.getString(4);
                String user_nickname = resultSet.getString(5);
                String r_content = resultSet.getString(6);
                String r_date = DateParse.dataParse(resultSet.getDate(7));
                int r_grade = resultSet.getInt(8);

                arrayList.add(new ReviewDTO(seq_review, movieCd, user_id, user_category, user_nickname, r_content, r_date, r_grade));
            }
            return arrayList;

        }
    }

    public ArrayList<ReviewDTO> selectAllgenreEtc(int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select a.*, b.genreAlt" +
                "            from tbl_review a," +
                "                 (select * from tbl_movie) b" +
                "            where a.movieCd = b.movieCd(+)" +
                "            and not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러')" +
                "            order by 1 desc) c" +
                "            where rownum <= ?)" +
                "where num >= ?";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, end);
            preparedStatement.setInt(2, start);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<ReviewDTO> arrayList = new ArrayList<>();

            while (resultSet.next()) {
                int seq_review = resultSet.getInt(1);
                String movieCd = resultSet.getString(2);
                String user_id = resultSet.getString(3);
                String user_category = resultSet.getString(4);
                String user_nickname = resultSet.getString(5);
                String r_content = resultSet.getString(6);
                String r_date = DateParse.dataParse(resultSet.getDate(7));
                int r_grade = resultSet.getInt(8);

                arrayList.add(new ReviewDTO(seq_review, movieCd, user_id, user_category, user_nickname, r_content, r_date, r_grade));
            }
            return arrayList;

        }
    }

    public int countByMovieCd(String movieCd) throws Exception {
        String sql = "select count(*) from tbl_review where movieCd = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, movieCd);

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            return resultSet.getInt(1);
        }
    }


}
