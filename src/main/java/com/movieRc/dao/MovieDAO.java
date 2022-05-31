package com.movieRc.dao;

import com.movieRc.dto.MovieDTO;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class MovieDAO {
    private BasicDataSource basicDataSource;

    public MovieDAO() {
        try {
            Context context = new InitialContext();
            Context envContext = (Context) context.lookup("java:comp/env");
            basicDataSource = (BasicDataSource) envContext.lookup("jdbc/bds");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws Exception {
        return basicDataSource.getConnection();
    }


    public int CountAll() throws Exception {
        String sql = "select count(*) from tbl_movie";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultset = preparedStatement.executeQuery();
            if (resultset.next()) {
                return resultset.getInt(1);
            } else return 0;
        }
    }

    public ArrayList<MovieDTO> selectAll(int start, int end) throws Exception {
        String sql = "select * from" +
                "             (select rownum as num, a.* from" +
                "                                            (select * from tbl_movie order by 1 desc) a)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(2);
                String movieNm = resultSet.getString(3);
                String movieNmen = resultSet.getString(4);
                String prdtYear = resultSet.getString(5);
                String nationAlt = resultSet.getString(6);
                String genreAlt = resultSet.getString(7);
                String directors = resultSet.getString(8);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }
    }

    public int countAllByGenre(String genreAlt) throws Exception {
        String sql = "select count(*) from tbl_movie where genreAlt like ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + genreAlt + "%");
            ResultSet resultset = preparedStatement.executeQuery();
            if (resultset.next()) {
                return resultset.getInt(1);
            } else return 0;
        }
    }

    public int countAllEtcGenre() throws Exception {
        String sql = "select count(*) from tbl_movie where not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러')";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultset = preparedStatement.executeQuery();
            if (resultset.next()) {
                return resultset.getInt(1);
            } else return 0;
        }
    }

    public ArrayList<MovieDTO> searchByGenre(String genreAlt, int start, int end) throws Exception {
        String sql = "select *" +
                "from (select a.*, rownum as num" +
                "      from (select * from tbl_movie where genreAlt like ? order by 1 desc) a)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + genreAlt + "%");
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }
    }

    public ArrayList<MovieDTO> searchByGenreEtc(int start, int end) throws Exception {
        String sql = "select*" +
                "from (select a.*, rownum as num" +
                "      from (select * from tbl_movie where not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러') order by 1 desc) a)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                String genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }
    }

    public int countAllbyMovieNm(String movieNm) throws Exception {
        String sql = "select count(*) from tbl_movie where movieNm like ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + movieNm + "%");

            ResultSet resultset = preparedStatement.executeQuery();
            if (resultset.next()) {
                return resultset.getInt(1);
            } else return 0;
        }
    }

    public ArrayList<MovieDTO> selectByMovieNm(String movieNm, int start, int end) throws Exception {
        String sql = "select*" +
                "from (select a.*, rownum as num" +
                "      from (select * from tbl_movie where movieNm like ? order by 1 desc) a)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + movieNm + "%");
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                String genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }
    }

    public ArrayList<MovieDTO> selectAll_OrderByReviewCount(int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select *" +
                "            from (select a.*, nvl(b.count, 0)" +
                "                  from tbl_movie a," +
                "                       (select count(*) as count, movieCd" +
                "                        from tbl_review" +
                "                        group by movieCd) b" +
                "                  where a.moviecd = b.moviecd(+))" +
                "            order by 8 desc) c)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                String genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }

    }

    public ArrayList<MovieDTO> selectEtcGenre_OrderByReviewCount(int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select *" +
                "            from (select a.*, nvl(b.count, 0)" +
                "                  from tbl_movie a," +
                "                       (select count(*) as count, movieCd" +
                "                        from tbl_review" +
                "                        group by movieCd) b" +
                "                  where a.moviecd = b.moviecd(+)" +
                "                  and not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러'))" +
                "            order by 8 desc) c)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                String genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }

    }

    public ArrayList<MovieDTO> selectByGenre_OrderByReviewCount(String genreAlt, int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select *" +
                "            from (select a.*, nvl(b.count, 0)" +
                "                  from tbl_movie a," +
                "                       (select count(*) as count, movieCd" +
                "                        from tbl_review" +
                "                        group by movieCd) b" +
                "                  where a.moviecd = b.moviecd(+)" +
                "                  and genreAlt like ?)" +
                "            order by 8 desc) c)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + genreAlt + "%");
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }

    }

    public ArrayList<MovieDTO> selectByMovieNm_OrderByReviewCount(String movieNm, int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select *" +
                "            from (select a.*, nvl(b.count, 0)" +
                "                  from tbl_movie a," +
                "                       (select count(*) as count, movieCd" +
                "                        from tbl_review" +
                "                        group by movieCd) b" +
                "                  where a.moviecd = b.moviecd(+)" +
                "                  and movieNm like ?)" +
                "            order by 8 desc) c)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + movieNm + "%");
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(2);
                movieNm = resultSet.getString(3);
                String movieNmen = resultSet.getString(4);
                String prdtYear = resultSet.getString(5);
                String nationAlt = resultSet.getString(6);
                String genreAlt = resultSet.getString(7);
                String directors = resultSet.getString(8);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }

    }

    public ArrayList<MovieDTO> selectAll_OrderByAvgPoint(int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select a.*, nvl(b.avg, 0)" +
                "            from tbl_movie a," +
                "                 (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
                "            where a.movieCd = b.movieCd(+)" +
                "            order by 8 desc) c)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                String genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }
    }

    public ArrayList<MovieDTO> selectEtcGenre_OrderByAvgPoint(int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select a.*, nvl(b.avg, 0)" +
                "            from tbl_movie a," +
                "                 (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
                "            where a.movieCd = b.movieCd(+)" +
                "            and not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러')" +
                "            order by 8 desc) c)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                String genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }
    }

    public ArrayList<MovieDTO> selectByGenre_OrderByAvgPoint(String genreAlt, int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select a.*, nvl(b.avg, 0)" +
                "            from tbl_movie a," +
                "                 (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
                "            where a.movieCd = b.movieCd(+)" +
                "            and genreAlt like ?" +
                "            order by 8 desc) c)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, genreAlt);
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                String movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }
    }

    public ArrayList<MovieDTO> selectByMovieNm_OrderByAvgPoint(String movieNm, int start, int end) throws Exception {
        String sql = "select *" +
                "from (select c.*, rownum as num" +
                "      from (select a.*, nvl(b.avg, 0)" +
                "            from tbl_movie a," +
                "                 (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b" +
                "            where a.movieCd = b.movieCd(+)" +
                "            and movieNm like ?" +
                "            order by 8 desc) c)" +
                "where num between ? and ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, movieNm);
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, end);

            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MovieDTO> arrayList = new ArrayList<>();
            while (resultSet.next()) {
                String movieCd = resultSet.getString(1);
                movieNm = resultSet.getString(2);
                String movieNmen = resultSet.getString(3);
                String prdtYear = resultSet.getString(4);
                String nationAlt = resultSet.getString(5);
                String genreAlt = resultSet.getString(6);
                String directors = resultSet.getString(7);

                arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
            }
            return arrayList;
        }
    }
}
