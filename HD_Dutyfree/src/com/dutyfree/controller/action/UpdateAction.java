package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dutyfree.dao.MemberDAO;


//박진수
public class UpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//수정 후에 마이 페이지로 가기 위해 url을 선언하고 저장
		String url="DutyfreeServlet?command=Update_page";
		
		//MemberDAO를 메서드를 통해 가져옴
		MemberDAO dao=MemberDAO.getInstance();
		
		//세션 선언하기 위해 세션 객체를 선언 
		HttpSession session=request.getSession();
		
		//해당하는 회원에 대한 여권번호와 휴대폰 번호를 수정하기 위한 updateMember를 수행
		int result=dao.updateMember(request.getParameter("memId"),request.getParameter("memPassport"),request.getParameter("memPhone"));
		
		//수행을 성공하면 update_success라는 이름의 세션을 생성하고 값을 넣는다.
		if(result==1) {
			session.setAttribute("update_success","update_success");
		}
		
		//url로 forward
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
