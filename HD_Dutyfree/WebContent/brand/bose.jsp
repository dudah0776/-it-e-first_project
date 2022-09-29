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
			<h2 class="page_tit">보스</h2>
			<div class="btn_area"></div>
		</div>
		<div class="spacialbanner h720" style="padding-top: 720px;">
			<div class="spacial-swiper">
				<div class="swiper-wrapper">
					<!-- 브랜드 사진 -->
					<img src="images/bose.png" style="width: 60%; height: 100%; margin: auto">
				</div>
			</div>
		</div>
	</article>
	<article class="brand_explain">
		<div class="be_logo">
			<!-- 브랜드 로고 -->
			<img src="images/보스/logo.png">
		</div>
		<div class="be_text">
			<!-- 소개 텍스트 -->
			미국의 보스(BOSE)사는 명문 대학인 MIT(매사추세츠 공과대학)의 전자공학 교수 이자 
			<br>음향학 박사인 Amar G. BOSE 박사가 1964년에 설립한 세계적인 음향기기 전문 메이커입니다. 
			<br>MIT의 우수한 인재와 연구진을 영입하여 내구력과 가격 대비 성능이 뛰어난 고품질 음향기기를 생산하는 메이커로 유명합니다.
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




