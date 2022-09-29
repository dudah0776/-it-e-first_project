//김가희
//관리자 상품목록 화면으로 이동시켜주는 action
package com.dutyfree.admin.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dutyfree.controller.action.Action;
import com.dutyfree.dao.OrderDAO;
import com.dutyfree.dao.ProductDAO;
import com.dutyfree.dto.OrderVO;
import com.dutyfree.dto.ProductVO;

public class AdminProductListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/product/productList.jsp";
		
		//DB에서 전체 상품목록을 받아와서 pList에 저장
		ProductDAO prodDAO = ProductDAO.getInstance();
		ArrayList<ProductVO> pList = prodDAO.listProduct();
		
		//pList를 request에 담아서 관리자 상품목록 화면으로 페이지이동
		request.setAttribute("pList", pList);
		request.getRequestDispatcher(url).forward(request, response);

	}

}
