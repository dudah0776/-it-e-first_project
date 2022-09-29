package com.dutyfree.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.MemberDAO;
import com.dutyfree.dto.MemberVO;

public class Update_pageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
		  //MemberDAO를 메서드를 통해 가져옴
		  MemberDAO dao=MemberDAO.getInstance();
	      
		  //request에 저장된 세션값을 가져온다.
		  HttpSession session=request.getSession();
		  
		  //세션중 memId를 가져와 memId라는 string 변수에 저장한다.
	      String memId=(String)session.getAttribute("memId");
	     
	      //memId를 매개값으로 하는 getMember 메서드를 통해 MemberVO 객체에 저장
	      MemberVO member=dao.getMember(memId);
	      
	      //해당 회원의 정보를 페이지에서 가져오기 위해 member 객체를 가져온다.
	      request.setAttribute("member", member);
	      
	      //기본정보 관리 페이지로 이동하는 url을 선언하고 저장
	      String url="/user/MyHD.jsp";
	      
	      //url로 forward
	      request.getRequestDispatcher(url).forward(request, response);
	}

}
