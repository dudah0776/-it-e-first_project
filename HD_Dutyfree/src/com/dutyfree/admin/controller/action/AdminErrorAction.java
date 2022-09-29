package com.dutyfree.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;

//김가희
//관리자가 아닌 사용자가 관리자페이지로 접근할때 에러페이지를 띄움
public class AdminErrorAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//에러 페이지가 있는 url로 이동
		String url="/error/admin_error_page.jsp";
		
		//url로 forward 한다.
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
