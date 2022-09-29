// 김나형 생성
// 회원가입 진행
package com.dutyfree.controller.action;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.MemberDAO;
import com.dutyfree.dto.MemberVO;

public class JoinAction implements Action {
   @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
	// 이동할 url 지정
    String url = "user/login_form.jsp";
    
    // 세션 생성
    HttpSession session = request.getSession();
    
    // Member의 정보를 저장할 memberVO 객체 생성
    MemberVO memberVO = new MemberVO();
    
    // memberVO 객체에 회원정보로 저장될 값들을 받아오기
    memberVO.setMemId(request.getParameter("reid"));
    memberVO.setMemPw(request.getParameter("pwd"));
    memberVO.setMemName(request.getParameter("name"));
    memberVO.setMemGender(request.getParameter("sex"));
    memberVO.setMemBirth(Date.valueOf(request.getParameter("birth")));
    memberVO.setMemPassport(request.getParameter("passport"));
    memberVO.setMemPhone(request.getParameter("phone")); 

    // 세션에 join_success 값 저장하기
	request.setAttribute("join_success","join_success");  
    
	// MemberDAO에 있는 insertMember로 정보 전달
    MemberDAO memberDAO = MemberDAO.getInstance();
    memberDAO.insertMember(memberVO);
    
    // 지정한 url로 이동
    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
    dispatcher.forward(request, response);
    }
}