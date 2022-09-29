// 김나형 생성
// 아이디 중복 확인
package com.dutyfree.controller.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.dao.MemberDAO;

public class IdCheckFormAction implements Action{
	@Override
	 public void execute(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException {
	// 이동할 url 지정
	 String url = "/member/idcheck.jsp"; 
	 
	 // id을 읽어와 id 값에 저장
	 String id = request.getParameter("id").trim();
	 
	 // MemberDAO에 있는 confirmID로 id값 전달
	 MemberDAO memberDAO=MemberDAO.getInstance();
	 int message = memberDAO.confirmID(id);
	 
	 // 속성값들 value 지정
	 request.setAttribute("message", message);
	 request.setAttribute("id", id);
	 
	// 지정한 url로 이동
	 RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	 dispatcher.forward(request, response);
	 }
}
