//김가희
package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.CsDAO;
import com.dutyfree.dto.CsVO;
import com.dutyfree.dto.MemberVO;

//고객센터 게시물작성
public class CsWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "DutyfreeServlet?command=cs_list";
		
		//로그인한 사용자 아이디 받아오기
		String loginId = (String) request.getSession().getAttribute("memId");

		//고객센터 게시글 객체 생성해서 제목(title)과 내용(content)을 받아오고, 로그인한 아이디를 작성자로 넣음
		CsVO csVO = new CsVO();
		csVO.setCsTitle(request.getParameter("title"));
		csVO.setCsContent(request.getParameter("content"));
		csVO.setMemId(loginId);

		//게시글 객체를 db에 저장
		CsDAO csDAO = CsDAO.getInstance();
		csDAO.insertCs(csVO);

		//고객센터 목록 화면으로 전환
		response.sendRedirect(url);

	}

}
