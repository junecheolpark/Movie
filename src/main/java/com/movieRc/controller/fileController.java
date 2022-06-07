package com.movieRc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movieRc.dao.FileDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.file")
public class fileController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		
		if(uri.equals("/upload1.file")) {
			System.out.println("파일 업로드 요청");

			// 1. 서버의 root 경로 
			String realPath = request.getServletContext().getRealPath("");
			System.out.println("realPath : " + realPath);
			
			// 2. 서버의 루트에 실제 파일이 저장될 경로값 만들어주기
			String filePath = request.getServletContext().getRealPath("files");
			System.out.println("filePath : " + filePath);
			
			// 3. File을 이용해 실제 위의 경로값이 존재하는지 체크 -> 없다면 폴더 생성 
			File dir = new File(filePath);
			if(!dir.exists()) {
				System.out.println("폴더 생성!");
				dir.mkdirs();
			}
			
			// 4. 업로드할 파일의 최대크기를 얼마로 지정해줄지
			int maxSize = 1024 * 1024 * 100;
			
			MultipartRequest multi = new MultipartRequest(request,filePath,maxSize,"utf-8", new DefaultFileRenamePolicy());
			
			// 업로드된 파일의 원본파일명
			String ori_name = multi.getOriginalFileName("file");	
			
			// 실제 서버 경로에 업로드된 파일명
			String sys_name = multi.getFilesystemName("file");
			
		}
	}
}















