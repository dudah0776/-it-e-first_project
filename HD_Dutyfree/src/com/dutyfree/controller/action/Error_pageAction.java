package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//박진수
public class Error_pageAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//에러 페이지가 있는 url로 이동
		String url="/error/error_page.jsp";
		
		//url로 forward 한다.
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
