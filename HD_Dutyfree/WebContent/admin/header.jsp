<!-- 김가희 -->
<!-- 관리자 header -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String memId = (String) session.getAttribute("memId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<meta name="title" content="현대백화점인터넷면세점">
<meta name="description"
	content="해외명품/화장품/시계/가방, 적립금/할인/쿠폰 등 다양한 혜택, 공동구매/가상착장(AR)서비스 제공">
<meta name="metaKeywords"
	content="현대면세점, 현대백화점인터넷면세점, 현대인터넷면세점, 현대백화점면세점, 현대면세, 인터넷현대면세점, 현대온라인면세점, 현대백화점온라인면세점, 현대백화점DUTYFREE,현대무역센터면세점, 현대무역센터점, 현대동대문면세점, 현대동대문점, 현대인천공항면세점, 현대인천공항점, 면세쇼핑몰, 인터넷면세점, 온라인면세점, 인천공항면세점, 인천공항면세, 공항면세, 공항면세점, 공항쇼핑, dutyfree, 면세할인, 면세점할인, 면세가격, 면세점할인방법, 면세추천, 면세선물, 면세점선물, 면세점선물추천, 현대면세점인도장, 면세점인도장, 면세점상품수령, 쇼핑, 쇼핑몰, 명품쇼핑, 해외여행, 인천공항, 출장, 출국, 신혼여행, 허니문, 여행선물, 선물인터넷면세점주문, 인터넷면세점주문가능시간, 출국3시간전, 출국전쇼핑, 출국전인터넷쇼핑, 쿠폰, 할인쿠폰, 면세쿠폰, 면세점쿠폰, 현대면세점쿠폰, 적립금, 면세점적립금, 면세적립금, 현대면세점적립금,화장품, 향수, 가방, 명품, 해외명품, 브랜드, 면세점주류, 면세점담배, 면세점홍삼, 면세점화장품, 면세점향수, 면세점명품, 면세점시계, 면세점가방, 명품가방, 면세점정품">
<meta property="og:title" content="현대백화점인터넷면세점">
<meta property="og:description"
	content="해외명품/화장품/시계/가방, 적립금/할인/쿠폰 등 다양한 혜택, 공동구매/가상착장(AR)서비스 제공">
<meta property="og:image"
	content="https://cdn.hddfs.com/front/images/KO/common/hddfs_og.png">
<script
	src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
<script
	src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
<script
	src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
<script
	src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/main.ui.js?ver=18"></script>
<link rel="shortcut icon"
	href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">
<script language="javascript">
	// 현재 요청경로
</script>

<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>
<!-- S: 다이퀘스트 스크립트 추가 -->
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
<!-- E: 다이퀘스트 스크립트 추가 -->
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/makePCookie.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/crew/hash.js?ver=18"></script>
</head>

<header id="header" style="padding: 0 50px;">
	<section class="box">
		<h1 onclick="goMainPage();" style="cursor: pointer;">
			<img id="mainLogo"
				src="https://cdn.hddfs.com/front/images/KO/common/logo.png?RS=192X40"
				alt="HYUNDAI DEPARTMENT SHOP - DUTY FREE">
		</h1>
		<div class="default_menu">
			<!-- 가희 수정 -->
			<%
				if (memId == null) {
			%>
			<script language='javascript'>
				location.href = '/DutyfreeServlet?command=Error';
			</script>

			<%
				} else if (memId.equals("admin")) {
			%>
			<a class="menu_login_join" id="logoutBtn"
				href="DutyfreeServlet?command=Logout">관리자님! 환영합니다 :)</a>
			<%
				} else {
			%>
			<script language='javascript'>
				location.href = '/DutyfreeServlet?command=admin_error';
			</script>
			<%
				}
			%>

			<ul>
				<li class="item_01"><a
					href="DutyfreeServlet?command=admin_order_list"><strong>주문<br>관리
					</strong><em id="rwingCartCnt" style="display: none"></em></a></li>
				<li class="item_02"><a
					href="DutyfreeServlet?command=admin_product_list"><strong>상품<br>관리
					</strong></a></li>
				<li class="item_03"><a
					href="DutyfreeServlet?command=admin_member_list"><strong>회원<br>관리
					</strong></a></li>
				<li class="item_04"><a
					href="DutyfreeServlet?command=admin_cs_list"><strong>고객<br>센터
					</strong></a></li>
			</ul>
		</div>
		<!-- 히든메뉴 START -->
		<script type="text/javascript">
			function commOpenLayer(cookieChkYn, hiddenYn) {
				$
						.ajax({
							async : true,
							url : ctx_curr + "/dm/main/popInfo.json",
							dataType : "json",
							type : "POST",
							success : function(popInfo, textStatus, jqXHR) {
								var data = popInfo.resPop;
								var html = "";
								for (var i = 0; i < data.popSeqList.length; i++) {
									html += "<div class=\"main_popup\" id=\"main_bottom_pop"+data.popSeqList[i].popSeq+"\" data-seq=\""+data.popSeqList[i].popSeq+"\">";
									var addClass = "";
									var addStyle = "";
									if (data.popSeqList[i].popTmplCd == '001') {
										addClass = "popswiper-container";
									} else {
										addClass = "html_wrap";
										addStyle = "style='width:560px; height: 368px;'";
									}
									html += "<div class=\""+addClass+"\" "+addStyle+">";
									if (data.popSeqList[i].popTmplCd == '001') {
										html += "<ul class=\"swiper-wrapper mainPopList\">";
										for (var j = 0; j < data.dataList.length; j++) {
											if (data.popSeqList[i].popSeq == data.dataList[j].popSeq) {
												html += "<li class=\"swiper-slide\">";
												var link = data.dataList[j].linkUrl != null ? data.dataList[j].linkUrl
														: "javascript:";

												var wiseLog = "";
												if (link != "javascript:") {
													if (link.indexOf("?") != -1) {
														wiseLog = "&MG=KR_PC_Main_Popup"
																+ data.popSeqList[i].popSeq
																+ "_"
																+ data.dataList[j].popDtlSeq;
													} else {
														wiseLog = "?MG=KR_PC_Main_Popup"
																+ data.popSeqList[i].popSeq
																+ "_"
																+ data.dataList[j].popDtlSeq;
													}
												}

												if (data.dataList[j].shrtVdoUrl != null) {
													html += "<video preload=\"none\" muted loop class='video-js'  style='width:560px; height:368px; object-fit:cover; background-color: black;'>";
													html += "<source src=\"https://cdn.hddfs.com/files/"+data.dataList[j].shrtVdoUrl+"\" type=\"video/mp4\">";
													html += "<strong>Your browser does not support the video tag.</strong>";
													html += "</video>";
												} else {
													var mainTitl = data.dataList[j].mainTitl != null ? data.dataList[j].mainTitl
															: "";
													var subTitl = data.dataList[j].subTitl != null ? data.dataList[j].subTitl
															: "";
													var bnnrWrd = data.dataList[j].bnnrWrd != null ? data.dataList[j].bnnrWrd
															: "";

													html += "<a href=\""+link+wiseLog+"\"  class='item_wrap'>";
													html += "<div class='pop_txt'>";
													html += "<strong class='cate'>"
															+ mainTitl
															+ "</strong>";
													html += "<p>" + subTitl
															+ "</p>";
													html += "<p>" + bnnrWrd
															+ "</p>";
													html += "</div>";
													html += "<img src=\"https://cdn.hddfs.com/files/"
															+ data.dataList[j].imgUrl
															+ "?RS=750X494\" alt=\""
															+ data.dataList[j].mainTitl
															+ "\">";
													html += "</a>";
												}
												html += "</li>";
											}
										}
										html += "</ul>";
										html += "<div class=\"swiper_control\" id=\"mainPop_"+data.popSeqList[i].popSeq+"\">";
										html += "<div class=\"swiper-pagination\"></div>";
										html += "<div class=\"swiper-prev\"></div>";
										html += "<div class=\"swiper-next\"></div>";
										html += "</div>";
									} else {
										html += data.popSeqList[i].htmlCont;
									}
									html += "</div>";
									html += "<div class=\"close_section\">";
									html += "<span class=\"today_close chk\">";
									html += "<input type=\"checkbox\" class=\"today_close\" id=\"btn_hidden_layer_"
											+ data.popSeqList[i].popSeq
											+ "\" onclick=\"saveMainLayerCookie("
											+ data.popSeqList[i].popSeq
											+ ");\" hiddenYn=\"N\" />";
									html += "<label for=\"btn_hidden_layer_"+data.popSeqList[i].popSeq+"\" style=\"cursor: pointer;\">오늘 하루 보지 않기</label>";
									html += "</span>";
									html += "<span class=\"popup_close\"  data-seq=\""
											+ data.popSeqList[i].popSeq
											+ "\" onclick=\"closeMainLayer("
											+ data.popSeqList[i].popSeq
											+ ");\">닫기</span>";
									html += "</div>";
									html += "</div>";
								}

								$(".mainPopWrap").html(html);
								callMainPopSwiper();

								if (hiddenYn == "Y") {
									$(".hidden_menu").removeClass("open");
									$(".item").slideUp(200);
								}

								if ($(".main_popup").length > 0) {
									$('.modal_wrap').addClass('active'); //팝업 띄우기
								}

								if (cookieChkYn == "Y") {
									// 메인팝업
									$(".main_popup")
											.each(
													function() {
														var seq = $(this).data(
																"seq");
														$(".today_close.chk")
																.show();
														$(
																"#btn_hidden_layer_"
																		+ seq)
																.attr(
																		"hiddenYn",
																		"N");
														if (getCookie("closePop"
																+ seq) == "Y") { // 팝업 오픈
															$(
																	"#main_bottom_pop"
																			+ seq)
																	.remove();
															if ($(".main_popup").length < 1) {
																$('.modal_wrap')
																		.removeClass(
																				'active');
															}
														}
													});
								} else {
									// 메인팝업 오픈
									$(".main_popup").each(
											function() {
												var seq = $(this).data("seq");
												$(".today_close.chk").hide();
												$("#btn_hidden_layer_" + seq)
														.attr("hiddenYn", "Y");
											});
								}

								if (hiddenYn == "Y") {
									$(".ui-resizable").css("position", "fixed")
								}

								$(".main_popup").each(
										function() {
											var seq = $(this).data("seq");
											if ($("#main_bottom_pop" + seq)
													.find("li").length == 1) {
												$("#mainPop_" + seq).hide();
											}
										});

								$(".mainPopList > li").find("video").attr(
										"preload", "");
								$(".mainPopList > li").find("video").attr(
										"autoplay", true);
							}
						});
			}
		</script>
	</section>
</header>