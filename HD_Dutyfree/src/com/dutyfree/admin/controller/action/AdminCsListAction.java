//김가희
//고객센터 Q&A목록(관리자용)페이지로 이동시키는 action

package com.dutyfree.admin.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;
import com.dutyfree.dao.CsDAO;
import com.dutyfree.dto.CsVO;

public class AdminCsListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/cs/csList.jsp";
		
		//DB에서 게시판데이터List를 받아옴
		CsDAO csDAO = CsDAO.getInstance();
		ArrayList<CsVO> csList = csDAO.listCs();
		
		//게시판List를 request에 담음
		request.setAttribute("csList", csList);
		
		//request,response와 함께 관리자  Q&A목록페이지로 이동
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
