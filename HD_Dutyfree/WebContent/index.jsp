<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- 구영모 작성 -->
<!-- 메인 페이지 -->
<!-- header 추가 -->
<%@ include file="../include/header.jsp"%>
<html>
<meta charset="UTF-8">
<title>현대백화점인터넷면세점</title>
<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<main id="container">
		<%-- 메인 동영상 및 이미지 --%>
		<article class="keyvisual bannerSwiper ">
			<div class="swiper-wrapper">
				<div class style="background: black; width: 750px; height: 750px; margin-right: 24px;">
					<video src="videos/main1.mp4" preload="" loop="" muted="" style="width: 750px; height: 750px; object-fit: cover;" autoplay="autoplay" class="lazy-hidden"></video>
				</div>
				<div style="overflow: hidden; max-height: 750px;">
					<img src="images/main2.gif" style="margin-bottom: 150px; width: 750px;">
				</div>
			</div>
			<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
		</article>
		<article id="main">
			<%-- 이벤트 슬라이드 배너 --%>
			<section class="brandbanner">
				<div class="box">
					<%-- 현대 백화점 면세점 이벤트 링크 참고 하여 추가 --%>
					<div class="brandbanner-swiper">
						<div class="swiper-wrapper">		
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002725" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220831/98c2f3a8_202208310831283690.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220831/98c2f3a8_202208310831283690.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>현백면 X 널디 콜라보 경품 이벤트</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002613" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220519/98f83fa4_202205191046117880.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220519/98f83fa4_202205191046117880.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>H.COS FACE 가상 메이크업 체험</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002697" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220803/5237efe7_202208031637392090.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220803/5237efe7_202208031637392090.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>H.ACC FACE 가상 피팅 체험</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002280" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220720/60b66cc3_202207201312597510.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220720/60b66cc3_202207201312597510.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>인기 수입 화장품 구매사은 이벤트</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=4&MG=KR_PC_Main_Mainevent_5" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220519/1fcbf4a3_202205191042552850.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220519/1fcbf4a3_202205191042552850.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>수입화장품 CLEARANCE 세일관</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=8" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220602/61f546ac_202206021700267310.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220602/61f546ac_202206021700267310.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>H아울렛</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=12" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220617/6c733a32_202206171630504630.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220617/6c733a32_202206171630504630.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>[크리니크]노란 스폰지로션트리오</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=14" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220714/daa9eb03_202207141357414270.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220714/daa9eb03_202207141357414270.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>[맥] NEW 라이트풀 C³ 출시</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=2" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220519/edb8c949_202205191121268470.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220519/edb8c949_202205191121268470.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>[Estee Lauder] 럭셔리 프래그런스 컬렉션</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=064001&MG=KR_PC_Main_Brand_Banner_064001" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/gd/20220401/513fd31e_202204011323343530.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/gd/20220401/513fd31e_202204011323343530.jpg?RS=160X160" alt="폴라스초이스" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" class="swiper-lazy">
								</span>
									<p>폴라스초이스</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=5" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220519/fc17488b_202205191125041680.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220519/fc17488b_202205191125041680.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>[LA MER] NEW 어드밴스드 트리트먼트 로션</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002620" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220608/846d941f_202206081439177940.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220608/846d941f_202206081439177940.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>아르망 드 브리냑 시내면세점 단독</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.instagram.com/hddfs.official/" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220520/b6e68502_202205201438061770.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220520/b6e68502_202205201438061770.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>#인스타그램</p>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002544" target="_self"> <span class="img"> <img data-srcset="https://cdn.hddfs.com/files/dm/20220907/b6d588b9_202209071729352020.jpg?RS=160X160" data-src="https://cdn.hddfs.com/files/dm/20220907/b6d588b9_202209071729352020.jpg?RS=160X160" src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160" alt="" class="swiper-lazy">
								</span>
									<p>LG생활건강</p>
								</a>
							</div>
						</div>
					</div>
					<div class="swiper-next"></div>
					<div class="swiper-prev"></div>
				</div>
			</section>
			<%-- 럭키딜 배너 : 할인율이 가장 높은 물품 순서대로 productdeatils.java 참고--%>
			<section class="luckyDealMenu">
				<section class="luckybanner">
					<h3>럭키딜</h3>
					<div class="box">
						<div class="luckybanner-swiper swiper-container-initialized swiper-container-horizontal">
							<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-4415.97px, 0px, 0px);">
								<!-- 상품 슬라이드 부분 -->
								<c:forEach items="${DiscountProduct}" var="discount">
									<div class="swiper-slide" data-swiper-slide-index="0">
										<!-- 상품 페이지로 이동하는 링크 상품 번호(pNo)에 맞는 상품페이지로 이동 -->
										<a href="DutyfreeServlet?command=product_detail&pNo=${discount.pNo}"><div>
												<!-- 상품의 할인율, 상품의 이미지 경로로 이미지를 띄운다 -->
												<i class="tnr_font"><em>${discount.pDiscount}</em>%</i><span class="img"><img src="images/${discount.pImage}" /></span>
											</div>
											<dl>
												<!-- 상품의 브랜드 -->
												<dt>${discount.pBrand}</dt>
												<!-- 상품이름 -->
												<dd>${discount.pName}</dd>
											</dl>
											<ul>
												<!-- 상품 원가 -->
												<li><del>$${discount.pPrice}</del>
													<!-- 상품 할인가 달러 -->
													<p>${discount.pDiscount}%</p></li>
												<!-- 상품의 할인율 -->
												<li><strong>$${discount.pPriceDc}</strong>
													<p>
														<!-- [jstl] fmt 샘플로 상품 할인가 원화 표시 -->
														<fmt:formatNumber value="${discount.pPriceWon}" pattern="#,###" />
														<em>원</em>
													</p></li>
											</ul></a>
									</div>
								</c:forEach>
								<!-- 상품 슬라이드 부분 끝 -->
							</div>
							<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
						</div>
						<!-- 다음 배너로 이동하는 버튼 -->
						<div class="swiper-next" tabindex="0" role="button" aria-label="Next slide"></div>
						<!-- 이전 배너로 이동하는 버튼 -->
						<div class="swiper-prev" tabindex="0" role="button" aria-label="Previous slide"></div>
					</div>
				</section>
			</section>
			<%-- 브랜드별 최대할인 : 브랜드별로 각각 할인율이 최대인 상품을 보여주는 배너 --%>
			<section class="hShareMenu">
				<section class="hshare">
					<h3>브랜드별 최대할인</h3>
					<div class="box">
						<div class="hshare-swiper swiper-container-initialized swiper-container-horizontal">
							<div class="swiper-wrapper">
								<!-- 상품 슬라이드 부분 -->
								<c:forEach items="${BrandProduct}" var="brand">
									<div class="swiper-slide" data-swiper-slide-index="0" style="margin-right: 20px;">
										<span class="info">
											<span class="share">&nbsp;</span>
											<span class="discount">
												<!-- 상품의 할인율 -->
												<strong>${brand.pDiscount}%</strong>
											</span>
										</span>
										<!-- 상품 페이지로 이동하는 링크 상품 번호(pNo)에 맞는 상품페이지로 이동 -->
										<a href="DutyfreeServlet?command=product_detail&pNo=${brand.pNo}">
											<div>
												<!-- 상품의 이미지 -->
												<span class="img"><img src="images/${brand.pImage}" style="display: block; width: 100%; height: 252px; overflow: hidden; padding: 20px;"/></span>
											</div>
											<span class="product" style="margin: 13px 5px;">
												<span class="goodnm">
													<!-- 상품의 브랜드 -->
													<strong>${brand.pBrand}</strong></br>
													<!-- 상품이름 -->
													<em>${brand.pName}</em>
												</span>
												<span class="percent">
													<!-- 상품 원가 -->
													<del>$${brand.pPrice}</del>
													<!-- 상품 할인율 -->
													<strong>${brand.pDiscount}%</strong>
												</span>
												<span class="price">
												<!-- 할인가 달러 -->
												<strong>$${brand.pPriceDc}</strong>
												<!-- 할인가 원화 [jstl] fmt 샘플로 상품 할인가 원화 표시 -->							
												<em><fmt:formatNumber value="${brand.pPriceWon}" pattern="#,###" />원</em>
												</span>
											</span>
										</a>
									</div>
								</c:forEach>
								<!-- 상품 슬라이드 부분 끝 -->
							</div>
							<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
						</div>
						<!-- 다음 슬라이드로 이동하는 버튼 -->
						<div class="swiper-next"></div>
						<!-- 이전 슬라이드로 이동하는 버튼 -->
						<div class="swiper-prev"></div>
					</div>
				</section>
			</section>
		</article>
		<!-- 신규 입점 브랜드 : 새로 들어온 브랜드를 소개하고 그 브랜드의 상품을 소개하는 페이지로 이동하는 링크가 있는 배너 -->
		<section class="hashtag hStyleGroup">
			<div class="title">
				<!-- 신규 입점 브랜드를 아코디언 메뉴로 표시 -->
				<h3>신규입점브랜드</h3>
				<img src="images/mainbrand.jpg" alt="신규입점브랜드" class="noImg lazy" /> 
				<a href="javascript:" onclick="openTab('H352');" class="btn"/>OPEN</a>

			</div>
			<div class="tab-action">
				<ul class="tab_round">
					<!-- 신규 입점 브랜드를 아코디언 메뉴로 표시 -->
					<li class="tab_item "><a href="#H3522506_002" onclick="changeHashtagTab('H3522506_002', '3522506')"> 브랜드</a></li>
				</ul>
				<div class="pro_banner">
					<div class="swiper_box module_circle product_module">
						<section class="brandbanner">
							<div class="box">
								<div class="brandbanner-swiper">
									<div class="swiper-wrapper">
										<!-- 신규 입점 브랜드를 아코디언 메뉴로 표시 -->
										<div class="swiper-slide">
											<!-- ck브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=ck" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/ck/image_to_main_ck.png">
											</span>
												<p>캘빈클라인</p>
											</a>
										</div>
										<div class="swiper-slide">
											<!-- gucci브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=gucci" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/gucci.png">
											</span>
												<p>구찌</p>
											</a>
										</div>
										<div class="swiper-slide">
											<!-- nerdy브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=nerdy" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/nerdy.png">
											</span>
												<p>널디</p>
											</a>
										</div>
											<div class="swiper-slide">
											<!-- tomford브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=tomford" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/tomford/mainbrandtomford.png">
											</span>
												<p>톰포드</p>
											</a>
										</div>
											<div class="swiper-slide">
											<!-- 론진브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=론진" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/longines.png">
											</span>
												<p>론진</p>
											</a>
										</div>
											<div class="swiper-slide">
											<!-- 보스브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=보스" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/bose.png">
											</span>
												<p>보스</p>
											</a>
										</div>
											<div class="swiper-slide">
											<!-- 삼성브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=삼성" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/samsung.png">
											</span>
												<p>삼성</p>
											</a>
										</div>
											<div class="swiper-slide">
											<!-- 설화수브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=설화수" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/설화수/mainbrandsulwhasoo.png">
											</span>
												<p>설화수</p>
											</a>
										</div>
											<div class="swiper-slide">
											<!-- 캉골브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=캉골" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/kangol.png">
											</span>
												<p>캉골</p>
											</a>
										</div>
											<div class="swiper-slide">
											<!-- 케라스타즈브랜드 페이지로 이동하는 링크 -->
											<a href="DutyfreeServlet?command=product_brand&brand=케라스타즈" style="display: inline-block; vertical-align: middle;" target="_self">
											<!-- 신규 입점 브랜드 이미지 -->
											<span class="img"> <img src="images/케라스타즈/mainbrandkerastase.png">
											</span>
												<p>케라스타즈</p>
											</a>
										</div>							
									</div>
								</div>
							</div>
<!-- 다음 슬라이드로 이동하는 버튼과 이전 슬라이드로 이동하는 버튼 css 수정 -->							
<style>
.hashtag .swiper-prev {
	width: 40px;
	height: 50px;
	min-height: auto;
	position: absolute;
	top: 126px;
	left: 0;
	cursor: pointer;
	background: url(../../images/KO/common/icon_controller.png) -36px -45px
		no-repeat;
}

.hashtag .swiper-next {
	width: 40px;
	height: 50px;
	min-height: auto;
	position: absolute;
	top: 126px;
	right: 0;
	cursor: pointer;
	background: url(../../images/KO/common/icon_controller.png) -78px -45px
		no-repeat;
}
</style>
							<!-- 다음 슬라이드로 이동하는 버튼 -->
							<div class="swiper-next"></div>
							<!-- 이전 슬라이드로 이동하는 버튼 -->
							<div class="swiper-prev"></div>
						</section>
					</div>
				</div>
		</section>
	</main>
</div>
<!-- footer 추가 -->
<%@ include file="../include/footer.jsp"%>
</html>
