package com.dutyfree.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dutyfree.dao.MemberDAO;

//박진수
public class FindPwAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//MemberDAO를 메서드를 통해 가져옴
		MemberDAO dao= MemberDAO.getInstance();
		
		//회원의 ID와 휴대폰 번호를 매개변수로 가져와서 비밀번호를 찾는다
		String pw=dao.FindPw(request.getParameter("memId"), request.getParameter("memPhone"));
		
		
		//수행하고 결과에 따른 url을 다르게 주기위해 선언만 수행
		String url="";
		
		//pw의 값을 request 속성 pw로 지정한다.
		request.setAttribute("pw", pw);
		
		//pw가 0과 같으면 회원의 비밀번호가 없다면 비밀번호를 찾는 페이지로 이동하고 그 외에는 비밀번호를 찾았기 때문에 로그인화면으로 이동한다.
		if(pw.equals("0")) {
			url="DutyfreeServlet?command=FindPw_Page";
		}else {
			url="DutyfreeServlet?command=login_form";
			
		}
		
		//request와 함께 해당 url로 forward
		request.getRequestDispatcher(url).forward(request, response);
	}

}
