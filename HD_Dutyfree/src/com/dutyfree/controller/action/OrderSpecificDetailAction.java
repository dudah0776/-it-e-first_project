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

public class OrderSpecificDetailAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String url = "order/OrderDetail.jsp";
      // 세션에 있는 로그인된 memberId를 가지고 온다
      HttpSession session = request.getSession();
      String loginUser = (String) session.getAttribute("memId");

      // 로그인이 되어있지 않으면 로그인 폼으로 보낸다
      if (loginUser == null) {
         url = "DutyfreeServlet?command=login_form";
      } else {
         // 주문 번호를 받아오기
         int orderNo = Integer.parseInt(request.getParameter("orderNo"));
         OrderDAO orderDAO = OrderDAO.getInstance();
         // 로그인한 회원의 회원정보를 가져오기
         MemberDAO dao = MemberDAO.getInstance();
         MemberVO member = dao.getMember(loginUser);
         // 받아온 주문 번호의 주문 상세 내역을 가져오기
         ArrayList<OrderVO> orderList = orderDAO.detailOrderByOrderNo(orderNo);
         
         int dcPrice = 0; // 할인 금액
         int dcPriceWon = 0; // 할인 금액 원화
         int totalPrice = 0; // 할인 전 총금액
         int totalPriceDc = 0; // 할인 금액 총액

         //선언한 변수에 값 넣기
         for (OrderVO ovo : orderList) {
            dcPrice = (ovo.getpPrice() * ovo.getpDiscount()) / 100;
            dcPriceWon = ovo.getpPrice() * ovo.getpDiscount() * 1347 / 100;
            
         }
         for (OrderVO ovo : orderList) {
            totalPrice += ovo.getpPrice();
            totalPriceDc += dcPrice;
         }
         
         ///해당 페이지로 값 넘기기
         request.setAttribute("orderNo", orderNo);
         request.setAttribute("orderList", orderList);
         request.setAttribute("dcPrice", dcPrice);
         request.setAttribute("dcPriceWon", dcPriceWon);
         request.setAttribute("totalPrice", totalPrice);
         request.setAttribute("totalPriceDc", totalPriceDc);
         request.setAttribute("member", member);

      }
      
      request.getRequestDispatcher(url).forward(request, response);

   }

}