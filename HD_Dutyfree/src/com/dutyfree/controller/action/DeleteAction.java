package com.dutyfree.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.MemberDAO;

//박진수
public class DeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//계정 삭제 후에 메인 페이지로 이동하기 위해 url 설정.
		String url="DutyfreeServlet?command=index";
		
		//MemberDAO를 메서드를 통해 가져옴
		MemberDAO dao=MemberDAO.getInstance();
		
		//session을 가져온다
		HttpSession session=request.getSession();
		
		//로그인한 회원의 아이디가 들어있는 세션 memId를 매개변수로 함수를 실행
		int result=dao.deleteMember(request.getParameter("memId"));
		
		//result 결과가 1 즉 성공이면 해당 memId 세션을 삭제하고 탈퇴가 되었다는 알림을 띄우기 위해 delete_success라는 request를 저장한다.
		if(result==1) {
			session.removeAttribute("memId");
			request.setAttribute("delete_success", "delete_success");
		}
		
		//url로 forward 한다.
		request.getRequestDispatcher(url).forward(request,response);

	}

}
