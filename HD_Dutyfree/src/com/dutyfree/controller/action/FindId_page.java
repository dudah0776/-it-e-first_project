package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//박진수
public class FindId_page implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//해당 아이디 찾기 페이지로 이동하는 url 지정
		String url="/user/FindId.jsp";
		
		//해당 url로 forward
		request.getRequestDispatcher(url).forward(request,response);

	}

}
