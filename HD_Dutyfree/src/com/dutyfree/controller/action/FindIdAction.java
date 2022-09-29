package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.dao.MemberDAO;

//박진수
public class FindIdAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//MemberDAO를 메서드를 통해 가져옴
		MemberDAO dao= MemberDAO.getInstance();
		
		//회원의 이름과 휴대폰 번호를 저장한 parameter memName과 memPhone을 매개변수로 받아서 id를 찾는다.
		String id=dao.FindId(request.getParameter("memName"), request.getParameter("memPhone"));
		String url="";
		
		//id 값에 따라 알림창을 다르게 주기 위해 id를 request 속성에 지정한다.
		request.setAttribute("id", id);
		
		//id가 0과 같으면 회원의 아이디가 없다면 아이디를 찾는 페이지로 이동하고 그 외에는 아이디를 찾았기 때문에 로그인화면으로 이동한다.
		if(id.equals("0")) {
			url="DutyfreeServlet?command=FindId_Page";
		}else {
			url="DutyfreeServlet?command=login_form";
			
		}
		
		//url로 forward 한다.
		request.getRequestDispatcher(url).forward(request, response);

	}

}
