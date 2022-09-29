// 김나형 생성
// 카트 리스트 생성하는 Action
package com.dutyfree.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.CartDAO;
import com.dutyfree.dao.MemberDAO;
import com.dutyfree.dto.CartVO;
import com.dutyfree.dto.MemberVO;


public class CartListAction implements Action {
	@Override
	 public void execute(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException {
	// 이동할 url 지정
	 String url = "mypage/cartList.jsp";
	 
	// 세션 생성
	 HttpSession session = request.getSession();
	 
	 // session에서 로그인한 유저의 아이디를 loginUser에 저장 
	 String loginUser = (String) session.getAttribute("memId");

	 // 로그인 되어 있지 않을 경우 로그인 페이지로 이동
	 if(loginUser == null) {
		 url = "DutyfreeServlet?command=login_form";
	 } else {
		 CartDAO cartDAO = CartDAO.getInstance();
		 
		 // CartDAO에 있는 listCart로 loginUser를 전달 후 cartList에 장바구니에 담은 상품들을 가져옴
		 ArrayList<CartVO> cartList = cartDAO.listCart(loginUser);

		 int totalPrice = 0; // 할인율까지 적용된 총 금액
		 int totalPrice2 = 0; // totalPrice를 한국기준으로 변환
		 int totalAmount = 0; // 총 주문 수량
		 int totalCost = 0; // 총 원가
		 int totalSale = 0; // 총 할인가격
		 
		 for(CartVO cartVO : cartList) {
			 totalCost += (cartVO.getpPrice() * cartVO.getcDetailAmount());
			 totalPrice += (cartVO.getPdc()*cartVO.getcDetailAmount());
			 totalPrice2 += (cartVO.getPwon()*cartVO.getcDetailAmount());
			 totalAmount += cartVO.getcDetailAmount();
		 }
		 totalSale = totalCost - totalPrice;
		 
		 // 속성값들의 value를 지정
		 request.setAttribute("cartList", cartList);
		 request.setAttribute("totalPrice", totalPrice);
		 request.setAttribute("totalPrice2", totalPrice2);
		 request.setAttribute("totalAmount", totalAmount);
		 request.setAttribute("totalCost", totalCost);
		 request.setAttribute("totalSale", totalSale);
		 
		}
	// 지정한 url로 이동
	 request.getRequestDispatcher(url).forward(request, response);
	}
}
