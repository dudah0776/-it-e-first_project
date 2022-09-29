package com.dutyfree.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//박진수
public class LoginFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		//로그인을 수행하는 창으로 이동하는 페이지로 이동
		 String url="/user/login_form.jsp";
		 
		 //url과 함께 forward
		 request.getRequestDispatcher(url).forward(request,response);
	}

}