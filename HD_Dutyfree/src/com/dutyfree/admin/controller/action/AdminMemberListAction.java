//김가희
//관리자 회원목록 페이지로 이동시켜주는 action
package com.dutyfree.admin.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;
import com.dutyfree.dao.MemberDAO;
import com.dutyfree.dto.MemberVO;

public class AdminMemberListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/member/memList.jsp";

		//DB에서 회원목록을 받아서 memList에 저장
		MemberDAO memDAO = MemberDAO.getInstance();
		ArrayList<MemberVO> memList = memDAO.listMember();

		//회원목록을 request에 담음
		request.setAttribute("memList", memList);
		
		//request,response와 함께 관리자 회원목록 페이지로 이동
		request.getRequestDispatcher(url).forward(request, response);
	}

}
