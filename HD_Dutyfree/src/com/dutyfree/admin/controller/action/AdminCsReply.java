//김가희
//고객센터 게시글(db)에 답변을 입력하고 다시 해당 게시글 상세보기 화면으로 이동
package com.dutyfree.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;
import com.dutyfree.dao.CsDAO;

public class AdminCsReply implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//답변데이터,게시물번호 가져옴
		String reply = request.getParameter("reply");
		int csNo = Integer.parseInt(request.getParameter("csNo"));
		
		//DB에 답변데이터 입력
		CsDAO csDAO = CsDAO.getInstance();
		csDAO.insertCsReply(csNo, reply);
		
		//다시 해당게시글 상세보기 페이지로 이동
		String url = "DutyfreeServlet?command=admin_cs_view&csNo="+csNo;
		response.sendRedirect(url);
	}

}
