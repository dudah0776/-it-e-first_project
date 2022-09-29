// 김나형 생성
// 카트에 상품 Insert하는 Action
package com.dutyfree.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.CartDAO;
import com.dutyfree.dto.CartVO;

public class CartInsertAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이동할 url 지정
		String url = "DutyfreeServlet?command=cart_list";

		// 세션 생성
		HttpSession session = request.getSession();

		// session에서 로그인한 유저의 아이디를 loginUser에 저장
		String loginUser = (String) session.getAttribute("memId");

		// 로그인이 안되어 있으면 로그인 페이지로 이동
		if (loginUser == null) {
			url = "DutyfreeServlet?command=login_form";
		} else {
			// productpage에서 cDetailAmount와 pNo을 받아오고 그 값들과 loginUser를 cartVO 객체를 생성해 저장
			CartVO cartVO = new CartVO();
			cartVO.setcDetailAmount(Integer.parseInt(request.getParameter("cDetailAmount")));
			cartVO.setpNo(Integer.parseInt(request.getParameter("pNo")));
			cartVO.setMemId((String) loginUser);

			// CartDAO에 있는 insertCart에 cartVO 값들을 전달
			CartDAO cartDAO = CartDAO.getInstance();
			cartDAO.insertCart(cartVO);
		}
		// 지정한 url로 이동
		response.sendRedirect(url);
	}
}