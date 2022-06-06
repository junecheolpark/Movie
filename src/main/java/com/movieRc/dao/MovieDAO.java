package com.movieRc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import com.movieRc.dto.MovieDTO;

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
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				return resultset.getInt(1);
			} else
				return 0;
		}
	}

	public ArrayList<MovieDTO> selectAll(int start, int end) throws Exception {
		String sql = "select * from" + "             (select rownum as num, a.* from"
				+ "                                            (select * from tbl_movie order by 1 desc) a)"
				+ "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

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
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setString(1, "%" + genreAlt + "%");
			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				return resultset.getInt(1);
			} else
				return 0;
		}
	}

	public int countAllEtcGenre() throws Exception {
		String sql = "select count(*) from tbl_movie where not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러')";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				return resultset.getInt(1);
			} else
				return 0;
		}
	}

	public ArrayList<MovieDTO> searchByGenre(String genreAlt, int start, int end) throws Exception {
		String sql = "select *" + "from (select a.*, rownum as num"
				+ "      from (select * from tbl_movie where genreAlt like ? order by 1 desc) a)"
				+ "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setString(1, "%" + genreAlt + "%");
			preparedStatement.setInt(2, start);
			preparedStatement.setInt(3, end);

			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<MovieDTO> arrayList = new ArrayList<>();

			while (resultSet.next()) {
				String movieCd = resultSet.getString(2);
				String movieNm = resultSet.getString(3);
				String movieNmen = resultSet.getString(4);
				String prdtYear = resultSet.getString(5);
				String nationAlt = resultSet.getString(6);
				String genreAlt1 = resultSet.getString(7);
				String directors = resultSet.getString(8);

				arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt1, directors));
			}
			return arrayList;
		}
	}

	public ArrayList<MovieDTO> searchByGenreEtc(String genreAlt, int start, int end) throws Exception {
		String sql = "select*" + "from (select a.*, rownum as num"
				+ "      from (select * from tbl_movie where not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러') order by 1 desc) a)"
				+ "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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
				genreAlt = resultSet.getString(6);
				String directors = resultSet.getString(7);

				arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors));
			}
			return arrayList;
		}

	}

	public ArrayList<MovieDTO> searchByGenreEtc(int start, int end) throws Exception {

		String sql = "select*" + "from (select a.*, rownum as num"
				+ "      from (select * from tbl_movie where not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러') order by 1 desc) a)"
				+ "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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
				String genreAlt1 = resultSet.getString(7);
				String directors = resultSet.getString(8);

				arrayList.add(new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt1, directors));
			}
			return arrayList;
		}
	}

	public int countAllbyMovieNm(String movieNm) throws Exception {
		String sql = "select count(*) from tbl_movie where movieNm like ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setString(1, "%" + movieNm + "%");

			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				return resultset.getInt(1);
			} else
				return 0;
		}
	}

	public ArrayList<MovieDTO> selectByMovieNm(String movieNm, int start, int end) throws Exception {
		String sql = "select*" + "from (select a.*, rownum as num"
				+ "      from (select * from tbl_movie where movieNm like ? order by 1 desc) a)"
				+ "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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
		String sql = "select *" + "from (select c.*, rownum as num" + "      from (select *"
				+ "            from (select a.*, nvl(b.count, 0)" + "                  from tbl_movie a,"
				+ "                       (select count(*) as count, movieCd"
				+ "                        from tbl_review" + "                        group by movieCd) b"
				+ "                  where a.moviecd = b.moviecd(+))" + "            order by 8 desc) c)"
				+ "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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
		String sql = "select *" + "from (select c.*, rownum as num" + "      from (select *"
				+ "            from (select a.*, nvl(b.count, 0)" + "                  from tbl_movie a,"
				+ "                       (select count(*) as count, movieCd"
				+ "                        from tbl_review" + "                        group by movieCd) b"
				+ "                  where a.moviecd = b.moviecd(+)"
				+ "                  and not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러'))"
				+ "            order by 8 desc) c)" + "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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
		String sql = "select *" + "from (select c.*, rownum as num" + "      from (select *"
				+ "            from (select a.*, nvl(b.count, 0)" + "                  from tbl_movie a,"
				+ "                       (select count(*) as count, movieCd"
				+ "                        from tbl_review" + "                        group by movieCd) b"
				+ "                  where a.moviecd = b.moviecd(+)" + "                  and genreAlt like ?)"
				+ "            order by 8 desc) c)" + "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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
		String sql = "select *" + "from (select c.*, rownum as num" + "      from (select *"
				+ "            from (select a.*, nvl(b.count, 0)" + "                  from tbl_movie a,"
				+ "                       (select count(*) as count, movieCd"
				+ "                        from tbl_review" + "                        group by movieCd) b"
				+ "                  where a.moviecd = b.moviecd(+)" + "                  and movieNm like ?)"
				+ "            order by 8 desc) c)" + "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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

	public ArrayList<MovieDTO> selectAll_OrderByAvgPoint(int start, int end) throws Exception {
		String sql = "select *" + "from (select c.*, rownum as num" + "      from (select a.*, nvl(b.avg, 0)"
				+ "            from tbl_movie a,"
				+ "                 (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b"
				+ "            where a.movieCd = b.movieCd(+)" + "            order by 8 desc) c)"
				+ "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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
		String sql = "select *" + "from (select c.*, rownum as num" + "      from (select a.*, nvl(b.avg, 0)"
				+ "            from tbl_movie a,"
				+ "                 (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b"
				+ "            where a.movieCd = b.movieCd(+)"
				+ "            and not regexp_like(genreAlt, '.*코미디|.*액션|.*멜로|.*sf|.*호러')"
				+ "            order by 8 desc) c)" + "where num between ? and ?";
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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
		String sql = "select *" + "from (select c.*, rownum as num" + "      from (select a.*, nvl(b.avg, 0)"
				+ "            from tbl_movie a,"
				+ "                 (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b"
				+ "            where a.movieCd = b.movieCd(+)" + "            and genreAlt like ?"
				+ "            order by 8 desc) c)" + "where num between ? and ?";

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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

	public ArrayList<MovieDTO> selectByMovieNm_OrderByAvgPoint(String movieNm, int start, int end) throws Exception {
		String sql = "select *" + "from (select c.*, rownum as num" + "      from (select a.*, nvl(b.avg, 0)"
				+ "            from tbl_movie a,"
				+ "                 (select avg(r_grade) as avg, movieCd from tbl_review group by movieCd) b"
				+ "            where a.movieCd = b.movieCd(+)" + "            and movieNm like ?"
				+ "            order by 8 desc) c)" + "where num between ? and ?";

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
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

	public MovieDTO getMovieDTO_byMovieCd(String movieCd) throws Exception {
		String sql = "select * from tbl_movie where moviecd = ?";

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setString(1, movieCd);

			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				movieCd = resultSet.getString(1);
				String movieNm = resultSet.getString(2);
				String movieNmen = resultSet.getString(3);
				String prdtYear = resultSet.getString(4);
				String nationAlt = resultSet.getString(5);
				String genreAlt = resultSet.getString(6);
				String directors = resultSet.getString(7);

				return new MovieDTO(movieCd, movieNm, movieNmen, prdtYear, nationAlt, genreAlt, directors);
			}
			return null;
		}
	}

	public int deleteAll() throws Exception {
		String sql = "delete from tbl_movie";

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			int rs = preparedStatement.executeUpdate();
			return rs;
		}
	}
	
	public int insert(List<MovieDTO> dtos){
		String sql = "insert into tbl_movie values(?,?,?,?,?,?,?)";
		int rs = 0;
		try (Connection con = getConnection();
				PreparedStatement pstm = con.prepareStatement(sql)) {

			for(int i=0; i<dtos.size();i++) {
				MovieDTO dto = dtos.get(i);
				pstm.setString(1,  dto.getMovieCd());
				pstm.setString(2,  dto.getMovieNm());
				pstm.setString(3,  dto.getMovieNmEn());
				pstm.setString(4,  dto.getPrdtYear());
				pstm.setString(5,  dto.getNationAlt());
				pstm.setString(6,  dto.getGenreAlt());
				pstm.setString(7,  dto.getDirectors());
				
				pstm.addBatch(); // 모든 dto들의 배열 메모리에 대기
				
			}
			int[] result = pstm.executeBatch(); //쿼리 결과값 배열 저장
			
			for(int i=0; i<result.length; i++){
				if(result[0]==-2) {//성공이면 -2 rs값증가
					rs++;
				}
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

}
