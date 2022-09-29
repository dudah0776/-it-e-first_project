<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>


<script type="text/javascript">
	
</script>


<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<article>
		<div class="brandtit_area">
			<!-- 브랜드 명 -->
			<h2 class="page_tit">설화수</h2>
			<div class="btn_area"></div>
		</div>
		<div class="spacialbanner h720" style="padding-top: 720px;">
			<div class="spacial-swiper">
				<div class="swiper-wrapper">
					<!-- 브랜드 사진 -->
					<img src="images/sulwhasoo.png" style="width: 100%; height: 100%; margin: auto">
				</div>
			</div>
		</div>
	</article>
	<article class="brand_explain">
		<div class="be_logo">
			<!-- 브랜드 로고 
			<img src="images/삼성/logo.png">-->
		</div>
		<div class="be_text">
			<!-- 소개 텍스트 -->
			피부 본연의 건강함을 찾아주는 조화로운 피부 다스림.
			<br>1967년부터 아모레퍼시픽은 한방을 중심으로 한 미용법을 연구해왔고
			<br>1973년 국내 최초로 인삼 사포닌 성분을 함유한 화장품을 출시하였고
			<br>오늘에 이르기까지 수많은 연구를 거듭하여 피부고민의 근본을 다스리는 대한민국 대표 브랜드입니다.
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
