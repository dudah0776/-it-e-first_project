<!-- 김나형 생성 -->
<!-- 장바구니에 담은 상품을 확인하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp"%>
<!-- 박진수 수정 -->
<%
	if (memId == null) {
%>
<script language='javascript'>
	location.href = '/DutyfreeServlet?command=Error';
</script>

<%} %>
<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>현대백화점인터넷면서점</title>
</head>

<body>
<script>
// 김나형 장바구니에서 원하는 상품을 삭제하는 function
function deleteItemBtn(no) {
	if(confirm("장바구니에서 해당 상품을 삭제하시겠습니까?")){
    	location.href = "DutyfreeServlet?command=cart_delete&delete="+no;
	} else {
		return;
	}
}
</script>
    <article id="content">

        <section class="cart_wrap">
            <ul class="title_tab">
                <li><a class="on" id="tabCart">장바구니</a></li>
                <li>주문결제</li>
            </ul>

                <c:choose>
                    <%-- 장바구니에 상품이 없을 경우 --%>
                    <c:when test="${cartList.size() == 0 }">
                        <div class="cart_contens">
                            <div class="cont_left" id="CART">
                                <input type="hidden" id="cartListLength" value="0">
                                <input type="hidden" id="cartSetListLength" value="0">

                                <div class="no_cartitem">
                                    <img src="//www.hddfs.com/shop/images/KO/common/cart_default.png" alt="">
                                    <p>
                                        장바구니가 비어있습니다 :)
                                    </p>
                                </div>
                                <div class="cart_list">
                                </div>

                                <div class="attention_area">
                                    <p class="attention_tit">유의사항</p>
                                    <div class="attention_list">
                                        • 장바구니에 담긴 상품은 30일간 보관됩니다.(장기간 보관을 원하실 경우 관심상품으로 등록(180일간 저장)하여 이용하시길 바랍니다.)<br>
                                        • 환율 변경 시점과 적립금의 사용조건에 따라 장바구니의 예상결제금액과 최종결제금액은 상이할 수 있습니다.<br>
                                        • 실제 할인금액은 개인별로 보유하신 적립금에 따라 차이가 있을 수 있습니다.<br>
                                        • 장바구니에 보관된 상품은 재고품절 및 할인율, 사은품이 수시로 변경될 수 있습니다.<br>
                                        • 주문 전 기내반입제한 안내를 확인하시기 바랍니다.<br>
                                        • 상품별로 한 주문번호당 주문 가능 수량이 제한될 수 있습니다.<br>
                                        • 세트상품은 함께 사면 할인 혜택을 받을 수 있는 상품이며, 주문 후 매장에 따라 교환권이 각기 다르게 발급될 수 있습니다.
                                    </div>
                                </div>
                                <div id="changeSetGoosQtyList"></div>
                            </div>
                            <div class="cont_left" id="TAB" style=" display:  none;"></div>
                            <div class="cont_right" style="height: 0px;">
                            </div>
                        </div>
                    </c:when>
                    <%-- 장바구니에 수량이 한개 이상이라도 있을 경우 --%>
                    <c:otherwise>
                        <div class="cart_contens">
                            <div class="cont_left" id="CART">
                                <input type="hidden" id="cartListLength" value="0"> <input type="hidden"
                                    id="cartSetListLength" value="0">

                                <div class="sorting_wrap">
                                    <div class="txt_total">

                                    </div>
                                </div>
								<%-- 카트 리스트에 있는 목록을 가져와 하나씩 출력해줌 --%>
                                <c:forEach items="${cartList}" var="cartVO">
                                    <div class="cart_list">
                                        <div class="item_area">
                                            <div class="item_chk">
                                                <span class="chk nolabel">

                                                </span>
                                                <div class="btn_area">
                                                	<input type="hidden" name="command" value="deleteCart">
                                                	<input type="hidden" name="delete" value="${cartVO.cartNo}">
                                                    <button class="btn_onoff btn_del"
                                                        onclick="deleteItemBtn(${cartVO.cartNo})">삭제</button>
                                                </div>
                                            </div>
                                            <div class="item_cont type_de">
                                                <div class="item_info_wrap">
                                                    <a href="DutyfreeServlet?command=product_detail&pNo=${cartVO.pNo}">
                                                        <div class="item_img">
                                                            <img src="images/${cartVO.pImage}" alt="${cartVO.pName}"
                                                                onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img252.jpg';">
                                                        </div>
                                                        <div class="item_title">
                                                            <strong>${cartVO.pBrand}</strong>
                                                            <span>${cartVO.pName}</span>
                                                        </div>
                                                        <del>$ ${cartVO.pPrice * cartVO.cDetailAmount}</del>
                                                        <p class="pay">
                                                            <strong>$
                                                            	${cartVO.pdc*cartVO.cDetailAmount}                                                           	
                                                            </strong>
                                                            <span>
                                                            	<fmt:formatNumber value="${cartVO.pwon * cartVO.cDetailAmount}" type="currency"/>
                                                            </span>
                                                        </p>
                                                    </a>
                                                    <div class="item_sel"></div>
                                                </div>
												<div class="item_buy_wrap">
                                                    <div class="item_buy">
                                                            <input type="text" class="count" id="${cartVO.cartNo}" value="${cartVO.cDetailAmount}개" min="0" name="goosQty" maxlength="5"
                                                            style="text-align:center; width: 120px;" readonly="readonly"/>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="attention_area">
                                    <p class="attention_tit">유의사항</p>
                                    <div class="attention_list">
                                        • 장바구니에 담긴 상품은 30일간 보관됩니다.(장기간 보관을 원하실 경우 관심상품으로 등록(180일간 저장)하여 이용하시길 바랍니다.)
                                        <br>
                                        • 환율 변경 시점과 적립금의 사용조건에 따라 장바구니의 예상결제금액과 최종결제금액은 상이할 수 있습니다.
                                        <br>
                                        • 실제 할인금액은 개인별로 보유하신 적립금에 따라 차이가 있을 수 있습니다.
                                        <br>
                                        • 장바구니에 보관된 상품은 재고품절 및 할인율, 사은품이 수시로 변경될 수 있습니다.
                                        <br>
                                        • 주문 전 기내반입제한 안내를 확인하시기 바랍니다.
                                        <br>
                                        • 상품별로 한 주문번호당 주문 가능 수량이 제한될 수 있습니다.
                                        <br>
                                        • 세트상품은 함께 사면 할인 혜택을 받을 수 있는 상품이며, 주문 후 매장에 따라 교환권이 각기 다르게 발급될 수 있습니다.
                                    </div>
                                </div>
                                <div id="changeSetGoosQtyList"></div>
                            </div>
                            <div class="cont_left" id="TAB" style="display: none;"></div>

                            <div class="cont_left" id="TAB" style=" display:  none;"></div>
                            <div class="cont_right" style="height: 416px;">
                                <div class="pay_table">
                                    <div class="pay_tit">예상주문금액</div>
                                    <div class="pay_list">
                                        <dl>
                                            <dt>주문금액합계</dt>
                                            <dd>
                                                <strong class="totalGoosUsd">$
                                                	${totalCost}
                                                </strong>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>예상할인금액</dt>
                                            <dd>
                                                <strong class="sale totalDcUsd">$
                                                	${totalSale}
                                                </strong>

                                            </dd>
                                        </dl>
                                        <dl class="total_pay">
                                            <dt>총 <strong class="sumGoosQty">
                                            	${totalAmount}
                                            </strong>개</dt>
                                            <dd>
                                                <strong class="payTotalSettUsd">$
                                                	${totalPrice}
                                                </strong>
                                                <span class="payTotalSettKrw">
                                                	<fmt:formatNumber value="${totalPrice2}" type="currency"/>원
                                                </span>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="pay_btm">
                                        <div class="pay_btns">
                                            <input type="hidden" id="aucaType" value="">
                                            <a href="javascript:void(0);" class="btnxl_type1"
                                               onclick = "location.href = 'DutyfreeServlet?command=cart_to_order' ";">주문하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
        </section>
    </article>
</body>

</html>