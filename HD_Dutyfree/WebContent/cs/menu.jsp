<!-- 김가희 -->
<!-- 고객센터 좌측메뉴(고객용) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="lnb_wrap">
	<h2>
		<span>고객센터</span>
	</h2>
	<ul class="lnb">
		<li><span>1:1상담 문의</span>
			<ul>
				<!-- Q&A 글 작성하는 화면으로 이동 -->
				<li><a href="DutyfreeServlet?command=cs_write_form">질문하기</a></li>
				<!-- 자기가 쓴 Q&A글 목록보기 화면으로 이동 -->
				<li><a href="DutyfreeServlet?command=cs_Mylist">문의내역</a></li>
			</ul></li>
	</ul>
	<div class="lnb_bn"></div>
</div>