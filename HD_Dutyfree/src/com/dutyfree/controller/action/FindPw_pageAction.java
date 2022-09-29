package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//박진수
public class FindPw_pageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//비밀번호를 찾는 페이지로 이동한다.
		String url="/user/FindPw.jsp";
		
		//해당 url로 forward를 한다.
		request.getRequestDispatcher(url).forward(request,response);
	}

}
