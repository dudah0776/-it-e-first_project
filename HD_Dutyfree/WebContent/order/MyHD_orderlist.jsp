<!-- 
김민선 생성
주문 목록 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<%
   }
%>
<!DOCTYPE html>
<html lang="ko">

<body>
   <!-- container -->
   <main id="container">
      <script type="text/javascript"
         src="https://cdn.hddfs.com/front/js/KO/jquery-barcode.js?ver=18"></script>


      <main id="container">
         <article class="location">
            <section class="box">
               <a class="home">홈</a>
               <div>
                  <span>마이현대</span>
               </div>
               <div>
                  <span>주문 내역</span>
               </div>
            </section>
         </article>
         <article class="top_fullbg">
            <h2 class="page_tit">주문 내역</h2>
            <div class="myhd_firinfo">
               <div class="myinfo">
                  <p class="name">
                     <strong> ${member.memName}</strong> <em>님</em>
                  </p>

                  <div class="mylv" style="padding-top: 10px;">
                     <span class="lv_on_up001"></span> <span class="lv_off_up002"></span>
                  </div>
               </div>
               <div class="mypresent">
                  <dl style="height: 200px; padding-top: 80px; width: 250px;">
                     <a href="DutyfreeServlet?command=order_detail">
                        <dt style="font-size: 20px;">주문내역</dt>
                     </a>
                  </dl>
                  <dl style="height: 200px; padding-top: 80px; width: 250px;">
                     <a href="DutyfreeServlet?command=cs_Mylist">
                        <dt style="font-size: 20px;">문의내역</dt>
                     </a>
                  </dl>
                  <dl style="height: 200px; padding-top: 80px; width: 250px;">
                     <a href="DutyfreeServlet?command=Update_page">
                        <dt style="font-size: 20px;">기본정보관리</dt>
                     </a>
                  </dl>


               </div>
            </div>

         </article>


         <article id="content">
            <section class="myhd_content" style="padding-top: 0px;">

               <div class="tab-action">
                  <div class="ui-tab tab_center "
                     style="font-size: 30px; font-weight: 700; text-decoration: underline; text-underline-position: under; text-decoration-thickness: 3px;">주문일
                     기준</div>



                  <div id="my_order">
                     <div class="cart_list" id="onln_list">
                        <div id="dpatDiv">
                           <div id="date_departure">
                              <div class="sorting_wrap myhd"">

                              <div class="list_table01">
                                 <table>
                                    <colgroup>
                                       <col width="108px">
                                       <col width="100%">
                                       <col width="140px">
                                       <col width="298px">
                                       <col width="55px">
                                       <col width="156px">
                                       <col width="106px">
                                    </colgroup>
                                    <tbody id="onlnDpatList_cart">
                                       <tr>
                                          <th>주문일자</th>
                                          <th>주문번호</th>
                                          <th>이미지</th>
                                          <th>상품명</th>
                                          <th>수량</th>
                                          <th>상품별 결제금액</th>
                                          <th>주문상태</th>
                                       </tr>

                                       <c:forEach items="${orderList}" var="orderVO">
                                          <tr id="onlnDpatList_add">

                                             <td>${orderVO.oDate}</td>
                                             <!-- 김가희추가, 주문번호누르면 주문상세내역보이게 -->
                                             <td><a
                                                href="DutyfreeServlet?command=order_specificdetail&orderNo=${orderVO.oNo}"
                                                class="order_number numshort">${orderVO.oNo}</a></td>

                                             <td>
                                                <div class="product_info" style="padding-left: 35px;">
                                                   <span class="on_img"> <img
                                                      src="images/${orderVO.pImage}">
                                                   </span>
                                                </div>
                                             </td>
                                             <td>
                                                <dl>
                                                   <dt>${orderVO.pName}</dt>
                                                   <dd>${orderVO.pDetail}</dd>
                                                </dl>
                                             </td>
                                             <td>${orderVO.odAmount}</td>
                                             <td>
                                                <p class="dollar">$ ${orderVO.pPricedc}</p>
                                                <p class="k_won">
                                                   <fmt:formatNumber value="${orderVO.pPricedc*1347}" pattern="#,###" />
                                                   <span>원</span>
                                                </p>
                                             </td>
                                             <!-- 김가희 추가 -->
                                             <td>
                                                <c:choose>
                                                   <c:when test="${orderVO.oShipping==0}">
                                                      주문접수
                                                   </c:when>
                                                   <c:when test="${orderVO.oShipping==1}">
                                                      인도중
                                                   </c:when>
                                                   <c:when test="${orderVO.oShipping==2}"> 인도완료 </c:when>
                                                </c:choose>
                                             </td>

                                          </tr>
                                       </c:forEach>

                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>


                     </div>
                     </form>
                  </div>
                  <div class="attention_area">
                     <p class="attention_tit">유의사항</p>
                     <div class="attention_list">
                        &bull; 결제 완료 후 주문 내역에서 구매하신 상품이 확인되지 않을 경우 로그아웃 후 재로그인 해주시기
                        바랍니다.<br /> &nbsp;&nbsp;<br /> &bull; 아래의 경우 인도장에서 상품 수령이
                        제한되오니 반드시 확인해 주시기 바랍니다.<br /> - 주문하신 고객님과 출국하시는 고객님의 정보가 불일치 할
                        경우<br /> - 주문서에 기재된 여권번호와 출국 시 여권번호가 불일치 할 경우<br /> - 등록된
                        출국정보(출국장소, 출국일시, 편명 등)와 실 출국정보가 다른 경우<br /> <br /> &bull; 출국
                        정보 변경을 원하실 경우, 출국일 최소 3일 전에 고객센터로 연락해 주시기 바랍니다.(단, 지방공항 이용 시
                        4일전)<br /> &bull; 출국 시 인도받지 못한 물건은 고객센터로 연락 바랍니다.<br />
                        &bull;&nbsp;화장품/식품等 유통기한과 연관있는 상품의 경우 출국정보 변경 시 유통기한이 임박 또는 초과된
                        상품을 받을 수 있으므로 유의하시기 바랍니다.<br /> &bull; 추가 궁금하신 내용은 고객센터
                        (1811-6688 / 운영시간 09:30~18:30) 로 문의바랍니다. <a
                           href="https://www.hddfs.com/shop/om/consmComm/faq.do"
                           class="link_txt_point">FAQ 바로가기</a>
                     </div>
                  </div>
                  <div id="printCoup"></div>
                  <div id="oflnEltRcpt"></div>
                  <div id="onlnEltRcpt"></div>
            </section>
         </article>
      </main>
   
      <%@include file="../include/footer.jsp"%>

</body>
</html>