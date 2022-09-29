//김가희
package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.CsDAO;

//고객센터 게시글작성화면띄우기
public class CsWriteFormAction  implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "cs/csWrite.jsp";
		
		//세션에서 로그인한 사용자 아이디를 받아서 request객체에 담음
		String loginId = (String)request.getSession().getAttribute("memId");
		request.setAttribute("memId", loginId);
		
		//request,response객체와 함께 게시글작성화면으로 이동
		request.getRequestDispatcher(url).forward(request, response);;
	}

}
