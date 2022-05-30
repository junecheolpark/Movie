package com.movieRc.controller;

import com.movieRc.dao.MovieDAO;
import com.movieRc.dto.MovieDTO;
import com.movieRc.util.Pagination;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.movie")
public class MovieController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);

	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String uri = request.getRequestURI();
		MovieDAO movieDAO = new MovieDAO();
		Pagination pagination = new Pagination();

		 if (uri.equals("/listLookup.movie")){
			 int curPage = Integer.parseInt(request.getParameter("curPage"));
			try {
				int totalCount = movieDAO.CountAll();
				HashMap<String, Object> hashMap = pagination.getPageNavi(totalCount, 30, 10, curPage);
				int start = (int) hashMap.get("postStart");
				int end = (int) hashMap.get("postEnd");
				ArrayList<MovieDTO> arrayList = movieDAO.selectAll(start,end);

				request.setAttribute("hashMap", hashMap);
				request.setAttribute("arrayList", arrayList);
				request.getRequestDispatcher("/movie/listLookup.jsp").forward(request,response);
			} catch (Exception e){
				e.printStackTrace();
			}
		} else if(uri.equals("/search.movie")){
			 String genreAlt = request.getParameter("genreAlt");
			 if(genreAlt!=null){

			 } else if (genreAlt.equals("기타")){

			 }
		 }
	}
}
