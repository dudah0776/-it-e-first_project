//김가희
//관리자 주문목록 화면으로 이동시켜주는 action
package com.dutyfree.admin.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;
import com.dutyfree.dao.OrderDAO;
import com.dutyfree.dto.OrderVO;

public class AdminOrderListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/order/orderList.jsp";
		
		//DB에서 전체 주문목록을 받아와서 orderList에 저장
		OrderDAO orderDAO = OrderDAO.getInstance();
		ArrayList<OrderVO> orderList = orderDAO.listOrder();
		
		//orderList를 request에 담아서 관리자 주문목록 화면으로 페이지이동
		request.setAttribute("orderList", orderList);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
