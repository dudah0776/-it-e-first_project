package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.dao.MemberDAO;

//박진수
public class ChangePwAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//비밀번호를 수행한 후에 다시 수정페이지로 이동하기 위해 url 설정
		String url="DutyfreeServlet?command=Update_page";
		
		//MemberDAO를 메서드를 통해 가져옴
		MemberDAO dao= MemberDAO.getInstance();
		
		//실제 저장된 멤버 id와 기존 비밀번호란에 작성한 oldPw 변경하고 싶은 비밀번호인 newPw를 작성하고 changePW를 수행
		String result=dao.ChangePw(request.getParameter("checkId"), request.getParameter("oldPw"), request.getParameter("newPw"));
		
		//만약 결과가 성공한 경우 알림창을 띄우기 위해 request에 changePassword라는 이름으로 저장한다.아니면 changePassword_fail을 저장한다.
		if(result.equals("성공")) {
			request.setAttribute("changePassword_success", "changePassword_success");
		}else {
			request.setAttribute("changePassword_fail", "changePassword_fail");
		}
		
		//url로 forward 한다.
		request.getRequestDispatcher(url).forward(request, response);

	}

}
