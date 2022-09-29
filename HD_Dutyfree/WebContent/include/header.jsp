<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!-- 헤더 부분 구영모 작성 -->

<!-- 박진수 -->
<!-- 세션의 memId를 가져온다. -->
<%
String memId=(String)session.getAttribute("memId");
%>  
<!-- 박진수 -->
<!-- 회원이 삭제가 된다면 request 객체를 통해 가져와 알림창을 띄운다.  -->
<%
String deleteMember="";
deleteMember=(String)request.getAttribute("delete_success");
if(deleteMember!=null){
%>
<script type="text/javascript">
	alert("회원삭제가 되었습니다.");
</script>
<%} %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	<meta name="title" content="현대백화점인터넷면세점">
    <meta name="description" content="해외명품/화장품/시계/가방, 적립금/할인/쿠폰 등 다양한 혜택, 공동구매/가상착장(AR)서비스 제공">  
    <meta name="metaKeywords" content="현대면세점, 현대백화점인터넷면세점, 현대인터넷면세점, 현대백화점면세점, 현대면세, 인터넷현대면세점, 현대온라인면세점, 현대백화점온라인면세점, 현대백화점DUTYFREE,현대무역센터면세점, 현대무역센터점, 현대동대문면세점, 현대동대문점, 현대인천공항면세점, 현대인천공항점, 면세쇼핑몰, 인터넷면세점, 온라인면세점, 인천공항면세점, 인천공항면세, 공항면세, 공항면세점, 공항쇼핑, dutyfree, 면세할인, 면세점할인, 면세가격, 면세점할인방법, 면세추천, 면세선물, 면세점선물, 면세점선물추천, 현대면세점인도장, 면세점인도장, 면세점상품수령, 쇼핑, 쇼핑몰, 명품쇼핑, 해외여행, 인천공항, 출장, 출국, 신혼여행, 허니문, 여행선물, 선물인터넷면세점주문, 인터넷면세점주문가능시간, 출국3시간전, 출국전쇼핑, 출국전인터넷쇼핑, 쿠폰, 할인쿠폰, 면세쿠폰, 면세점쿠폰, 현대면세점쿠폰, 적립금, 면세점적립금, 면세적립금, 현대면세점적립금,화장품, 향수, 가방, 명품, 해외명품, 브랜드, 면세점주류, 면세점담배, 면세점홍삼, 면세점화장품, 면세점향수, 면세점명품, 면세점시계, 면세점가방, 명품가방, 면세점정품">
    <meta property="og:title" content="현대백화점인터넷면세점">
	<meta property="og:description" content="해외명품/화장품/시계/가방, 적립금/할인/쿠폰 등 다양한 혜택, 공동구매/가상착장(AR)서비스 제공">
	<meta property="og:image" content="https://cdn.hddfs.com/front/images/KO/common/hddfs_og.png">
	<script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/main.ui.js?ver=18"></script>
	<link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">
	
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/makePCookie.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/hash.js?ver=18"></script>
</head>

<header id="header" style="padding:0 50px;">
	<section class="box">
		<!-- 현대 로고를 클릭하면 goMainPage() 함수를 실행 -->
	    <h1 onclick="goMainPage();" style="cursor: pointer;" ><img id = "mainLogo" src="https://cdn.hddfs.com/front/images/KO/common/logo.png?RS=192X40" alt="HYUNDAI DEPARTMENT SHOP - DUTY FREE"></h1>
	    <form name="searchHeader" id="searchHeader" method="get" onsubmit="return false;">
	    <fieldset class="searchfield" >
	    	<legend>통합검색</legend>
	        
	        <div class="mainsearchinput">
		        <input type="search" class="text_search" name="searchTerm" id="basicSearchTerm" maxlength="" value="" placeholder="검색어를 입력해주세요" onkeypress="javascript:if(event.keyCode == 13) { searchHeaderAction();}" onmousedown="dq_setTextbox('1',event);" onfocusin="srchLayer();" onkeydown="dq_setTextbox('1',event);" autocomplete="off"/>
			    <input type="hidden" id="searchType" name="searchType" value="" />   <!-- 검색 타입 구분 -->
			    <input type="hidden" id="searchOrder" name="order" value="" />   		  <!-- 정렬 구분 -->
		    </div>
	        <button class="btn_search" onclick="searchHeaderAction();">검색</button>
	    </fieldset>
	    </form>
	    <!-- 검색 레이어 영역 START -->
    	<div class="advanced_search">
	<div class="tab-action theme_search" id="allSearchArea">
	    <ul class="tab_textmedium" id="searchTabBox" style="display:none">
	        <li id="rcntTab">
	        	<!-- 최근, 인기 검색어 -->
	            <a href="#advanced_search_01">최근 · 인기검색어</a>
	        </li>
	        <li id="brandTab">
	        	<!-- 브랜드 검색 -->
	            <a href="#advanced_search_02">브랜드검색</a>
	        </li>
	    </ul>

	    <div class="adsearch_panel" id="searchLayerList">
	    	<div id="advanced_search_01" class="popular_search">
	    	
	    	</div>
	    	
	    	<div id="advanced_search_02" class="brand_search">
	            <div class="tab-action">
	                <ul class="tab_round">
	                    <li id="default_brand_tab">
	                    	<!-- 검색창을 누르면 brand별로 검색할 수 있게 -->
	                        <a href="#advanced_search_brand_01">BRAND</a>
	                    </li>
	                    <li id="default_category_tab">
	                    	<!-- 검색창을 누르면 category별로 검색할 수 있게 -->
	                        <a href="#advanced_search_brand_02">CATEGORY</a>
	                    </li>
	                </ul>
	                <div id="advanced_search_brand_01">
	                    <div class="sort_wrap">
	                        <div class="tab-action">
	                            <ul class="sortbtn_wrap" id="brandSortBtn">
	                            	<!-- 가나다 순으로 정렬 -->
	                                <li><a href="#brand_sortbtn_01" onclick="switchBranTab('01');">가나다순</a></li>
	                                <!-- ABC 순으로 정렬 -->
	                                <li><a href="#brand_sortbtn_02" onclick="switchBranTab('02');">ABC순</a></li>
	                            </ul>
	                            <div id="brand_sortbtn_01" class="lang_sort on">
	                                <div class="brand_cate">
										<ul id="brandKrList">
											</ul>
		                            </div>
		                            
	                            </div>
	                            <div id="brand_sortbtn_02" class="lang_sort">
		                            <div class="brand_cate">
										<ul id="brandEnList">
											</ul>
		                            </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <div id="advanced_search_brand_02">
	                    <div class="sort_wrap">
	                        <div class="tab-action">
	                            <div id="brand_sortbtn_03" class="lang_sort on">
	                                <div class="brand_cate">
										<ul id="cateList">
											</ul>
		                            </div>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<a href="javascript:" class="search_close">닫기</a>
