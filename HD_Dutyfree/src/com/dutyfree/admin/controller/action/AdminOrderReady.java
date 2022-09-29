//김가희
//관리자 주문의 배송상태를 변경하는 action
package com.dutyfree.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;
import com.dutyfree.dao.OrderDAO;

public class AdminOrderReady implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "DutyfreeServlet?command=admin_order_list";
		
		//변경할상태, 주문번호 가져옴
		String status = (String)request.getParameter("status");
		int oNo = Integer.parseInt(request.getParameter("orderNo"));
		
		//DB에서 주문의 배송상태 변경
		OrderDAO odDAO = OrderDAO.getInstance();
		odDAO.ordersReady(status,oNo);
		
		//다시 관리자 주문목록 페이지로 이동
		response.sendRedirect(url);

	}

}
