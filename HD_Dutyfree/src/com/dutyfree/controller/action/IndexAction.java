package com.dutyfree.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dutyfree.dao.ProductDAO;
import com.dutyfree.dto.ProductVO;

//구영모 작성
public class IndexAction implements Action{
    /*
     *메인 페이지에서 럭키딜, 브랜드별 최대할인 상품을 불러오기 위한 클래스
     *관리자 페이지에서 주문 목록을 불러오기 위한 클래스
     */
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
	  //index 액션을 받아오면 메인 페이지를 띄우기 위한 url경로 지정
      String url="/index.jsp";
      //ProductDAO의 인스턴스 값을 가져온다.
      ProductDAO productDAO=ProductDAO.getInstance();
      //ProductDAO의 주문 목록을 불러오는 함수를 사용해 ProductVO 리스트 객체에 넣는다.
      ArrayList<ProductVO> productList = productDAO.listProduct();
      //ProductDAO의 브랜드별로 할인율이 가장 높은 품목을 찾는 함수를 사용해 ProductVO 리스트 객체에 넣는다.
      ArrayList<ProductVO> BrandProduct = productDAO.BrandProduct();
      //ProductDAO의 할인율이 가장 높은 품목을 찾는 함수를 사용해 ProductVO 리스트 객체에 넣는다.
      ArrayList<ProductVO> DiscountProduct = productDAO.DiscountProduct();
      //ProductList라는 이름의 주문 상품들을 object값으로 넘겨준다.
      request.setAttribute("ProductList", productList);
      //BrandProduct라는 이름의 브랜드별 최대할인 상품들을 object값으로 넘겨준다.
      request.setAttribute("BrandProduct", BrandProduct);
      //DiscountProduct라는 이름의 최대할인 상품들을 object값으로 넘겨준다.
      request.setAttribute("DiscountProduct", DiscountProduct);
      //각 조건에 맞는 브랜드 뷰 페이지의 경로로 해당 주소에 request값을 요청하고 response한다.
      request.getRequestDispatcher(url).forward(request,response);
   }
}