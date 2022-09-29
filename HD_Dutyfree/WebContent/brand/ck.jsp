<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<article>
		<div class="brandtit_area">
			<h2 class="page_tit">캘빈클라인</h2>
			<div class="btn_area"></div>
		</div>
		<div class="spacialbanner h720" style="padding-top: 720px;">
			<div class="spacial-swiper">
				<div class="swiper-wrapper">
					<img src="images/Calvin Klein.png" style="width: 100%; height: 100%;">
				</div>
			</div>
		</div>
	</article>
	<article class="brand_explain">
		<div class="be_logo">
			<img src="images/ck/logo.png">
		</div>
		<div class="be_text">
			“캘빈클라인은 모던함과 젊음을 대표하는 글로벌 라이프스타일 브랜드로<br> <br> 디자이너 의류와 진, 언더웨어, 액세서리와 액티브웨어를 비롯한 다양한 제품을 전개합니다.”<br>
		</div>
	</article>
	<article id="content">
		<section class="mt40 cuopondown_area"></section>
		<section>
			<div class="sorting_wrap">
				<!-- 총 몇개 인지 표시 -->
				<span class="txt_total">총 <strong id="goosListTotCnt">${prodAmount}</strong>개
				</span>
			</div>
		</section>
		<div class="product_list goosMoreArea ">
			<ul>
				<c:forEach items="${ProductBrandList}" var="brandlist">
					<li>
						<!-- 상품 상세 페이지로 이동 --> 	
						<a href="DutyfreeServlet?command=product_detail&pNo=${brandlist.pNo}">
							<div class="img_w">
								<!-- 이미지 출력 -->
								<img src="images/${brandlist.pImage}">
							</div>
							<div class="pro_i">
								<p class="ti_brand">${brandlist.pBrand}</p>
								<p class="tx_ex goosNm">${brandlist.pName}</p>
								<p class="price1" style="height: 19px;">
									<del>$${brandlist.pPrice}</del>
									<strong>${brandlist.pDiscount}%</strong>
								</p>
								<p class="price2">
									<strong>$${brandlist.pPriceDc}</strong> <span><fmt:formatNumber value="${brandlist.pPriceWon}" pattern="#,###" /> <em>원</em></span>
								</p>
								<div class="por_icons"></div>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</article>
</div>