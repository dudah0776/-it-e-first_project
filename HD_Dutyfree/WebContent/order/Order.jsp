<!-- 
김민선 생성
주문 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../include/header.jsp"%>
<!-- 
	박진수
session의 memId가 null이면 로그인한 사용자가 아니기 때문에 
'/DutyfreeServlet?command=Error'를 실행 	
-->
<%
   if (memId == null) {
%>
<script language='javascript'>
   location.href = '/DutyfreeServlet?command=Error';
</script>
<% } %>
<body>
   <script>
      function order() {
         var result = confirm("주문하시겠습니까?");
         

         if (result) {

            alert("주문되었습니다.");
            location.href = 'DutyfreeServlet?command=order_insert';
            

         } else {
            alert("주문취소되었습니다.");
         }
      }
   </script>
   <div id="wrap">

      <form method="post" name="orderForm" id="orderForm">

         <article id="content">
            <section class="orderpayment_wrap">
               <ul class="title_tab">
                  <li>장바구니</li>
                  <li><strong class="on" id="tabOrder">주문결제</strong></li>
               </ul>
               <div class="payment_board">
                  <div class="order_sheet">

                     <c:forEach items="${cartList}" var="cartVO">
                        <div class="cart_list">
                           <div class="item_area">
                              <div class="item_chk">
                                 <span class="chk nolabel"> </span>
                                 <div class="btn_area">
                                    <input type="hidden" name="command" value="deleteCart">
                                    <input type="hidden" name="itemNo" value="${cartVO.cartNo}">
                                 </div>
                              </div>
                              <div class="item_cont type_de">
                                 <div class="item_info_wrap">
                                    <a
                                       href="DutyfreeServlet?command=product_detail&pNo=${cartVO.pNo}">
                                       <div class="item_img">
                                          <img src="images/${cartVO.pImage}" alt="${cartVO.pName}"
                                             onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img252.jpg';">
                                       </div>
                                       <div class="item_title">
                                          <strong>${cartVO.pBrand}</strong> <span>${cartVO.pName}</span>
                                       </div> <del>$ ${cartVO.pPrice * cartVO.cDetailAmount}</del>
                                       <p class="pay">
                                          <strong>$ ${cartVO.pdc*cartVO.cDetailAmount} </strong> <span>
                                             <fmt:formatNumber
                                                value="${cartVO.pwon * cartVO.cDetailAmount}"
                                                type="currency" />
                                          </span>
                                       </p>
                                    </a>
                                    <div class="item_sel"></div>
                                 </div>

                                 <div class="item_buy_wrap" >
                                 
                                    
                                       <div style = " padding-left: 30px; font-size: 20px; border : 1px solid black;"class="count num_amount">
                                          수량 : ${cartVO.cDetailAmount}
                                       </div>
      
                                 </div>

                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     <div class="payment_sheet scroll-sticky">

                        <div class="title">
                           <h4>최종결제금액</h4>
                           <em>총 ${totalAmount}개</em>
                        </div>
                        <ul class="total_bill">
                           <li><strong>총 주문금액합계</strong> <span> <em>$
                                    ${totalCost}</em>
                                 <p>
                                    <fmt:formatNumber value="${totalCost * 1347}"
                                       pattern="#,###" />
                                    원
                                 </p>
             
                           </span></li>
                           <li class="discount_list"><strong>
                                 <button type="button" class="btn">총할인금액</button>
                           </strong> <span> <em class="totalDcUsd">$ ${totalSale}</em>
                                 <p class="totalDcKrw">
                                    <fmt:formatNumber value="${totalSale * 1347}"
                                       pattern="#,###" />
                                    원
                                 </p>
                           </span>
                        </ul>
                        <div class="total_amount">
                           <h5>최종결제금액</h5>
                           <div>
                              <em class="totalSettUsd">$ ${totalPrice}</em>
                              <p class="won totalSettKrw">
                                 <fmt:formatNumber value="${totalPrice * 1347}"
                                    pattern="#,###" />
                                 원
                              </p>
                           </div>
                        </div>

                        <div class="confirm">
                       
                           <a href="javascript:void(0);" class="btn" onclick="order();">결제하기</a>
                     
                        </div>
                     </div>
                  </div>
            </section>
         </article>


      </form>



   </main>

  
   <%@include file="../include/footer.jsp"%>

</body>
</html>