</div>

<script src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoComplete.js"></script>
<script type="text/javascript">	
//박진수
//goMainPage() : 실행이 되면 메인 페이지로 이동하는 url로 이동한다.
	function goMainPage(){
		location.href="/DutyfreeServlet?command=index";
	}
/* 검색 부분 미구현 추후 개발
		// 검색 조건 클릭시 자동완성 타입 변경
		$(".select_search button").on('click', function(){
			changeSearchTextBox();
		});
		
		// 검색창 클릭시 검색 레이어 호출
		$("#basicSearchTerm, #hashSearchTerm").on('click', function(){
			if( ($("#brandKrList > li").length <1) || ($("#brandEnList > li").length <1)){
				loadBranIcKrList();
			} 
			if($("#brandTab").attr('tabindex') == '0'){
				wiseLogAggr("KR_PC_Common_BrandSearch");
			}else{
				wiseLogAggr("KR_PC_Common_SearchKeyword");
			}
			srchLayer();
		});
		
		$("#default_category_tab > a").click(function(){
			//카테고리 로드
			loadCtgList();
		});
		
		$("#brandTab").on('click', function(){
			wiseLogAggr("KR_PC_Common_BrandSearch");
			$(".tab_round #default_brand_tab a").trigger('click');
		});
		
		$("#rcntTab").on('click', function(){
			wiseLogAggr("KR_PC_Common_SearchKeyword");
		});
		
		$("#default_brand_tab a").on('click', function(){
			wiseLogAggr("KR_PC_Common_BrandSearch_Brand");
		});
		
		$("#default_category_tab a").on('click', function(){
			wiseLogAggr("KR_PC_Common_BrandSearch_Category");
		});
		
	function branAction(branCd){
		$(location).attr('href', ctx_curr+"/dm/bran/brand.do?onlnBranCd="+branCd);
		
 	}
	
	//브랜드 ㄱㄴㄷ > ABC 변경시
	function switchBranTab(type){
		if(type =="02"){
			//ABC 순 조회
			loadBranIcEnList();
		}
		$("#brand_sortbtn_"+type+" > div > ul > li > button").removeClass("on");
		$("#brand_sortbtn_"+type+" > div > ul > li:eq(0) > button").addClass("on");
		$("#brand_sortbtn_"+type+" > div > ul > li > .branTabResult").removeClass("on");		
		$("#brand_sortbtn_"+type+" > div > ul > li:eq(0) > .branTabResult").addClass("on");
	}
	*/
</script>
	    <div class="default_menu">
	    <!-- 박진수 수정 -->
			<!-- 박진수-->
	    	<!-- memId가 null인 경우 로그인이 안됬기 때문에 로그인과 회원가입이 보이게 한다. memId가 null이 아니면
	    	로그인이 됬기 때문에 서비스 이용이 가능하게 한다. 
	     	-->
	      <% if(memId == null){ %> 
	    	<a class="menu_login_join" href="/DutyfreeServlet?command=login_form" id="loginBtn">로그인</a>
	    			<a class="menu_login_join" href="/DutyfreeServlet?command=contract">회원가입</a>	
	    		<%}else{ %> 
	    		<a class="menu_login_join" id="logoutBtn" href="/DutyfreeServlet?command=Logout">로그아웃</a>	
	    		<ul>
	    		<!-- 장바구니로 이동하는 하이퍼링크 -->
	            <li class="item_01">
	                <a href="/DutyfreeServlet?command=cart_list"><strong>장바<br>구니</strong><em id="rwingCartCnt" style="display: none"></em></a>
	            
	            <!-- 주문조회로 이동하는 하이퍼링크 --></li>
	            <li class="item_02">
	                <a href="/DutyfreeServlet?command=order_detail"><strong>주문<br>조회</strong></a>
	            </li>
	            <!-- 마이페이지로 이동하는 하이퍼링크 -->
	            <li class="item_03">
	                <a href="/DutyfreeServlet?command=Update_page"><strong>마이<br>페이지</strong></a>
	            </li>
	            <!-- 고객센터로 이동하는 하이퍼링크 -->
	            <li class="item_04">
	                <a href="/DutyfreeServlet?command=cs_list"><strong>고객<br>센터</strong></a>
	            </li>
	            <!-- 공식 사이트로 이동하는 하이퍼링크 -->
	            <li class="item_05">
	                <a href="https://www.hddfs.com/store/kr/dm/main.do?MG=KR_PC_GNB_HDDFS" target="_blank"><strong>공식<br>사이트</strong></a>
	            </li>
	            <li class="exchange_rate exchageRateTxt"></li>
	        </ul>
	        <%} %>  
	    </div>
</section>
</header>