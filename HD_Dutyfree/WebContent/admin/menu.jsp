<!-- 김가희 -->
<!-- 관리자 좌측메뉴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="lnb_wrap">
	<h2>
		<span>관리자메뉴</span>
	</h2>
	<ul class="lnb">

		<li><span>회원관리</span>
			<ul>
				<li><a href='DutyfreeServlet?command=admin_member_list&search=all'>회원목록</a></li>
			</ul></li>
		<li><span>상품관리</span>
			<ul>
				<li><a href="DutyfreeServlet?command=admin_product_list">상품목록</a></li>
			</ul></li>
		<li><span>주문관리</span>
			<ul>
				<li><a href="DutyfreeServlet?command=admin_order_list">주문목록</a></li>
			</ul></li>
		<li><span>고객센터관리</span>
			<ul>
				<li><a href="DutyfreeServlet?command=admin_cs_list">Q&A목록</a></li>
			</ul></li>
		<!-- 구영모 작성  통계 차트로 넘어가는 메뉴 -->
		<li><span>통계</span>
			<ul>
				<li><a href="DutyfreeServlet?command=admin_cs_chart">답변 통계</a></li>
			</ul></li>

	</ul>
	<div class="lnb_bn"></div>
</div>
