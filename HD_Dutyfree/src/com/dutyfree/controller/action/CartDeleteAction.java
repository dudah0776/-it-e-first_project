// 김나형 생성
// 장바구니 리스트 중 원하는 상품 삭제하는 Action
package com.dutyfree.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.CartDAO;

public class CartDeleteAction implements Action {
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   // 이동할 url 지정
	  String url = "DutyfreeServlet?command=cart_list";
	  
	  // cartNO의 값을 가져와 cDetailNo에 저장
      String cDetailNo = request.getParameter("delete");

      // CartDAO에 있는 deleteCart로 cDetailNo 전달
      CartDAO cartDAO = CartDAO.getInstance();
      cartDAO.deleteCart(Integer.parseInt(cDetailNo));
      System.out.println(cDetailNo);
      // 지정한 url로 이동
      request.getRequestDispatcher(url).forward(request, response);
   }
}