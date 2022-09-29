<!-- 김가희 생성 -->
<!-- 고객센터 글 작성하는 페이지(고객용) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<!-- 박진수 추가 -->
<!-- 로그인하지 않은 사용자의 접근 막기 -->
<%
	if (memId == null) {
%>
	<script language='javascript'>
		location.href = '/DutyfreeServlet?command=Error';
	</script>

<%
	}
%>

<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<head>
<meta charset="UTF-8">
<title>현대백화점 인터넷면세점</title>
	</head>

	<!-- 작성하기 버튼을 누르면 form이 전송되는 함수 -->
	<script type="text/javascript">
		function fnSaveCoun() {

			document.getElementById('counForm').submit();
		}
	</script>

	<body>
		<main id="container" class="container">
			<section>
				<div class="breadcrumb"></div>
				<div class="lnb_content">
					<!-- 좌측메뉴 include -->
					<%@ include file="/cs/menu.jsp"%>

					<div class="content_wrap">
						<h3 class="h3_type line">1:1상담 문의(회원)</h3>
						<ul class="dot_list mgts">

						</ul>
						<!-- 글이 작성되고 제목&내용이 form이 submit되면 command=cs_write 으로 전송됨 -->
						<form id="counForm" name="counForm" method="post"
							action="DutyfreeServlet?command=cs_write">
							<div class="counsel_write">
								<table class="tb_write01 vm">
									<caption>1:1상담 문의</caption>
									<colgroup>
										<col style="width: 160px">
										<col style="width: auto">
									</colgroup>
									<tbody>
										<tr>
											<!-- request에서 memId를 받아와서 미리 작성해두고, form에도 input hidden값으로 넣는다. -->
											<th scope="row">아이디</th>
											<td>${memId}<input type="hidden" id="wrtrNm"
												name="wrtrNm" value="${memId}" maxlength="20">
											</td>
										</tr>
										<tr>
											<!-- 제목입력 받기  -->
											<th scope="row">제목<em class="essential">*</em></th>
											<td><input type="text" class="required" id="title"
												name="title" value="" placeholder="최대 25자까지 입력 가능합니다."
												style="width: 100%"></td>
										</tr>
										<tr>
											<th scope="row">내용<em class="essential">*</em></th>
											<td>
												<!-- 내용입력 받기 -->
												<div class="textarea_wrap" id="divposition">
													<textarea placeholder="최대 500자까지 입력 가능합니다." id="content"
														name="content" class="required" style="width: 100%;"></textarea>
												</div>
											</td>
										</tr>
									</tbody>
								</table>

								<div class="sh_btn_box">
									<!-- 취소버튼을 누르면 고객센터 게시글목록 화면으로 넘어가게함 -->
									<button type="button" class="btn_basic1" id="cancelCoun"
										onclick="location.href='DutyfreeServlet?command=cs_list'">취소</button>
									<!-- 확인버튼을 누르면 javascript의 fnSaceCoun()함수(form제출)가 실행되도록함 -->
									<button type="button" class="btn_basic2" id="saveCoun"
										onclick="javascript:fnSaveCoun();">확인</button>
								</div>

							</div>
						</form>
						<!-- </div> -->
					</div>
				</div>
			</section>
		</main>
	</body>
	</html>