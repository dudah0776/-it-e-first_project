<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>현대백화점인터넷면세점</title>
<!-- 구영모 작성 -->
<!-- 설명 : 상품 상세 페이지로써 상품의 가격과 할인가 등 여러가지 상품 정보를 표시하고 장바구니와 바로구매로 넘어갈 수 있게 해주는 페이지 입니다. -->
<!-- servlet으로 받아온 상품의 번호(pNo)를 식별자로 받아와서 그 상품 번호의 정보를 productVO를 통해 페이지에 표시 -->
<!-- 현대 백화점 면세점 홈페이지의 css사용 -->
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/productdetail.css">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/product.css">
<!-- 헤더 불러오기 -->
<%@ include file="../include/header.jsp"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	//구영모 작성
	//스크롤을 내리면 pd_visual 클래스의 div값을 자동으로 위치 조정해주는 함수
	$(function() {
		$(window).scroll(
				function() {
					var WScrollTop = $(window).scrollTop();
					var val = $(document).height() - $(window).height()
							- $("#footer").outerHeight();
					var headerHeight = $('#header').height();

					$(".pd_visual").css('top', -WScrollTop + headerHeight)
				})
	});
	//숫자의 값을 원화의 값에 알맞게 ',' 문자로 3자리수 마다 나누어주는 함수
	//ex 1000000->1,000,000
	Number.prototype.format = function() {
		if (this == 0)
			return 0;
		//3자리수 씩 문자를 자른 다음에 ',' 문자를 붙여준 후 리턴한다 
		var reg = /(^[+-]?\d+)(\d{3})/;
		var n = (this + '');

		while (reg.test(n))
			n = n.replace(reg, '$1' + ',' + '$2');

		return n;
	};
	//문자의 값을 실수로 바꾸어 주는 함수
	String.prototype.format = function() {
		var num = parseFloat(this);
		//현재의 값이 nan값이면 0을 리턴한다
		if (isNaN(num))
			return "0";
		
		return num.format();
	};
	// 페이지의 +,- 버튼을 누르면 자동으로 수량과 가격을 조절해주는 함수
	// 상품의 수량을 조절할 수 있게 해주는 함수로 재고량 이상으로 올라가면 올릴 수 없게 만들었다.
	function change_qty(button) {
		//최소값
		var min_qty = 1;
		//현재 고객이 사고자하는 수량을 id값으로 불러오기
		var this_qty = $("#current_qty").val() * 1;
		//할인가를 id값으로 불러오기
		var basic_price = $("#basic_price").val() * 1;
		//할인가를 원화로 바꾼것을 id값으로 불러오기
		var basic_price_won = $("#basic_price_won").val() * 1;
		//max_qty는 물품의 재고량
		var max_qty = $("#product_stock").val() * 1;
		//-버튼을 누르면
		if (button == "minus") {
			//수량을 1 줄인다
			this_qty -= 1;
			//현재 수량이 최소 수량보다 적으면
			if (this_qty < min_qty) {
				//수량을 1로 만든다
				this_qty = 1;
			}
		//+버튼을 눌렀을 경우
		} else if (button == "plus") {
			//수량을 1 증가 시킨다
			this_qty += 1;
			//현재 사고자하는 수량이 품목의 재고량 보다 많을시
			if (this_qty > max_qty) {
				//재고가 부족합니다 메세지 출력
				alert("재고가 부족합니다.");
				return;
			}
		}
		//총 가격 (달러)
		var show_total_amount = basic_price * this_qty;
		//총 가격 (원화)
		var show_total_amount_won = basic_price_won * this_qty;
		//사고자하는 품목의 수량
		$("#current_qty").val(this_qty);
		//수량을 페이지에 표시
		$("#amount").html(this_qty.format());
		//총 가격(달러)를 페이지에 표시
		$("#total_amount").html(show_total_amount.format());
		//총 가격(원화)를 페이지에 표시
		$("#total_amount_won").html(show_total_amount_won.format());
		//총 가격(달러)를 페이지에 표시
		$("#total_amount2").html(show_total_amount.format());
		//총 가격(원화)를 페이지에 표시
		$("#total_amount_won2").html(show_total_amount_won.format());
	}
	//+,- 버튼으로 수량을 조절하는 것이 아닌 값을 입력하여서 수량이 변경되었을 때 작동하는 함수
	function change_qty2() {
		//현재 사고자하는 품목의 수량
		var this_qty = $("#current_qty").val() * 1;
		//물품의 재고량
		var max_qty = $("#product_stock").val() * 1;
		//물품의 할인가(달러)
		var basic_price = $("#basic_price").val() * 1;
		//물품의 할인가(원화)
		var basic_price_won = $("#basic_price_won").val() * 1;
		//물품의 총 가격(달러)
		var show_total_amount = 0;
		//물품의 총 가격(원화)
		var show_total_amount_won = 0;
		//현재 재고량보다 사고자하는 품목의 수량이 많을시
		if (this_qty > max_qty) {
			//재고가 부족합니다 메세지 출력
			alert("재고가 부족합니다.");
			//수량을 1로 초기화
			this_qty = 1;
		//사고자하는 품목의 수량이 1 이상이고 재고량보다 적을시
		} else if (this_qty > 0 && this_qty < max_qty) {}
		//음수나 문자등 다른 값이 수량에 입력될 시에
		else {
			//수량을 1로 초기화
			this_qty = 1;
		}
		//총 가격(달러)
		show_total_amount = basic_price * this_qty;
		//총 가격(원화)
		show_total_amount_won = basic_price_won * this_qty;
		//사고자하는 품목의 수량
		$("#current_qty").val(this_qty);
		//수량을 페이지에 표시
		$("#amount").html(this_qty.format());
		//총 가격(달러)를 페이지에 표시
		$("#total_amount").html(show_total_amount.format());
		//총 가격(원화)를 페이지에 표시
		$("#total_amount_won").html(show_total_amount_won.format());
		//총 가격(달러)를 페이지에 표시
		$("#total_amount2").html(show_total_amount.format());
		//총 가격(달러)를 페이지에 표시
		$("#total_amount_won2").html(show_total_amount_won.format());
	}
	// 김나형 추가
	// 장바구니에 상품을 추가하는 function
	function go_cart() {
		document.formm.action = "DutyfreeServlet?command=cart_insert";
		document.formm.submit();
	}
