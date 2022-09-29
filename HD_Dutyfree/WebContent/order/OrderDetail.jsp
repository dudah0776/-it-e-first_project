<!-- 
김민선 생성
주문 상세 목록 페이지
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
<% } %>

<!DOCTYPE html>

<html lang="ko">
<!-- 주문취소 -->
<script>
function deleteOrderBtn(oNo) {
   if(confirm("주문을 취소하시겠습니까?")){
      location.href = 'DutyfreeServlet?command=order_cancle&orderNo='+oNo;
       
   } else {
      return;
   }
}
</script>

<body>
   <div id="wrap">
   
         <main id="container">
            <article class="location">
               <section class="box">
                  <a nohref onclick="goUrl('/dm/main.do');" class="home">홈</a>
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
                     <dl style="height: 200px; padding-top: 80px;">
                        <a href="주문내역">
                           <dt style="font-size: 20px;">주문내역</dt>
                        </a>
                     </dl>
                     <dl style="height: 200px; padding-top: 80px;">
                        <a href="/mm/myCont/listCounQustBbs.do">
                           <dt style="font-size: 20px;">문의내역</dt>
                        </a>
                     </dl>
                     <dl style="height: 200px; padding-top: 80px;">
                        <a href="/mm/myInfo/inptMbshPwd.do?type=base">
                           <dt style="font-size: 20px;">기본정보관리</dt>
                        </a>
                     </dl>
                     <dl style="height: 200px; padding-top: 80px;">
                        <a href="/mm/myInfo/inptMbshPwd.do?type=pspt">
                           <dt style="font-size: 20px;">여권정보관리</dt>
                        </a>
                     </dl>
                     <dl style="height: 200px; padding-top: 80px;">
                        <a href="">
                           <dt style="font-size: 20px;">출국정보관리</dt>
                        </a>
                     </dl>
                  </div>
               </div>
   </div>
   </article>

   <article id="content">

      <section class="myhd_content">
         <div class="cont_stit">
            <h3>주문내역</h3>
         </div>
       
         <div class="sorting_wrap myhd">
            <div class="sort_r"></div>
         </div>

         <div id="onlnlist">
            <div class="list_table01">
               <table>
                  <colgroup>
                     <col width="150px">
                     <col width="350px">
                     <col width="70px">
                     <col width="150px">
                     <col width="150px">
                     <col width="200px">

                  </colgroup>
                  <tbody>
                     <tr>
                        <th>상품번호</th>
                        <th>상품명</th>
                        <th>판매금액</th>
                        <th>수량</th>
                        <th>할인금액</th>
                        <th>결제금액</th>
                     </tr>
                     <c:forEach items="${orderList}" var="orderVO">
                     <tr>
                        <td rowspan="1" class="td_btns"><p>${orderVO.odNo}</p></td>
                           
                        <td><a
                            style="cursor: pointer;" class="product_info"> <span
                              class="on_img"><img
                                 src="images/${orderVO.pImage}"
                                 "></span>
                                 
                              <dl>
                                 <dt>${orderVO.pBrand}</dt>
                                 <dd>${orderVO.pName}</dd>

                              </dl>
                        </a></td>

                        <td><del class="delprice">$ ${orderVO.pPrice}</del>
                           <p class="dollar c_dark">$ ${orderVO.pPricedc}</p></td>
                        <td>${orderVO.odAmount}</td>
                        <td>
                        
                           <p class="dollar c_dark">$ ${dcPrice * orderVO.odAmount}</p>
                           <p class="k_won">
                              <fmt:formatNumber value="${dcPriceWon* orderVO.odAmount}" pattern="#,###" />
                              <span>원</span>
                           </p>
                        </td>
                        
              
                        <td>
                           <p class="dollar">$ ${orderVO.pPricedc * orderVO.odAmount}</p>
                           <p class="k_won">
                              <fmt:formatNumber
                                 value="${orderVO.pPricewon * orderVO.odAmount}"
                                 pattern="#,###" />
                              <span>원</span>
                        </c:forEach >
                          
                  </tbody>
               </table>
               <input type="hidden" id="showCoupYn" value="N"> <input
               
                  type="hidden" id="depositWaitYn" value="Y"> <input
                  type="hidden" id="orderBillCnt" value="2"> <input
                  type="hidden" id="partCnclPsbYn" value="Y">
            </div>
         </div>
         
         <div class="cont_stit">
            <h3>결제 정보</h3>
         </div>

         <div class="payment_infobox">
            <div class="paybox">
               <div>
                  <strong class="total_tit">총 주문금액</strong>
                  <p class="pay_dollar">$ ${totalPrice}</p>
                  <p class="pay_won">
                     <fmt:formatNumber value="${totalPrice*1347}" pattern="#,###" />
                     <span>원</span>
                  </p>
               </div>
               
               <div class="discount_total">
                  <strong class="total_tit">총 할인금액</strong>
                  <p class="pay_dollar">$ ${totalPriceDc}</p>
                  <p class="pay_won">
                     <fmt:formatNumber value="${totalPriceDc * 1347}" pattern="#,###" />
                     <span>원</span>
                  </p>
               </div>
               
               <div>
                  <strong class="total_tit">최종 결제금액</strong>
                  <p class="pay_dollar">$ ${totalPrice - totalPriceDc}</p>
                  <p class="pay_won">
                     <fmt:formatNumber value="${(totalPrice - totalPriceDc) *1347}"
                        pattern="#,###" />
                     <span>원</span>
                  </p>

               </div>
            </div>
      
      
         <div class="btn_area">
                    
            <button onclick = "deleteOrderBtn(${orderNo});"class="btnde_type14 mid">주문취소</button>

         </div>
      
         </div>
         <div class="box_gray2 por">
            <p>주문/취소/반품관련 문의사항은 1:1 상담문의를 통해 이용하실 수 있습니다.</p>
            <div class="poa_rbtn">
               <button
                  onclick="location.href='https://www.hddfs.com/shop/om/consmCoun/addCoun.do'"
                  class="btnc_type_s">1:1 상담문의</button>
            </div>
         </div>
         <div class="cont_stit">
            <h3>주문자/여권정보</h3>
         </div>
         <div class="info_table">
            <table>
               <colgroup>
                  <col style="width: 150px">
                  <col style="width: 390px">
                  <col style="width: 150px">
                  <col style="width: auto">
               </colgroup>
               <tr>
                  <th>아이디</th>
                  <td>${member.memId}</td>
                  <th>성명</th>
                  <td>${member.memName}</td>

               </tr>
               <tr>
                  <th>생년월일</th>
                  <td>${member.memBirth}</td>
                  <th>휴대폰번호</th>
                  <td>${member.memPhone}</td>
               </tr>

               <tr>
                  <th>여권번호</th>
                  <td style="border-right: 1px solid #e5e5e5;">${member.memPassport}</td>
               </tr>

            </table>
         </div>


         
         <div class="cont_stit">
            <h3>인도장 안내</h3>
         </div>
         <div class="airport_map">
            <img class="map_img"
               src="https://cdn.hddfs.com/files/om/20181005/3431816b_201810051530069510.jpg?sf=webp"
               alt="인도장 이미지"
               onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img666x310.jpg';">
            <dl class="map_info">
               <dt>위치안내</dt>
               <dd>인천공항 T2 2번 출입국 심사대 통과 후 252번 게이트 건너편 4층</dd>
               <dt>문의안내</dt>
               <dd>인도장 : 1811-6688</dd>
               <dt>상담시간</dt>
               <dd>09:30 ~ 18:30</dd>
            </dl>
         </div>
         <div class="attention_area">
            <p class="attention_tit">유의사항</p>
            <div class="attention_list">
               &bull; 결제 완료 후 주문 내역에서 구매하신 상품이 확인되지 않을 경우 로그아웃 후 재로그인 해주시기 바랍니다.<br />
               <br /> &bull; 아래의 경우 인도장에서 상품 수령이 제한되오니 반드시 확인해 주시기 바랍니다.<br /> -
               주문하신 고객님과 출국하시는 고객님의 정보가 불일치 할 경우<br /> - 주문서에 기재된 여권번호와 출국 시
               여권번호가 불일치 할 경우<br /> - 등록된 출국정보(출국장소, 출국일시, 편명 등)와 실 출국정보가 다른 경우<br />
               <br /> &bull; 출국 정보 변경을 원하실 경우, 출국일 최소 3일 전에 고객센터로 연락해 주시기
               바랍니다.(단, 지방공항 이용 시 4일전)<br /> &bull; 출국 시 인도받지 못한 물건은 고객센터로 연락
               바랍니다.<br /> &bull; 주문에 대한 궁금하신 사항은 FAQ에서 확인이 가능합니다. FAQ 바로가기<br />
               &bull; 추가 궁금하신 내용은 고객센터 (1811-6688 / 운영시간 09:30~18:30) 로 문의바랍니다. <a
                  href="https://www.hddfs.com/shop/om/consmComm/faq.do"
                  class="link_txt_point">FAQ 바로가기</a>
            </div>
         </div>

      </section>
   </article>

 
   <%@include file="../include/footer.jsp"%>
   
 
</body>
</html>