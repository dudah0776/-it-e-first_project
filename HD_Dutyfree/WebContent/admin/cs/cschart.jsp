<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 작성자 구영모 -->
<!-- 설명: 관리자 페이지에서 사용자의 질문에 답변 여부를 파이차트로 나타내주는 페이지 입니다. -->
<!-- servlet으로 답변 여부 값을 받아와 스크립트로 차트 작성 -->
<!-- 관리자 페이지의 헤더 불러오기 -->
<%@ include file="/admin/header.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 헤더와 분리하기 위한 div -->
<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
		<main id="container" class="container">
			<section>
				<div class="breadcrumb"></div>
					<div class="lnb_content">
						<!-- 관리자 페이지의 메뉴바 불러오기 -->
						<%@ include file="/admin/menu.jsp" %>
						<div class="content_wrap">
							<!-- 제목 : 답변 통계 -->
							<h3 class="h3_type line">답변통계</h3>
							<div class="notice_list_wrap">
								<div class="tb_list">
									<!-- 차트 불러오기 -->
									<canvas id="mychart"></canvas>
								</div>
							</div>
						</div>
					</div>
			</section>
		</main>	
</div>
	<!-- foreach문을 사용해 받아온 result 배열의 값으로 답변 여부 체크 -->
	<c:forEach items="${chart}" var="chart" varStatus="status">
		<c:choose>
			<c:when test="${status.index eq 0}">
				<!-- answer_complete id값에 답변 완료된 수의 값을 넣는다 -->
				<input type="hidden" id="answer_complete" value="${chart}">
			</c:when>
			<c:when test="${status.index eq 1}">
				<!-- answer_incomplete id값에 답변 미완료 수의 값을 받는다 -->
				<input type="hidden" id="answer_incomplete" value="${chart}">
			</c:when>
		</c:choose>
	</c:forEach>
	<script type="text/javascript" src="/cs/Chart.js"></script>
	<script type="text/javascript">
		//my 차트의 컨텍스트 값을 가져온다
		var context = document.getElementById("mychart").getContext('2d');
		//답변 완료의 개수를 담는 변수
		var answer_complete = $("#answer_complete").val() * 1;
		//답변 미완료의 개수를 담는 변수
		var answer_incomplete = $("#answer_incomplete").val() * 1;
		//파이차트 생성
		var myChart = new Chart(context, {
			type : 'pie',
			data : {
				//라벨은 답변완료, 답변 미완료 2개로 생성
				labels : [ "답변완료", "답변미완료" ],
				datasets : [ {
					//차트의 색 설정 부분
					backgroundColor : [ "#2ecc71", "#3498db" ],
					hoverBackgroundColor : [ '#2ecc71', "#3498db" ],
					//데이터의 값에 답변 완료, 답변  미완료 수를 넣는다
					data : [ answer_complete, answer_incomplete ]
				} ]
			},
			options : {
				responsive : false
			}
		});
	</script>
</html>