</script>
<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<body>
		<main id="container">
			<article id="content" class="productdetail">
				<form method="post" name="formm">
					<section class="pd_area">
						<div class="pd_visual" style="top: 120.05px;">
							<div class="swiper-container swiper_visual">
								<div class="swiper-wrapper">
								<!-- 상품의 이미지 -->
									<div class="swiper-slide">
										<img src="images/${productVO.pImage}" />
									</div>
								</div>
							</div>
							<div class="summary_info">
								<div class="tit">
									<p></p>
									<!-- 상품의 이름 -->
									<strong>${productVO.pName}</strong>
								</div>
								<div class="price">
									<!-- 상품의 할인률 -->
									<span class="upto"> <i>${productVO.pDiscount}</i>%
									</span>
									<ul class="del">
										<!-- 상품의 원가(달러) -->
										<li><del> $${productVO.pPrice}</del>
										<!-- 상품의 할인가(달러) -->
										<li><strong>${productVO.pPriceDc}</strong>
											<p>
												<!-- jstl를 이용하여 상품의 할인가(원화)를 세자리수 마다 ',' 문자를 붙여서 나타내기 -->
												<fmt:formatNumber value="${productVO.pPriceWon}"
													pattern="#,###" />
											</p></li>
									</ul>
								</div>
								<div class="prd_no">
									<ul>
										<!-- 상품의 번호 -->
										<li><em>PRODUCT NO</em>${productVO.pNo}</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="pd_info">
							<div class="purchase_benefits" style="margin-top: 120.05px;">
								<h4>구매혜택</h4>
								<ul class="con">
									<li><strong>
											<!-- 할인율에 대한 설명 툴팁으로 표시 -->
											<p>할인율</p>
											<div class="square_tooltip">
												<a href="javascript:" class="btn">도움말</a>
												<div class="tooltip">
													즉시 할인가가 적용 됩니다. * 아래 표기 된 할인률은 당사 및 브랜드사의 정책에 따라 브랜드별로 상이할
													수 있습니다.
													<button class="close">닫기</button>
												</div>
											</div>
									</strong>
										<!-- 할인율 -->
										<div class="box">할인율 : ${productVO.pDiscount} %</div></li>
								</ul>
							</div>
							<!-- 가격 수량 변경 부분 -->
							<div class="productdetail_cart">
								<div class="selectlist">
									<div class="selectitem">
										<div class="box detailBox">
											<!-- 페이지에서 품목의 수량을 변경시 사용하기 위한 값들을 hidden값으로 넘겨주기 위해 사용 -->
											<!-- 할인가 달러 -->
											<input type="hidden" name="basic_price" id="basic_price" value="${productVO.pPriceDc}" readonly="readonly">
											<!-- 할인가 원화 --> 
											<input type="hidden" name="basic_price_won" id="basic_price_won" value="${productVO.pPriceWon}" readonly="readonly">
											<!-- 재고량 -->
											<input type="hidden" name="product_stock" id="product_stock" value="${productVO.pStock}" readonly="readonly">
											<!-- 물품 번호 -->
											 <!-- 김나형 추가 ) 장바구니에 상품번호 넘겨주는 부분 -->
											<input type="hidden" name="pNo" value="${productVO.pNo}">
											<div class="num_amount">
												<!-- '-'버튼, 누를시 함수 적용-->
												<input value="-" count_range="m" type="button" class="minus" onclick="javascript:change_qty('minus')">
												<!-- 수량 부분, 수량이 자동으로 변하고 값 변경시 함수 적용 -->
												<!-- 김나형 추가 ) 장바구니에 원하는 상품수량 넘겨주는 부분 --> 
												<input type="text" name="cDetailAmount" id="current_qty" value="1" onchange="javascript:change_qty2()"
													style="border: 0 solid black;"> 
												<!-- '+'버튼, 누를시 함수 적용-->	
												<input value="+" count_range="p" type="button" class="plus" onclick="javascript:change_qty('plus')">
													
											</div>
											<dl class="priceInfo">
												<dt>$</dt>
												<!-- 할인가 달러 -->
												<dt id="total_amount">${productVO.pPriceDc}
												</dd>
												<!-- 할인가 원화 -->
												<dd id="total_amount_won">
													<fmt:formatNumber value="${productVO.pPriceWon}"
														pattern="#,###" />
												</dd>
												<dd>원</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="totalamount">
									<div>
										총 <strong id="amount">1</strong> &nbsp;개
									</div>
									<dl>
										<dt>$</dt>
										<!-- 할인가 달러 -->
										<dt id="total_amount2">${productVO.pPriceDc}</dt>
										<!-- 할인가 원화 -->
										<dd id="total_amount_won2">
											<fmt:formatNumber value="${productVO.pPriceWon}"
												pattern="#,###" />
										</dd>
										<dd>원</dd>
									</dl>
								</div>
							</div>
							<!-- 가격 수량 부분 끝-->
							<div class="button_area">
								<div class="square_tooltip maxprice">
									<div class="tooltip" id="maxSvmtInfoPop">
										<ul class="dl_price">
										</ul>
										<button class="close" onclick="closeMaxDcPrc();">닫기</button>
									</div>
								</div>
								<!-- 장바구니로 페이지로 이동 -->
								<a href="javascript:go_cart()" class="addcart">장바구니</a>
								<!-- 주문 페이지로 이동 --> 
								<a href="javascript:addCarts('buy')" class="buynow">바로구매</a>
							</div>
						</div>
					</section>
				</form>
			</article>
		</main>
		<!-- footer 불러오기 -->
		<%@ include file="../include/footer.jsp"%>
	</body>
</div>
</html>