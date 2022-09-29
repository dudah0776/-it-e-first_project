//김가희
package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.CsDAO;
import com.dutyfree.dto.CsVO;

//게시물 상세보기
public class CsViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "cs/csView.jsp";

		// 로그인한 사용자 아이디 받아오기
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("memId");

		// 게시물제목을 클릭한 게시물의 번호를 받아옴
		int csNo = Integer.parseInt(request.getParameter("csNo"));

		// 게시물번호로 DB에서 게시물객체를 받아옴
		CsDAO csDAO = CsDAO.getInstance();
		CsVO csVO = csDAO.getCs(csNo);

		// request에 csVO를 담음
		request.setAttribute("loginId", loginId);
		request.setAttribute("csVO", csVO);
		
		// 게시물 상세보기 화면으로 이동
		request.getRequestDispatcher(url).forward(request, response);
	}

}
