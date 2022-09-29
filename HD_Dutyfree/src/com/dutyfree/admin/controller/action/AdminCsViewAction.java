//김가희
//관리자 게시물 상세보기 화면으로 이동시켜주는 action
package com.dutyfree.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;
import com.dutyfree.dao.CsDAO;
import com.dutyfree.dto.CsVO;

public class AdminCsViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/cs/csView.jsp";
		//request에서 상세보기할 게시물의 번호(csNo)를 받아옴
		int csNo = Integer.parseInt(request.getParameter("csNo"));
	
		//DB에서 게시물번호로 해당게시물 객체를 받아옴
		CsDAO csDAO = CsDAO.getInstance();
		CsVO csVO = csDAO.getCs(csNo);
		
		//게시물객체를 request에 담아서 게시물 상세보기 화면으로 페이지이동
		request.setAttribute("csVO", csVO);
		request.getRequestDispatcher(url).forward(request, response);

	}

}
