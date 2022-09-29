//김가희
//관리자 상품수정 action
package com.dutyfree.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;
import com.dutyfree.dao.ProductDAO;

public class AdminProdUpdate implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "DutyfreeServlet?command=admin_product_list";
		
		//상품번호와 type을 받아옴
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int type=Integer.parseInt(request.getParameter("type"));
		
		
		ProductDAO pDAO = ProductDAO.getInstance();
		//type이 1이면 상품수량 수정
		if(type==1) {
			int amount = Integer.parseInt(request.getParameter("pamount"));
			pDAO.updateProd(type,pNo, amount);
		}
		//type이 2이면 상품할인률 수정
		else if(type==2) {
			int dc = Integer.parseInt(request.getParameter("pDC"));
			pDAO.updateProd(type,pNo, dc);
		}
		//type이 3이면 상품가격 수정
		else {
			int price = Integer.parseInt(request.getParameter("pPrice"));
			pDAO.updateProd(type,pNo,price);
		}
		
		//관리자 상품목록 페이지로 이동
		response.sendRedirect(url);

	}

}
