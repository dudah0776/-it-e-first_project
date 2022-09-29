//김민선 생성
package com.dutyfree.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.OrderDAO;
import com.dutyfree.dto.CartVO;

public class OrderInsertAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "DutyfreeServlet?command=order_insert";

      // 세션에 있는 로그인된 memberId를 가지고 온다
      HttpSession session = request.getSession();
      String loginUser = (String) session.getAttribute("memId");
      
      // 로그인이 되어있지 않으면 로그인 폼으로 보낸다
      if (loginUser == null) {
         url = "DutyfreeServlet?command=login_form";
      } else {
    	// 로그인 된 회원의 카트를 가지고 온다
         OrderDAO orderDAO = OrderDAO.getInstance();
         ArrayList<CartVO> cartList = orderDAO.getCart(loginUser);
         // 로그인 된 회원의 오더 넘버를 가지고 온다
         int orderNo=orderDAO.getOrder(loginUser);
         // 카트를 오더에 넣는다
         for(int i=0;i<cartList.size();i++) {
         orderDAO.orderInsert(cartList.get(i), orderNo);
         }
         // 장바구니에 있는 내역을 지운다
         orderDAO.deleteAllCart(loginUser);
         // 주문내역 페이지로 이동
         url="DutyfreeServlet?command=order_detail";
         
      }
      //지정한 페이지로 이동
      response.sendRedirect(url);  
      }

}