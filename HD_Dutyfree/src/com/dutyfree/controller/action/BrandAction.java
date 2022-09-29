package com.dutyfree.controller.action;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dutyfree.dao.ProductDAO;
import com.dutyfree.dto.ProductVO;
//구영모 작성
public class BrandAction implements Action{
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      String url = null;
      /*
       *메인 페이지에서 특정 브랜드를 누르면 request로 그 브랜드 명을 받아온 다음
       * 그 값에 맞는 브랜드 페이지를 띄워주고 상품 정보들을 띄우는 역할을 한다.
       */
      //brand에 메인페이지에서 받아온 브랜드명을 받아온다.
      String brand = request.getParameter("brand").trim();
      //브랜드명이 ck이면 ck브랜드 페이지로 이동한다.
      if(brand.equals("ck")) {
         url="/brand/ck.jsp";
      }
      //브랜드명이 gucci이면 gucci브랜드 페이지로 이동한다.
      else if(brand.equals("gucci")) {
         url="/brand/gucci.jsp";
      }
      //브랜드명이 nerdy이면 nerdy브랜드 페이지로 이동한다.
      else if(brand.equals("nerdy")) {
         url="/brand/nerdy.jsp";
      }
      //브랜드명이 tomford이면 tomford브랜드 페이지로 이동한다.
      else if(brand.equals("tomford")) {
         url="/brand/tomford.jsp";
      }
      //브랜드명이 론진이면 론진브랜드 페이지로 이동한다.
      else if(brand.equals("론진")) {
         url="/brand/longines.jsp";
      }
      //브랜드명이 보스이면 보스브랜드 페이지로 이동한다.
      else if(brand.equals("보스")) {
         url="/brand/bose.jsp";
      }
      //브랜드명이 삼성이면 삼성브랜드 페이지로 이동한다.
      else if(brand.equals("삼성")) {
         url="/brand/samsung.jsp";
      }
      //브랜드명이 설화수이면 설화수브랜드 페이지로 이동한다.
      else if(brand.equals("설화수")) {
         url="/brand/sulwhasoo.jsp";
      }
      //브랜드명이 캉골이면 캉골브랜드 페이지로 이동한다.
      else if(brand.equals("캉골")) {
         url="/brand/kangol.jsp";
      }
      //브랜드명이 케라스타즈이면 케라스타즈브랜드 페이지로 이동한다.
      else if(brand.equals("케라스타즈")) {
         url="/brand/kerastase.jsp";
      }
      //ProductDAO의 인스턴스 값을 가져온다.
      ProductDAO productDAO=ProductDAO.getInstance();
      //ProductDAO의 브랜드명의 상품을 표시해주는 함수를 사용해 ProductVO 리스트 객체에 넣는다.
      ArrayList<ProductVO> productBrandList = productDAO.getbrandproduct(brand);
      //브랜드의 상품 총 개수를 받아오는 함수를 통해 개수를 가져온다.
      int prodAmount = productDAO.getbrandproductamount(brand);
      //ProductBrandList라는 이름의 브랜드 상품들을 object값으로 넘겨준다.
      request.setAttribute("ProductBrandList", productBrandList);
      //pordAmount라는 이름으로 브랜드 상품의 총개수를 넘겨준다.
      request.setAttribute("prodAmount", prodAmount);
      //각 조건에 맞는 브랜드 뷰 페이지의 경로로 해당 주소에 request값을 요청하고 response한다.
      request.getRequestDispatcher(url).forward(request,response);
   }
}
