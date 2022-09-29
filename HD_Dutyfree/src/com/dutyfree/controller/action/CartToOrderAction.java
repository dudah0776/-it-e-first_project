// 김민선 생성
package com.dutyfree.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.OrderDAO;
import com.dutyfree.dao.CartDAO;
import com.dutyfree.dto.CartVO;

public class CartToOrderAction implements Action {
   
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "order/Order.jsp";
      
      // 세션에 있는 로그인된 memberId를 가지고 온다
      HttpSession session = request.getSession();
      String loginUser = (String) session.getAttribute("memId");

      // 로그인이 되어있지 않으면 로그인 폼으로 보낸다
      if (loginUser == null) {
         url = "DutyfreeServlet?command=login_form";
      } else {
         // 로그인 한 회원의 장바구니 내역을 담기
         CartDAO cartDAO = CartDAO.getInstance();
         ArrayList<CartVO> cartList = cartDAO.listCart(loginUser);   
         OrderDAO orderDAO = OrderDAO.getInstance();
         orderDAO.cartToOrder(loginUser);
      
          int totalPrice = 0; // 할인율까지 적용된 총 금액
          int totalAmount = 0; // 총 주문 수량
          int totalCost = 0; // 총 원가
          int totalSale = 0; // 총 할인가격
          
         //선언한 변수에 값 넣기
          for(CartVO cartVO : cartList) {
             totalCost += (cartVO.getpPrice() * cartVO.getcDetailAmount());
             totalPrice += (cartVO.getPdc()*cartVO.getcDetailAmount());
             totalAmount += cartVO.getcDetailAmount();
          }
          totalSale = totalCost - totalPrice;
          
         // 해당 페이지로 값 넘기
          request.setAttribute("cartList", cartList);
          request.setAttribute("totalPrice", totalPrice);
          request.setAttribute("totalAmount", totalAmount);
          request.setAttribute("totalCost", totalCost);
          request.setAttribute("totalSale", totalSale);
         
          
      }
      
      request.getRequestDispatcher(url).forward(request, response);
   }

}