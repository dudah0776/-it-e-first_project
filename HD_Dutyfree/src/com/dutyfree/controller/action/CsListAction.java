//김가희
package com.dutyfree.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.dao.CsDAO;
import com.dutyfree.dto.CsVO;

//고객센터 게시물목록
public class CsListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "cs/csList.jsp";
		
		//DB에서 모든게시물목록을 csList에 담아옴
		CsDAO csDAO = CsDAO.getInstance();
		ArrayList<CsVO> csList = csDAO.listCs();
		
		//게시물목록을 request에 담아서 게시물목록 화면으로 페이지이동
		request.setAttribute("csList", csList);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
