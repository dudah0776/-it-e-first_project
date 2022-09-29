package com.dutyfree.controller.action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dutyfree.dao.ProductDAO;
import com.dutyfree.dto.ProductVO;

//구영모 작성
public class ProductDetailAction implements Action{
	/*
	 *상품 페이지에서 pNo값에 맞는 상품의 정보를 불러오기 위한 클래스
	 */
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
	  //product_details 액션을 받아오면 상품 페이지를 띄우기 위한 url경로 지정
      String url = "product/productpage.jsp";
      //상품을 식별하기 위해 pNo값을 가져온다
      String pNo = request.getParameter("pNo").trim();
      //ProductDAO의 인스턴스 값을 가져온다.
      ProductDAO productDAO = ProductDAO.getInstance();
      //ProductDAO의 pNo값에 맞는 인스턴스로 상품 정보를 받아온다
      ProductVO productVO = productDAO.getproduct(pNo);
      //productVO라는 이름의 상품정보를 object값으로 넘겨준다.
      request.setAttribute("productVO", productVO);
      //각 조건에 맞는 브랜드 뷰 페이지의 경로로 해당 주소에 request값을 요청하고 response한다.
      request.getRequestDispatcher(url).forward(request,response);   
      
   }
}