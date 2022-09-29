package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.MemberDAO;
import com.dutyfree.dto.MemberVO;

public class LoginMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//MemberDAO를 메서드를 통해 가져옴
		MemberDAO dao=MemberDAO.getInstance();
		
		//로그인 성공시 id를 session을 저장하기 위해 session을 선언한다.
		HttpSession session=request.getSession();
		
		//request에 memId 속성값과 memPw속성값을 가지고 LoginMember를 실행
		String result=dao.LoginMember(request.getParameter("memId"),request.getParameter("memPw"));
		
		//로그인 수행 후 메인 페이지로 이동하는 url 지정
		String url="/DutyfreeServlet?command=index";
		if(result.equals("성공")) {
			String loginId = request.getParameter("memId");
			//22.09.15 김가희 추가
			//관리자인 경우 관리자페이지로 이동
			if(loginId.equals("admin")) {
				url = "/DutyfreeServlet?command=admin_member_list";
			}
			session.setAttribute("memId", loginId);
		}else {
			//만약 로그인을 실패하면 다시 로그인 페이지로 이동한다.
			url="/DutyfreeServlet?command=login_form";
			//알림창을 띄우기 위해 fail이라는 이름의 request 속성을 지정한다.
			request.setAttribute("fail", result);
		}
		//아이디 저장값을 나타내는 속성이름 saveId가 null 이 아니면 수행
		if(request.getParameter("saveId")!=null) {
			//saveId 의 값이 y와 같으면 수행
			if(request.getParameter("saveId").equals("Y")) {
				
				//saveId라는 session이름에 memId를 저장
				session.setAttribute("saveId", request.getParameter("memId"));
			}
			//saveId가 null이면 아이디 저장을 해제한 거 일 수도 있기 때문에 saveId session을 제거한다.
		}else {
			if(session.getAttribute("saveId")!=null) {
				session.removeAttribute("saveId");
			}
		}
		
		
		request.getRequestDispatcher(url).forward(request,response);
	}

}