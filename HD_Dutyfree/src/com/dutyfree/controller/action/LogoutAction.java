package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//박진수
public class LogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//session 값을 가져온다.
		HttpSession session=request.getSession();
		//로그아웃을 수행하기 때문에 회원 세션 값을 제거
		session.removeAttribute("memId");
		//제거 후 메인 화면으로 이동
		String url="/DutyfreeServlet?command=index";
		
		//url로 forward
		request.getRequestDispatcher(url).forward(request,response);
	}

}
