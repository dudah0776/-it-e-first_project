<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- S : contents -->
<div style="width: 100%; min-width: 1340px; padding-top: 400px;">
	<div class="container">
		<section>
			<div class="error_box login_need">
				<p class="big_txt">
					<i class="ico_com ineed"></i>로그인이 필요한 서비스 입니다.
				</p>
				<p class="small_txt" style="padding-bottom: 10px;">로그인 후 이용해 주세요.</p>
				<a type="button" class="btn_basic2" href="/DutyfreeServlet?command=login_form" style>로그인</a>
			</div>
		</section>
	</div>
</div>
<!-- E : contents -->
</main>
<!-- // container -->
<script type="text/javascript">
	function sellerInfo() {
		$("#seller_information").dialog("open");
	}
	$(document).ready(function() {
		// 다이얼로그 초기화
		$("#seller_information").dialog({
			autoOpen : false,
			resizable : false,
			width : 400,
			maxHeight : 340,
			modal : true
		});
	});
	function moveToMain() {
		location.href = ctx_shop + '/dm/main.do';
	}
</script>
<%@ include file="../include/footer.jsp"%>
