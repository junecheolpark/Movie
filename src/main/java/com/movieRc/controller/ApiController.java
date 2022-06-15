package com.movieRc.controller;

import com.movieRc.util.ApiExplorer;
import com.movieRc.dao.ApiDAO;
import com.movieRc.dto.MovieDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ApiController", value = "*.api")
public class ApiController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/http; charset = utf-8");
        ApiExplorer apiExplorer = new ApiExplorer();
        ApiDAO movieDAO = new ApiDAO();

        if (uri.equals("/get.api")) {
            int totalCnt = 87704; // 영화 total count
            int num = (int) Math.ceil(totalCnt / 10); // 반복 횟수
            try {
//                movieDAO.deleteAll();
//                System.out.println("초기화 완");
                for (int i = 0; i < num; i++) {
                    ArrayList<MovieDTO> arrayList = apiExplorer.run(i);
                    for (int j = 0; j < arrayList.size(); j++) {
                    	System.out.println(i+"업데이트" +j);
                    	int rs1 = movieDAO.update(arrayList.get(j).getMovieCd(), arrayList.get(j).getMovieNm());
                        
                       
                        if(rs1<0) {
                        	System.out.println((i * 10 + j) + "번째 데이터 넣는 중");
                             movieDAO.insert(arrayList.get(j));
                        	
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
