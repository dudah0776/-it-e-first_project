<!--김가희-->
<!-- 고객센터 글상세내용을 보여주는 페이지(관리자용) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 개행문자 적용을 위한코드 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/admin/header.jsp"%>

<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
<head>
<meta charset="UTF-8">
<title>현대백화점인터넷면세점</title>
	</head>
	<!-- 답변 등록버튼 눌렀을때 실행되는 함수 -->
	<script type="text/javascript">
		function insertReply() {
			if (confirm("답변 등록하시겠습니까?")) {
				/* 답변내용이 담긴 form을 제출  */
				document.getElementById('form2').submit();
			} else {
				return;
			}

		}
	</script>


	<body>
		<main id="container" class="container">
			<section>
				<div class="breadcrumb"></div>

				<div class="lnb_content">
					<%@include file="/admin/menu.jsp"%>
					<div class="content_wrap">
						<h3 class="h3_type">1:1 고객 게시판</h3>
						<div class="div_view mgtsl">
							<div class="view_header">
								<p class="title">${csVO.csTitle}</p>
								<p class="day_count">
									<span class="day"> <fmt:formatDate
											value="${csVO.csDate}" type="date" /></span>
								</p>
							</div>
							<div class="view_contents">${csVO.csContent}</div>
						</div>
						<br> <br> <br>

						<!-- csCheck가 1이면(답변완료라면) 답변을 보여준다.
						csCheck가 0이면(답변미완료라면) 답변작성란을 보여준다. -->
						<c:choose>
							<c:when test='${csVO.csCheck=="1"}'>
								<h3>답변</h3>
								<div class="view_contents"
									style="border-top: 1px solid black; padding: 37px 50px">${fn:replace(csVO.csReply, replaceChar, "<br/>")}</div>
							</c:when>
							<c:otherwise>
								<form id="form2" name="form2" method="post"
									action="DutyfreeServlet?command=admin_cs_reply">
									<div class="textarea_wrap">
										<h3>답변달기</h3>
										<textarea placeholder="답변내용을 입력해주세요" id="reply" name="reply"
											maxlength="500" class="required" valmsg="내용을 입력해주세요."></textarea>
										<input type="hidden" name="csNo" value="${csVO.csNo}">
									</div>
								</form>
							</c:otherwise>
						</c:choose>

						<div class="basic_btn_box">
							<c:choose>
								<c:when test='${csVO.csCheck=="0"}'>
									<button type="button" class="btn_basic4"
										onclick="javascript:insertReply()">답변달기</button>
								</c:when>
							</c:choose>
							<button type="button" class="btn_basic4"
								onclick="location.href='DutyfreeServlet?command=admin_cs_list'">목록보기</button>

						</div>
					</div>
				</div>
			</section>
		</main>
	</body>