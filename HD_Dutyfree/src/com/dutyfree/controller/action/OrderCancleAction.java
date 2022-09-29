// 김민선 생성
package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.OrderDAO;


public class OrderCancleAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String url = "DutyfreeServlet?command=order_detail";
      
      // 세션에 있는 로그인된 memberId를 가지고 온다
      HttpSession session = request.getSession();
      String loginUser = (String) session.getAttribute("memId");

      // 로그인이 되어있지 않으면 로그인 폼으로 보낸다

      if (loginUser == null) {
         url = "DutyfreeServlet?command=login_form";
      } else {
         //가져온 주문번호의 주문내역을 삭제함
         String orderNo = request.getParameter("orderNo");
         OrderDAO orderDao = OrderDAO.getInstance();
         orderDao.deleteOrder(Integer.parseInt(orderNo));
         
      // 지정된페이지로 이동
         response.sendRedirect(url);
      }

   }
}