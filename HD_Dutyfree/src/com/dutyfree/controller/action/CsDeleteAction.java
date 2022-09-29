//김가희
package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.dao.CsDAO;

//고객센터 게시물 삭제
public class CsDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "DutyfreeServlet?command=cs_list";
		//request에서 게시물의 번호(csNo)를 받아옴
		int csNo = Integer.parseInt(request.getParameter("csNo"));
		
		//DB에서 게시물번호로 해당게시물을 삭제처리
		CsDAO csDAO = CsDAO.getInstance();
		csDAO.deleteCs(csNo);
		
		//다시 고객센터 목록화면으로 이동
		response.sendRedirect(url);
	}

}
