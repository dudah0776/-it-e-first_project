//김가희
package com.dutyfree.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.CsDAO;
import com.dutyfree.dto.CsVO;

//고객센터 내가쓴글목록 
public class CsMyListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "cs/csList.jsp";
		
		//로그인한 사용자 아이디 받아오기
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("memId");
		
		//DB에서 내가쓴글 목록을 가져와서 csList에 담음
		CsDAO csDAO = CsDAO.getInstance();
		ArrayList<CsVO> csList = csDAO.listMyCs(loginId);
		
		//csList를 request에담아서 목록화면으로 이동
		request.setAttribute("csList", csList);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
