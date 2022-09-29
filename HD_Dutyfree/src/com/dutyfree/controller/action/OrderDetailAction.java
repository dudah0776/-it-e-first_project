//김민선 생성
package com.dutyfree.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.MemberDAO;
import com.dutyfree.dao.OrderDAO;
import com.dutyfree.dto.OrderVO;
import com.dutyfree.dto.MemberVO;

public class OrderDetailAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String url = "order/MyHD_orderlist.jsp";
      // 세션에 있는 로그인된 memberId를 가지고 온다
      HttpSession session = request.getSession();
      String loginUser = (String) session.getAttribute("memId");
      

      // 로그인이 되어있지 않으면 로그인 폼으로 보낸다
      if (loginUser == null) {
         url = "DutyfreeServlet?command=login_form";
      } else {
    	 // 로그인 된 회원의 주문내역을 가져옴
         OrderDAO orderDAO = OrderDAO.getInstance();
         MemberDAO dao=MemberDAO.getInstance();
         MemberVO member=dao.getMember(loginUser);
         ArrayList<OrderVO> orderList = orderDAO.listOrderById(loginUser);
   
         // 해당 페이지로 값 넘기기
         request.setAttribute("orderList", orderList);
         request.setAttribute("member", member);
      }
      
      request.getRequestDispatcher(url).forward(request, response);
   
   }
   

}