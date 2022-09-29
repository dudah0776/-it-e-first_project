// 22/09/08 김가희 생성
package com.dutyfree.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;

//DutyfreeServlet url로 받는 서블릿
@WebServlet("/DutyfreeServlet")
public class DutyfreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//command 파라미터를 받는다.
		String command = request.getParameter("command");
		System.out.println("DutyfreeServlet에서 요청을 받음을 확인 : "+command);
		
		//ActionFactory의 ActionFactory 객체를 생성한다.
		ActionFactory af = ActionFactory.getInstance();
		
		//ActionFactory 객체에서 getAction를 통해 Action 객체를 가져온다. 
		Action action = af.getAction(command);
		
		//action 객체가 null이 아니면 action 객체를 실행한다.
		if(action != null) {
			action.execute(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request의 값을 UTF-8로 번역한다.
		request.setCharacterEncoding("UTF-8");
		doGet(request,response);
	}
}
