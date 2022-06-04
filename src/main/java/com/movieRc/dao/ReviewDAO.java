package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import com.movieRc.util.DateParse;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.movieRc.dto.ReviewDTO;


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

    public int write(ReviewDTO dto) throws Exception {
        String sql = "insert into tbl_review values(seq_review.nextval, 'movieCd','id','category','nickname',?,sysdate)";

        try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, dto.getR_content());

            int rs = pstmt.executeUpdate();
            return rs;
        }
    }

    public int getCount() throws Exception {
        String sql = "select count(*) from tbl_review";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            return resultSet.getInt(1);
        }
    }

    public HashMap<String, Integer> getAvgPointHashMap(HashMap<String, Integer> hashMap, String movieCd) throws Exception {

        String sql = "select a.*, nvl(b.avg, 0)" +
                     "      from tbl_movie a," +
                     "           (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
                     " where a.movieCd = b.movieCd(+)" + "   and a.movieCd = ?";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, movieCd);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                hashMap.put(movieCd, resultSet.getInt(8));
            }
            return hashMap;
        }
    }

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

    public ArrayList<ReviewDTO> selectAll(int start, int end) throws Exception {

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
                String user_nickname = resultSet.getString(2);
                String r_content = resultSet.getString(3);
                String r_date = DateParse.dataParse(resultSet.getDate(4));
                String r_grade = resultSet.getString(5);
                String movieCd = resultSet.getString(6);
                String user_id = resultSet.getString(7);
                String user_category = resultSet.getString(8);

                arrayList.add(new ReviewDTO(seq_review, user_nickname, r_content, r_date, r_grade, movieCd, user_id, user_category));
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
            preparedStatement.setString(1, "%"+genreAlt+"%");
            preparedStatement.setInt(2, end);
            preparedStatement.setInt(3, start);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<ReviewDTO> arrayList = new ArrayList<>();

            while (resultSet.next()) {
                int seq_review = resultSet.getInt(1);
                String user_nickname = resultSet.getString(2);
                String r_content = resultSet.getString(3);
                String r_date = DateParse.dataParse(resultSet.getDate(4));
                String r_grade = resultSet.getString(5);
                String movieCd = resultSet.getString(6);
                String user_id = resultSet.getString(7);
                String user_category = resultSet.getString(8);

                arrayList.add(new ReviewDTO(seq_review, user_nickname, r_content, r_date, r_grade, movieCd, user_id, user_category));
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
                String user_nickname = resultSet.getString(2);
                String r_content = resultSet.getString(3);
                String r_date = DateParse.dataParse(resultSet.getDate(4));
                String r_grade = resultSet.getString(5);
                String movieCd = resultSet.getString(6);
                String user_id = resultSet.getString(7);
                String user_category = resultSet.getString(8);

                arrayList.add(new ReviewDTO(seq_review, user_nickname, r_content, r_date, r_grade, movieCd, user_id, user_category));
            }
            return arrayList;

        }
    }

    public int countByMovieCd(String movieCd) throws Exception {
        String sql = "select count(*) from tbl_review where movieCd = ?";
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)){

            preparedStatement.setString(1,movieCd);

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            return resultSet.getInt(1);
        }
    }




}
